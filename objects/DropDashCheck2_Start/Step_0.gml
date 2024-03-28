/// @description Insert description here
// States:
// 0 - Looking for crouch
// 1 - Crouch done, looking for spindash
// 2 - Cleared
if (object_check_player(ColTrigger)) {
	//var dropdashstart = Player.DropdashFlag;
	if (state == 0) {
		Stage.EventMessage = "DROP DASH FROM THE PLATFORM!"
		Stage.EventTimer = 300;
	} else if (state == 1) {
		Stage.EventMessage = "OVER THE SPIKES..."
		Stage.EventTimer = 300;
	}
	
	if (state == 0 and !Player.Grounded) {
		state = 1;
	}
	
	if (state == 1 and Player.DropdashFlag == 1 and Player.DropdashRev >= 20) {
		with (DropDashCheck2_End) {
			if (object_check_player(ColTrigger)) {
				other.state = 1;
				with Door {
					if (doorID == other.doorID) alarm[0] = 1;
				}
				Stage.EventMessage = "COOL!"
				Stage.EventTimer = 300;
				audio_sfx_play(sfxStarPost, false);
			}
		}
		
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




