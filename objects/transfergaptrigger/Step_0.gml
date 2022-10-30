/// @description Gap Trigger/Success/Fail
// State 1 = Player is getting ready to be launched
// State 2 - Player has been launched
// Pass if the player lands in an ending trigger (ones that don't share the same id as the marked one)


// Trigger a gap if a player is heading up
if (object_check_player(ColTrigger)) {
	//show_debug_message(string(sign(Player.Xsp)) + " " + string(triggerDirection));
	if (!onlyEnd and Stage.CurrentGapID != gapId and Stage.CurrentTriggerID != triggerId 
	and Player.Grounded and sign(Player.Xsp) == triggerDirection)
	{
		gap_trigger_start(false)
	}
	
	if (!onlyEnd and Stage.CurrentTriggerID == triggerId and sign(Player.Xsp) != triggerDirection) {
		gap_trigger_fail(false)
	} 
}

// Do this whether the player is in a trigger or not
if (!onlyEnd and Stage.CurrentTriggerID == triggerId and Stage.CurrentGapState = 0 and !Player.Grounded and Player.Ysp < -3) {
	with Stage
	{
		CurrentGapState = 1;
	}
	audio_sfx_play(sfxStarPost, false);
}

// Only the ending triggers can determine pass/fail
if (!onlyStart and Stage.CurrentTriggerID != triggerId and Stage.CurrentGapState = 1 and Player.Grounded) {
	if (object_check_player(ColTrigger)) {
		// Success!
		gap_trigger_success();
	} else {
		// Fail...
		gap_trigger_fail();
	}
}