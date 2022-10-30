/// @description Trigger on player contact
if (!State) {
	animation_play(sprite_index, 8, 0);
} else {
	animation_play(sprite_index, 2, 0);
}
if (object_check_player(ColHitbox) and !State) {
	//PlaySound(snd_scoring_largeGap, global.SFXVolume, 1, 1);
	audio_sfx_play(sfxGapMedium, false);	
	State = 1;
	
	speed = 2;
	direction = 90;
	
	image_speed *= 2;
	alarm[0] = 20;
	
	// Register red ring as collected
	global.RedRings++;
	global.RedRingList[zoneID][ringID] = true;
}