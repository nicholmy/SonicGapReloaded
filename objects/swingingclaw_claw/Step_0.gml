/// @description Handle the free and circular swing modes

if(object_check_player(ColTrigger) and !isGrabbing and lockTimer == 0 and !Player.Death and !Player.Hurt){
	isGrabbing = true;	
	swingMode = 0;
	XSpeed = Player.Xsp;
	YSpeed = Player.Ysp;
	audio_sfx_play(sfxGrab, false);
	show_debug_message("Swing Mode: " + string(swingMode))
	show_debug_message("Initial XSpeed: " + string(XSpeed))
	show_debug_message("Initial YSpeed: " + string(YSpeed))
}

// rotAngle of 90 is down, 270 is up. So calculate in the other direction (counterclockwise)
// swingMode of 0 is the free swing, when the player initially is grabbed
// swingMode of 1 is the circular swing, after the chain hits its max length
if (swingMode == 0) {
	// Predict where the claw will be next step
	var nextClawDist = point_distance(baseX, baseY, x + XSpeed, y + YSpeed)
	var curClawAng = point_direction(baseX, baseY, x + XSpeed, y + YSpeed)
	
	// If the claw would move out the chain...
	if (nextClawDist > chainLength) {
		// You hit the edge of the chain so basically cap your movement
		x = baseX + dcos(curClawAng) * chainLength
		y = baseY - dsin(curClawAng) * chainLength
		
		//show_debug_message("Dist: " + string(nextClawDist))
		//show_debug_message("Angle: " + string(curClawAng))
		
		if (curClawAng > 0 && curClawAng < 180) {
			YSpeed += 0.25
		
			x += XSpeed
			y += YSpeed
		} else {
			swingMode = 1
			rotAngle = curClawAng
			var rotBonus = rotSpeed + XSpeed * dcos(rotAngle) - YSpeed * dsin(rotAngle)
			show_debug_message("Switch to Swing Mode 1");
			show_debug_message("XSpeed: "  + string(XSpeed))
			show_debug_message("YSpeed: "  + string(YSpeed))
			show_debug_message("Rotation Speed: " + string(rotBonus))
			rotSpeed = rotBonus
			
		}
	} else {
		YSpeed += 0.25
		
		x += XSpeed
		y += YSpeed
	}
}

if (swingMode == 1) {
	var restAngle = 270
	//if (abs(rotAngle - restAngle) < 1) rotSpeed = 0;
	
	x = baseX + dcos(rotAngle) * chainLength
	y = baseY - dsin(rotAngle) * chainLength
	
	if (isGrabbing) {
		// The player can influence the chain, but eventually gravity will get more intense
		if (Input.Right) {
			rotAngle += playerSpeed
			//rotSpeed -= 0.2
		} else if (Input.Left) {
			rotAngle -= playerSpeed
			//rotSpeed += 0.2
		}
	}

	// Accelerate towards rest thanks to gravity
	if (rotAngle > 90 && rotAngle < restAngle) {
		rotSpeed += 0.2
	} else {
		rotSpeed -= 0.2
	}

	// Friction (so the pendulum doesn't endlessly swing back and forth
	if (rotSpeed > 0.05) rotSpeed = rotSpeed - 0.05
	else if (rotSpeed < -0.05) rotSpeed = rotSpeed + 0.05
	else rotSpeed = 0

	// Cap the overall rotation speed so it doesn't get out of control
	rotSpeed = clamp(rotSpeed, -1 * rotSpdMax, rotSpdMax)

	rotAngle += rotSpeed

	// Make sure rotation stays between 180 and 360
	rotAngle = clamp(rotAngle, 180, 360)
	
	XSpeed = -1 * rotSpeed * dsin(rotAngle)
	YSpeed = -1 * rotSpeed * dcos(rotAngle)
	
	
}

if (Player.Death || Player.Hurt) {
	isGrabbing = false;
}

if (isGrabbing) {
	image_index = 1;

	Player.PosX = x + playerOffsetX;
	Player.PosY = y + playerOffsetY;
	
	// Cancel whatever the player is doing and reset them to a state that prevents mid-air actions (except Sonic for now)
	Player.Xsp = 0;
	Player.Ysp = 0;
	Player.Animation = AnimSpin;
	//Player.BarrierIsActive = true;
	Player.DropdashFlag = DashLocked;
	Player.FlightState	  = false;
	Player.Jumping = false;
	Player.Spinning	  = true;
	Player.ClimbState = false;
	Player.GlideState = false;
	audio_sfx_stop(sfxFlying);
	audio_sfx_stop(sfxTired);
	// Reset gravity
	if !Player.IsUnderwater
	{
		Player.Grv	= 0.21875;
	}
	else
	{
		// Reduce by 0x28 (0.15625) if underwater
		Player.Grv = 0.0625
	}
	
	// Getting out of the grab state
	if (Input.ABCPress) {
		Player.Xsp = XSpeed;
		Player.Ysp = clamp(YSpeed + Player.Jump, -Player.TopAcc, Player.Jump);
		//par_character.YSpeed = min(YSpeed + par_character.JumpStrength, par_character.JumpStrength);
		//show_debug_message("Jump XSpeed: " + string(par_character.XSpeed))
		//show_debug_message("Jump YSpeed: " + string(par_character.YSpeed))
		Player.BarrierIsActive = false;
		Player.DropdashFlag = DashReady;
		Player.Jumping = true;
		
		isGrabbing = false;
		lockTimer = 30;
		audio_sfx_play(sfxJump, false);
	}
} else {
	image_index = 0;
}

if (lockTimer > 0) lockTimer--;
