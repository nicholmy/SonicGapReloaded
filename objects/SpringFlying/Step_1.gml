/// @description Setup player collision, handle the spring

// Play the flying animation
animation_play(sprite_index, 2, 0);

// Handle collision only from the top
object_act_solid(false, true, false, false, false);

// Upon player collision...
if (Player.IsAmyHammerJumping and Player.Ysp > 0 and object_check_player(ColHitbox2)) {
	
	player_reset_air(false);
	// Bounce the player up
	Player.Grounded = false;
	Player.Ysp = -superStrength;
	Player.Animation =  AnimHammerSpring;
	Player.ClimbState = false;
	Player.OnObject = false;
	Player.Jumping = false;
	
	audio_sfx_play(sfxSpring, false);
	startBounce = true;
}
else if (object_check_player(ColSolidU)) {
	// Bounce the player up
	Player.Grounded = false;
	Player.Ysp = Player.HammerState ? -superStrength : -strength;
	Player.Animation =  AnimSpring;
	Player.ClimbState = false;
	Player.OnObject = false;
	Player.Jumping = false;
	
	audio_sfx_play(sfxSpring, false);
	startBounce = true;
}



/*if (startBounce) {
	time = 360;
	startBounce = false;
	bounceStrength = strength;
}

if (superBounce) {
	time = 360;
	superBounce = false;
	bounceStrength = superStrength;
}
*/
if (startBounce and time++ > 0) {
	angle++;
	
	if (angle >= 720) { 
		angle = 0
		startBounce = false;
	}
}


