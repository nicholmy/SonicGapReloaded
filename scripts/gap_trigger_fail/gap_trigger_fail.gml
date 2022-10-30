// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gap_trigger_fail(isLoud = true){
	// Fail...
	if (isLoud) audio_sfx_play(sfxHurt, false);
	
	with Stage
	{
		CurrentGapID = -1;
		CurrentTriggerID = -1;
		CurrentGapName = "";
		CurrentGapState = -1;
		CurrentGapType = -1;
	}
}