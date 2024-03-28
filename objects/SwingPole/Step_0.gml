/// @description State handling
// You can write your code in this editor

if (object_check_player(ColHitbox)) {
	if (state == 0 and Player.Xsp > 0 and Player.Xsp > swingMin and !Player.Death and !Player.Hurt) {
		audio_sfx_play(sfxGrab, false);
		state = 1;
		swingProgress = -90;
		swingDirection = 1;
	
		Player.Animation = AnimSwing;
		swingSpeed = Player.Xsp;
		Player.Xsp = 0;
		Player.Ysp = 0;
	}
	
	if (state == 0 and Player.Xsp < 0 and Player.Xsp < -swingMin and !Player.Death and !Player.Hurt) {
		audio_sfx_play(sfxGrab, false);
		state = 1;
		swingProgress = -90;
		swingDirection = -1;
	
		Player.Animation = AnimSwing;
		swingSpeed = Player.Xsp;
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
	Player.PosX = x;
	Player.Xsp = 0;
	Player.Ysp = 0;
	Player.Gsp = 0;
	Player.GapComboInvincible = 1;
	
	//Set a control lock (the way you face changes the way the swing looks)
	Player.AllowMovement = false;
	Input.IgnoreInput	= true;
	
	// Set the angle of the swing
	Player.Animation = AnimSwing;
	var adjustedSwing = (swingProgress + 720) mod 360
	Player.image_index = floor(6 * (adjustedSwing / 360.0));
	if ((swingProgress mod 360) > 90 and (swingProgress mod 360) < 180) object_set_depth(Player, false);
	else object_set_depth(Player, true);
	
	// Move the swing
	// Regardless of direction, swingspeed needs to be positive
	swingProgress += abs(swingSpeed) * 2
	
	if (swingProgress >= 720) {
		state = 2;
		//swingChar.y = y + 24;
		//swingChar.Ground = 1;
		//swingChar.Action = swingChar.KeyDown ? ActionRolling : ActionNormal
		//Player.Animation = AnimSpin;
		//Player.Spinning = true;
		if (!Player.Grounded) {
			player_reset_air(false);
			Player.Xsp = sign(swingSpeed) * clamp(abs(swingSpeed) + 4, 10, 16);
		}
		else {
			with Player {
				PosY     += DefaultRadiusY - SmallRadiusY;
				RadiusY   = SmallRadiusY;
				RadiusX	  = SmallRadiusX;
				Spinning  = true;
				Animation = AnimSpin;
				Gsp = sign(other.swingSpeed) * clamp(abs(other.swingSpeed) + 4, 10, 16);
			}

			audio_sfx_play(sfxRoll, false);
		}
		// Release the control lock
		Player.AllowMovement = true;
		Input.IgnoreInput	= false;
		Player.GapComboInvincible = 0;
		
		// Lock the pole for a bit so you can't immediately hit it again
		alarm[0] = 5
		
		//Player.Xsp = sign(swingSpeed) * clamp(abs(swingSpeed) + 2, 10, 16);
	}
	
	if (Player.Death or Player.Hurt) {
		state = 2;
		Player.AllowMovement = true;
		Input.IgnoreInput	= false;
		Player.GapComboInvincible = 0;
		
		// Lock the pole for a bit so you can't immediately hit it again
		alarm[0] = 5
	}
}