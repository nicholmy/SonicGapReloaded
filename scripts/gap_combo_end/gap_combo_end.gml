// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gap_combo_end(isLoud = true){
	with Stage {
		if (GapChainCount > 0 and isLoud) audio_sfx_play(sfxScoreTally, false);
		
		Player.Score += GapComboTotal;
		
		for (var i = 0; i < array_length(TempStaleList);i++) {
			GapStaleList[i] += TempStaleList[i];
			TempStaleList[i] = 0;
		}
		
		if (GapChainCount > HighestChain) {
			HighestChain = GapChainCount;
		}
		
		GapChainCount = 0;
		GapComboTotal = 0;
		ComboTimeLeft = 0;
	}
}