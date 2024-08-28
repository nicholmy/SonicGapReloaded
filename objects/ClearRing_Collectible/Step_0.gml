/// @description Trigger on player contact
if (!state) {
	animation_play(sprite_index, 8, 0);
} else {
	animation_play(sprite_index, 2, 0);
}
if (object_check_player(ColHitbox) and !state) {
	audio_sfx_play(sfxEmerald, false);	
	state = 1;
	
	speed = 1;
	direction = 90;
	
	image_speed *= 2;
	alarm[0] = 45;
	
		
	//audio_bgm_stop(AudioPrimary,   0.5);
	//audio_bgm_stop(AudioSecondary, 0.5);
	
	if (!isCollected) {
		global.SpecialRings++;
		//global.SpecialRingList[zoneID][ringID] = 2;
		global.SpecialRingList2[ringID] = 1;
	}
	/*
	global.LastZoneCleared = zoneID;
	global.LastRingCleared = ringID;
	global.LastTimeCleared = Stage.Time;
	global.LastScoreTarget = Stage.ScoreTarget;
	
	Player.Animation = AnimSpin;
	*/
	//global.Emeralds++;
	//global.SpecialState = 1;
	//global.SpecialScore = 10000;
}
