// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gap_trigger_start(isLoud = true){
	if (isLoud) audio_sfx_play(sfxStarPost, false);
	
	with Stage
	{
		CurrentGapID = other.gapId
		CurrentGapName = GapNameList[CurrentGapID]
		CurrentTriggerID = other.triggerId
		CurrentGapType = other.gapType;
		CurrentGapState = 0;
		// 5 secs to clear the gap, triggers can refresh the timer as needed
		CurrentGapTimer = 300;
	}
}