/// @description Gap Trigger/Success/Fail
if (object_check_player(ColTrigger) and Stage.CurrentGapID == gapId and Stage.CurrentTriggerID == 2 and Player.Grounded)
{
	gap_trigger_success();
}


// Trigger a gap if a player is heading up
if (object_check_player(ColTrigger) and Stage.CurrentGapID != gapId and Player.Ysp < -3 and !Player.Grounded and Stage.CurrentGapState != 0)
{
	gap_trigger_start();
}


