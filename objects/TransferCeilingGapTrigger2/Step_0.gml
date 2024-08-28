/// @description Gap Trigger/Success/Fail
// Trigger a gap if a player is heading up
if (object_check_player(ColTrigger) and Stage.CurrentGapID == gapId and Stage.CurrentTriggerID == 0 and Player.Grounded)
{
	with Stage
	{
		CurrentGapState = 1;
		CurrentTriggerID = other.triggerId
	}
}

if (object_check_player(ColTrigger) and Stage.CurrentGapID == gapId and Stage.CurrentTriggerID == 2 and !Player.Grounded and Stage.CurrentGapState == 1)
{
	with Stage
	{
		CurrentGapState = 2;
		CurrentTriggerID = other.triggerId
	}
}