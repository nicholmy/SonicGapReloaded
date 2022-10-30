/// @description Act solid, destroy upon passing point requirement

// Do collision
object_act_solid(true, true, true, false);

if (Stage.GapLevel and Player.Score >= pointRequirement) {
	audio_sfx_play(sfxObjectDestroy, false);
	Camera.ShakeTime = 20;
	Stage.EventMessage = "HEAD TO THE EXIT!"
	Stage.EventTimer = 180;
	instance_destroy();
}


