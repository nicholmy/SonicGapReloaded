/// @description Spin if the player runs fast enough through
// You can write your code in this editor

if (spinsLeft > 0 and object_check_player(ColTrigger) and !state and !lockTimer) {
	if (Player.Xsp >= minSpd) {
		state = 1;
		triggeredSpd = abs(Player.Xsp);
		audio_sfx_play(sfxStarPost, false);
		lockTimer = 20;
		alarm[0] = 180;
		
		if (Stage.GapLevel) {
			Stage.GapComboTotal += triggeredSpd > 10 ? 20 : 10;
		
			if (!Stage.ComboTimeLeft) {
				Stage.ComboTimeLeft = Stage.MaxComboTime;
			}
		}
		spinsLeft--;
	}
	
	
}

if (lockTimer > 0) lockTimer--;

if (state == 0) {
	animation_play(spr_obj_gomarker_idle, 8, spinsLeft > 0 ? 0 : 1);
} else {
	var spinSprite = triggeredSpd > 10 ? spr_obj_gomarker_active_good : spr_obj_gomarker_active;
	animation_play(spinSprite, triggeredSpd > 10 ? 2 : 8, 0);
}