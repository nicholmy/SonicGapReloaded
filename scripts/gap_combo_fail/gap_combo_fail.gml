// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gap_combo_fail(){
	gap_trigger_fail(false);
		
	with Stage {
		for (var i = 0; i < array_length(TempStaleList);i++) {
			TempStaleList[i] = 0;
		}
	
		GapChainCount = 0;
		GapComboTotal = 0;
		ComboTimeLeft = 0;
	}
}