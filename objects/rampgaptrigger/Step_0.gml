/// @description Gap Trigger/Success/Fail
// Trigger a gap if a player is heading up
if (!onlyEnd and object_check_player(ColTrigger) and Stage.CurrentGapID != gapId and Player.Ysp < -3 and !Player.Grounded)
{
	gap_trigger_start();
}

/// Upon the player landing, check among all ending triggers for the current gap...
if (!onlyStart and Stage.CurrentGapID == gapId and Player.Grounded and Stage.CurrentTriggerID != triggerId) {
	// If the player is inside one...
	if (object_check_player(ColTrigger)) {
		gap_trigger_success();
	} else {
		gap_trigger_fail();
	}
}