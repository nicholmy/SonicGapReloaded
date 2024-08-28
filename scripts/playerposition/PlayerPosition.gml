function PlayerPosition() 
{
	if !AllowMovement
	{
		return;
	}
	
	PosX += Xsp;
	PosY += Ysp;
	
	if !Grounded and AllowGravity
	{
		Ysp += Grv;
	}
	
	// Remember player's position for the previous 32 frames
	// Should do this regardless so other things can move the player and get positions recorded
	ds_list_delete(RecordedPosX, 31);
	ds_list_delete(RecordedPosY, 31);
	ds_list_insert(RecordedPosX, 0, PosX);
	ds_list_insert(RecordedPosY, 0, PosY);
}