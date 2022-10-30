/// @description Gap Trigger/Success/Fail
if (object_check_player(ColTrigger)) {
	//show_debug_message(string(sign(Player.Xsp)) + " " + string(triggerDirection));
	if (!onlyEnd and Stage.CurrentGapID != gapId and Stage.CurrentTriggerID != triggerId 
	and !Player.Grounded and sign(Player.Xsp) == triggerDirection)
	{
		gap_trigger_start()
	}
	
	if (!onlyEnd and Stage.CurrentTriggerID == triggerId and sign(Player.Xsp) != triggerDirection) {
		gap_trigger_fail(false)
	} 
}

/// Upon the player landing, check among all ending triggers for the current gap...
if (!onlyStart and Stage.CurrentGapID == gapId and !Player.Grounded and Stage.CurrentTriggerID != triggerId) {
	// If the player is inside one...
	if (object_check_player(ColTrigger)) {
		gap_trigger_success()
	}
	
}

// If you touch the ground at all while the gap is going
if (!onlyStart and Stage.CurrentGapID == gapId and Player.Grounded and Stage.CurrentTriggerID != triggerId) {
	gap_trigger_fail()
}