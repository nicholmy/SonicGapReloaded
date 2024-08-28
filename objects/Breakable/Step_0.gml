/// @description Act solid or break (Change as needed)

if object_check_object(UFO_Target)
{
	var check = false;
	with UFO_Target {
		if (State == 5) {
			check = true;
		}
	}
	if (check) {
		// Break into pieces here
		audio_sfx_play(sfxObjectDestroy, false);
				
		// Update object
		object_set_unload(false);
		object_set_hitbox(0, 0);
		
		// Clear solidbox
		object_set_solidbox(0, 0, false);
	
		instance_destroy();
	}
}

object_act_solid(true, true, true, false);