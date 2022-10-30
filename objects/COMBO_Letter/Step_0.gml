/// @description Set the S Flag for the stage when collected
// You can write your code in this editor

	if object_check_player(ColHitbox) and !State and (Stage.CurrentSONICID = -1 or Stage.CurrentSONICID = SONICID)
	{
		audio_sfx_play(sfxScoreCount, false);
		State = min(State + 1, 1);
		Stage.SONICComboList[comboIndex] = true;
		Stage.CurrentSONICID = SONICID;
	}
	
	if (InactiveTimer > 0) InactiveTimer--;
	
	if (State == 2 and InactiveTimer == 0) {
		State = 0;
	}
visible = State ? false : true;