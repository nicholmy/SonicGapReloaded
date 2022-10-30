/// @description Gap Trigger/Success/Fail
// angleWidth determines how strict of an angle you need to jump in the loop for it to count. Based off distance from 180 angle
// Set the angleWidth to 0 for ceiling jumps
// Trigger a gap if a player is heading down and upside-down
if (!onlyEnd and object_check_player(ColTrigger) and Stage.CurrentGapID != gapId and Player.Ysp > 3 and !Player.Grounded)
{
	if ((Player.Facing == 1 and Player.Angle >= 180 and Player.Angle <= 180 + angleWidth) or 
		(Player.Facing == -1 and Player.Angle <= 180 and Player.Angle >= 180 - angleWidth)) {
		gap_trigger_start()
	}
}

/// Upon the player landing, check among all ending triggers for the current gap...
if (!onlyStart and Stage.CurrentGapID == gapId and Player.Grounded and Stage.CurrentTriggerID != triggerId) {
	// If the player is inside one...
	if (object_check_player(ColTrigger)) {
		// Success!
		gap_trigger_success();
	} else {
		// Fail...
		gap_trigger_fail();
	}
}