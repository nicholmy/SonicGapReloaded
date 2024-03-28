/// @description Act solid or break

if object_check_player(ColHitbox2) and global.Character == CharAmy and (Player.Animation == AnimHammerSpring or Player.Animation == AnimHammerRush)
{

	// Break into pieces here
	audio_sfx_play(sfxObjectDestroy, false);
				
	// Update object
	object_set_unload(false);
	object_set_hitbox(0, 0);
		
	// Clear solidbox
	object_set_solidbox(0, 0, false);
	
	instance_destroy();
} else {
	object_act_solid(true, true, true, false);
}

