/// @description Handle Main Input Events in Char Select
// You can write your code in this editor
if (state == 0 and Input.ABCPress or Input.StartPress) {	
	state++;
	fade_perform(ModeInto, BlendWhite, 1);
	with CharSelect_Selector {
		state = 1;
	}
	audio_play_sound(sfxSpecialWarp, 0, false);
	alarm[0] = 60;
}

if (state == 1 and fade_check(StateMax)) {
	
}

