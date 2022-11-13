/// @description Insert description here
// States:
// 0 - Looking for crouch
// 1 - Crouch done, looking for spindash
// 2 - Cleared
if (object_check_player(ColTrigger)) {
	var crouching = Player.Animation == AnimCrouch;
	var spindashing = Player.Animation == AnimSpindash;
	if (state == 0) {
		Stage.EventMessage = "DO A SPINDASH!"
		Stage.EventTimer = 5;
	} else if (state == 1) {
		Stage.EventMessage = "ALMOST THERE..."
		Stage.EventTimer = 5;
	}
	if (state == 0 and crouching) {
		state = 1;
		audio_sfx_play(sfxStarPost, false);
	} else if (state == 1 and spindashing) {
		state = 2;
		with Door {
			if (doorID == other.doorID) alarm[0] = 1;
		}
		Stage.EventMessage = "COOL!"
		Stage.EventTimer = 300;
		audio_sfx_play(sfxStarPost, false);
	} else if (state == 1 and !crouching) {
		state = 0;
		audio_sfx_play(sfxHurt, false);
	}
}

/*
if (state == 0 and object_check_player(ColTrigger) and crouching) {
	state = 1;
	
}

if (state == 1 and object_check_player(ColTrigger) and (!crouching or !spindashing)) {
	state = 0;
	audio_sfx_play(sfxHurt, false);
}

if (state == 1 and object_check_player(ColTrigger) and Player.Animation == AnimSpindash) {
	state = 2;
	with Door {
		if (doorID == 0) alarm[0] = 1;
	}
	audio_sfx_play(sfxStarPost, false);
}
*/




