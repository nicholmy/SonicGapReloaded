/// @description Startup
// You can write your code in this editor
	
	State       = 0;
	RoomTimer   = 0;
	RenderFlag  = 0;
	RenderAlpha = 0;
	

	Offset[0]  = -330;
	Offset[1]  =  330;
	Offset[2]  =  24;
	Offset[3]  =  0;
	Offset[4]  =  300;
	Offset[5]  =  330;
	RenderFlag = -1;
	
	TallyStart = false;
		
	audio_bgm_play(AudioPrimary, ActClear2);
	
	switch global.LastZoneCleared
	{
		// Star Station
		case 0:
			instance_create(x, y, obj_BG_StarStation_Act3);
		break;
		// Technology Tree
		case 1:
			instance_create(x, y, obj_BG_TechTree_Act1);
		break;
		// Vivid Voyage
		case 2:
			instance_create(x, y, obj_BG_VividVoyage_Act2);
		break;
	}