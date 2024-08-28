/// @description Set the background based on the last map seen
// You can write your code in this editor
switch global.ReturnRoom
	{
		// Star Station
		case Map_SkyStation:
			instance_create(x, y, obj_BG_StarStation_Act2);
		break;
		// Technology Tree
		case Map_TechTree:
			instance_create(x, y, obj_BG_TechTree_Act1_v2);
			instance_create(x, y, PollenMaker_White);
		break;
	}