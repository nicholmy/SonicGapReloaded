// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerGapComboCheck(){
	if (Stage.GapLevel and !GapComboInvincible and Grounded and !Spinning and !Player.InvincibleBonus) {
		if Stage.CurrentSONICID != -1 {
			audio_sfx_play(sfxHurtSpike, false);
			with COMBO_Letter {
				if (Stage.CurrentSONICID == SONICID) {
					State = 2;
					InactiveTimer = 60;
				}
			}
			Stage.CurrentSONICID = -1;
			for (var i = 0; i < 5; i++) {
				Stage.SONICComboList[i] = false; 
			}
		}
		if (Stage.ComboTimeLeft > 0) Stage.ComboTimeLeft--;
		if (Stage.ComboTimeLeft <= 0) gap_combo_end(true);
	}
}