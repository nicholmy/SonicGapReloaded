// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gap_trigger_success(){
	
	with Stage
	{		
		// If this is the first trick in the chain, start the combo timer
		if (GapChainCount <= 0) {
			ComboTimeLeft = MaxComboTime;
		}
		
		var baseScore = GapScoreList[CurrentGapID];
		var pointsAwarded = ceil(baseScore * (1 - min((GapStaleList[CurrentGapID] + TempStaleList[CurrentGapID]) * 0.25, 0.9)));
		var scoreObj = instance_create(Player.x, Player.y, ScoreObject_Gap);
		if (baseScore <= 200) {
			audio_sfx_play(sfxSwitch, false);
			scoreObj.SpriteFrame = 2;
		} else if (baseScore <= 500) {
			audio_sfx_play(sfxGapMedium, false);
			scoreObj.SpriteFrame = 3;
		} else {
			audio_sfx_play(sfxGapLarge, false);
			scoreObj.SpriteFrame = 4;
		}
		
		// Add points to the total amt so far
		GapComboTotal += pointsAwarded;
		
		// Stale the move by 1
		TempStaleList[CurrentGapID]++;
		
		// Add 1 to the chain
		GapChainCount++;
		
		// Reset the current gap
		CurrentGapID = -1;
		CurrentTriggerID = -1;
		CurrentGapName = "";
		CurrentGapState = -1;
		CurrentGapType = -1;
	}
}