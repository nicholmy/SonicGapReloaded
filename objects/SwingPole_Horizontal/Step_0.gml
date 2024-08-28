/// @description Insert description here
// You can write your code in this editor

if (object_check_player(ColHitbox)) {
	if (state == 0 and Player.Ysp > 0 and Player.Ysp > swingMin and !Player.Death and !Player.Hurt) {
		audio_sfx_play(sfxGrab, false);
		state = 1;
		swingProgress = 0;
		swingDirection = 1;
	
		Player.Animation = AnimSwing;
		swingSpeed = Player.Ysp;
		Player.Xsp = 0;
		Player.Ysp = 0;
	}
	
	if (state == 0 and Player.Ysp < 0 and Player.Ysp < -swingMin and !Player.Death and !Player.Hurt) {
		audio_sfx_play(sfxGrab, false);
		state = 1;
		swingProgress = 0;
		swingDirection = -1;
	
		Player.Animation = AnimSwing;
		swingSpeed = Player.Ysp;
		Player.Xsp = 0;
		Player.Ysp = 0;
	}

	/*if (!isSwinging and LockTimer == 0 and Player.Xsp < 0 and Player.Xsp < -swingMin and !Player.Death and !Player.Hurt) {
			audio_sfx_play(sfxGrab, false);
			isSwinging = true;
			swingProgress = -90;
	
			swingChar = par_character;
			swingChar.Action = ActionPoleSwing;
			swingChar.Animation = "SWING";
			swingSpeed = swingChar.XSpeed;
			swingChar.XSpeed = 0;
			swingChar.YSpeed = 0;
	}*/
}

/// @description Swing! (And Release)
if (state == 1) {
	// Move the char's center point to the pole
	Player.PosY = y;
	Player.Xsp = 0;
	Player.Ysp = 0;
	Player.Gsp = 0;
	
	
	//Set a control lock (the way you face changes the way the swing looks)
	Player.AllowMovement = false;
	Input.IgnoreInput	= true;
	
	// Set the angle of the swing
	Player.Animation = AnimSwing;
	var adjustedSwing = (swingProgress + 720) mod 360;
	
	Player.image_index = floor(6 * (adjustedSwing / 360.0));
	Player.VisualAngle = 90;
	Player.Facing = 1;
	if ((swingProgress mod 360) > 90 and (swingProgress mod 360) < 180) object_set_depth(Player, false);
	else object_set_depth(Player, true);
	
	// Move the swing
	// Regardless of direction, swingspeed needs to be positive
	swingProgress += abs(swingSpeed) * 2
	
	if (swingProgress >= 720) {
		state = 2;
		
		if (!Player.Grounded) {
			player_reset_air(false);
			Player.Ysp = sign(swingSpeed) * clamp(abs(swingSpeed) + 2, 10, 16);
		}
		
		// Release the control lock
		Player.AllowMovement = true;
		Input.IgnoreInput	= false;
		
		// Lock the pole for a bit so you can't immediately hit it again
		alarm[0] = 5
	}
	
	if (Player.Death or Player.Hurt) {
		state = 2;
		Player.AllowMovement = true;
		Input.IgnoreInput	= false;
		
		// Lock the pole for a bit so you can't immediately hit it again
		alarm[0] = 5
	}
}