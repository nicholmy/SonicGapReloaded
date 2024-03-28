/// @description Gap Trigger/Success/Fail
// Trigger a gap if a player is heading up
if (object_check_player(ColTrigger) and Stage.CurrentGapID != gapId and Player.Ysp < -3 and !Player.Grounded)
{
	gap_trigger_start();
}

if (object_check_player(ColTrigger) and Stage.CurrentGapID == gapId and Stage.CurrentTriggerID == 1 and Player.Grounded and Stage.CurrentGapState == 2)
{
	gap_trigger_success();
}