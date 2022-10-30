/// @description Defeat all enemies to spawn ring
// You can write your code in this editor

animation_play(sprite_index, 8, 0);

if (SpecialStage_Base.SpecialStageType == 2 and SpecialStage_Base.EnemiesLeft <= 0) {
	audio_sfx_play(sfxSpecialRing, false);
	var ring = instance_create(x, y, obj_ring_special);
	ring.zoneID = zoneID;
	ring.ringID = ringID;
	//freeze_frames(250);
	instance_destroy();
}
