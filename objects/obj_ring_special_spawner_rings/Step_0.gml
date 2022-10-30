/// @description Insert description here
// You can write your code in this editor

animation_play(sprite_index, 8, 0);

if ((SpecialStage_Base.SpecialStageType == 1 or SpecialStage_Base.SpecialStageType == 3) and SpecialStage_Base.RingsLeft <= 0) {
	//freeze_frames(250);
	audio_sfx_play(sfxSpecialRing, false);
	var ring = instance_create(x, y, obj_ring_special);
	ring.zoneID = zoneID;
	ring.ringID = ringID;
	instance_destroy();
}
