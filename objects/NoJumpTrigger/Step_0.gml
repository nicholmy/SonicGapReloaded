/// @description Gap Trigger/Success/Fail
if (object_check_player(ColTrigger)) {
	//show_debug_message(string(sign(Player.Xsp)) + " " + string(triggerDirection));
	if (!onlyEnd and Stage.CurrentGapID != gapId and Stage.CurrentTriggerID != triggerId 
	and Player.Grounded and sign(Player.Xsp) == triggerDirection)
	{
		gap_trigger_start()
		failTime = 5;
	}
	
	if (!onlyEnd and Stage.CurrentGapID == gapId and Stage.CurrentTriggerID == triggerId and sign(Player.Xsp) != triggerDirection) {
		gap_trigger_fail(false)
		Player.GapComboInvincible = 0;
	}
}

if (Stage.CurrentGapID == gapId and Stage.CurrentTriggerID == triggerId) {
	if (!Player.GapComboInvincible) {
		Player.GapComboInvincible = 1;
	}
}

/// Check among all ending triggers for the current gap...
if (!onlyStart and Stage.CurrentGapID == gapId and Stage.CurrentTriggerID != triggerId and Player.Grounded) {
	// If the player is inside one...
	if (object_check_player(ColTrigger)) {
		gap_trigger_success();
		Player.GapComboInvincible = 0;
	}
	
}

// If you jump while the gap is going
if (Stage.CurrentGapID == gapId and !Player.Grounded) {
	failTime--;
}

if (Stage.CurrentGapID == gapId and Player.Grounded) {
	failTime = 5;
}

if (Stage.CurrentGapID == gapId and failTime <= 0) {
	gap_trigger_fail();
	Player.GapComboInvincible = 0;
}
