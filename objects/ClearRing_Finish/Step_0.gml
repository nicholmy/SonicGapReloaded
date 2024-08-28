/// @description Trigger on player contact
if (!Stage.IsFinished) {
	animation_play(sprite_index, 8, 0);
} else {
	animation_play(sprite_index, 2, 0);
}
if (object_check_player(ColHitbox) and !Stage.IsFinished) {
	//PlaySound(snd_scoring_largeGap, global.SFXVolume, 1, 1);
	audio_sfx_play(sfxEmerald, false);	
	Stage.IsFinished = 1;
	
	speed = 2;
	direction = 90;
	
	image_speed *= 2;
	alarm[0] = 20;
	
		
	audio_bgm_stop(AudioPrimary,   0.5);
	audio_bgm_stop(AudioSecondary, 0.5);
	
	if (!isCollected) {
		global.SpecialRings++;
		//global.SpecialRingList[zoneID][ringID] = 2;
		global.SpecialRingList2[ringID] = 1;
	}
	
	global.LastZoneCleared = zoneID;
	global.LastCourseID = courseID;
	global.LastTimeCleared = Stage.Time;
	global.LastScoreTarget = Stage.ScoreTarget;
	//global.LastRingCleared = ringID;
	global.Score			= Player.Score;
	global.Rings		= Player.Rings;
	
	Player.Animation = AnimSpin;
	//global.Emeralds++;
	//global.SpecialState = 1;
	//global.SpecialScore = 10000;
}
