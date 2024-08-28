/// @description Startup
// You can write your code in this editor
	
	State       = 0;
	RoomTimer   = 0;
	RenderFlag  = 0;
	RenderAlpha = 0;

	Offset[0]  = -330; // xxx GOT A
	Offset[1]  =  330; // SPECIAL RING
	Offset[2]  =  330; // Bonus Special Ring
	Offset[3]  =  0;
	Offset[4]  =  400;
	Offset[5]  =  430;
	RenderFlag = -1;
		
	audio_bgm_play(AudioPrimary, ActClear);
	
	// Else redirect to Special Stage
	/*else 
	{
		switch global.Emeralds
		{
			default:
				room_goto(Screen_SStage);
		}
		fade_perform(ModeInto, BlendWhite, 0);
	}*/
	
	