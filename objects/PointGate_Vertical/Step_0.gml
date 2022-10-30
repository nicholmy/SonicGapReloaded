/// @description Insert description here
// You can write your code in this editor

// Do collision
object_act_solid(true, true, true, false);

if (Stage.GapLevel and Player.Score >= pointRequirement) {
	audio_sfx_play(sfxObjectDestroy, false);
	Camera.ShakeTime = 20;
	instance_destroy();
}


