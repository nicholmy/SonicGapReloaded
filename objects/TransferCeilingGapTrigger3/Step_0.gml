/// @description Gap Trigger/Success/Fail
// Trigger a gap if a player is heading up
if (object_check_player(ColTrigger) and Stage.CurrentGapID == gapId and Stage.CurrentTriggerID == 1 and Player.Grounded)
{
	with Stage
	{
		CurrentGapState = 2;
		CurrentTriggerID = other.triggerId
	}
}

if (object_check_player(ColTrigger) and Stage.CurrentGapID == gapId and Stage.CurrentTriggerID == 3 and Player.Grounded and Stage.CurrentGapState == 0)
{
	with Stage
	{
		CurrentGapState = 1;
		CurrentTriggerID = other.triggerId
	}
}