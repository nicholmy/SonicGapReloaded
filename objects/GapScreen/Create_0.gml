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
	Offset[4]  =  300;
	Offset[5]  =  330;
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
	
	switch global.LastZoneCleared
	{
		// Star Station
		case 0:
		case 1:
			instance_create(x, y, obj_BG_StarStation_Act3);
		break;
		// Technology Tree
		case 2:
			instance_create(x, y, obj_BG_TechTree_Act2);
			instance_create(x, y, PollenMaker_White);
		break;
	}