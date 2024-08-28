/// @description Insert description here
// You can write your code in this editor

if (state == 0 and object_check_player(ColTrigger)) {
	state++;
	fade_perform(ModeInto, BlendBlack, 1);
}

if (state == 1) {
	// Fade to black and increment state
	if fade_check(StateMax)
	{
		state++;
		alarm[0] = 60
	}
}