/// @description Trigger on player contact
//isCollected = (global.SpecialRingList[zoneID][ringID] == 2)
isCollected = (global.RedRingList2[ringID] == 1)

if (!Stage.IsFinished) {
	animation_play(sprite_index, 8, 0);
} else {
	animation_play(sprite_index, 2, 0);
}
if (object_check_player(ColHitbox) and !Stage.IsFinished and !Player.Death and !Player.Hurt) {
	//PlaySound(snd_scoring_largeGap, global.SFXVolume, 1, 1);
	audio_sfx_play(sfxEmerald, false);	
	Stage.IsFinished = 1;
	speed = 1;
	direction = 90;
	
	image_speed *= 2;
	alarm[0] = 45;
	
		
	audio_bgm_stop(AudioPrimary,   0.5);
	audio_bgm_stop(AudioSecondary, 0.5);
	
	global.SpecialState = 1;
	global.InSpecialStage = false;
	//global.SpecialScore = 10000;
}
