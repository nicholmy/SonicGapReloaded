/// @description Insert description here
// You can write your code in this editor

if (object_check_player(ColTrigger)) {
	if (state == 0 and Player.Grounded) {
		state = 1;
		audio_sfx_play(sfxSwitch, false);
		
		with UFO_Cannon {
			//if (ufoID == other.ufoID) {
			increment = other.increment
			alarm[0] = 1;
			//}
		}
	}
}

if (state == 1 and !object_check_player(ColTrigger)) {
	state = 0;
}