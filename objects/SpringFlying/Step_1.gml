/// @description Insert description here
// You can write your code in this editor

/// @description Handle Bouncing
animation_play(sprite_index, 2, 0);

// Do collision
object_act_solid(false, true, false, false, false);

if (object_check_player(ColSolidU)) {
	Player.Grounded = false;
	Player.Ysp = Player.HammerState ? -superStrength : -strength;
	Player.Animation = AnimSpring;
	Player.ClimbState = false;
	Player.OnObject = false;
	
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

if (time > 0) {
	y = y - dcos(time) * bounceStrength/2;
	time -= 24;
}*/


