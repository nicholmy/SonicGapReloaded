/// @description Insert description here
// You can write your code in this editor
if (state == 0 and (Input.ABCPress or Input.StartPress)) {	
	state++;
	fade_perform(ModeInto, BlendWhite, 1);
	with CharSelect_Selector {
		state = 1;
	}
	audio_play_sound(sfxSpecialWarp, 0, false);
	if (Input.BPress) {
		alarm[1] = 60;
	} else if (Input.APress or Input.CPress or Input.StartPress) {
		alarm[0] = 60;
	}
}