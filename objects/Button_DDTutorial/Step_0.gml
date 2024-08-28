/// @description Insert description here
// You can write your code in this editor

if (object_check_player(ColTrigger)) {
	if (state == 0 and Player.Grounded) {
		state = 1;
		audio_sfx_play(sfxSwitch, false);
		
		with Door {
			if (doorID == other.doorID) alarm[0] = 1;
		}
	}
}

if (state == 1 and !object_check_player(ColTrigger)) {
	alarm[0] = 85;
	state = 0;
}