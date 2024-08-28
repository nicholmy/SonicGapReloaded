/// @description Set the background based on the last zone cleared
// You can write your code in this editor
switch global.LastCourseID
	{
		// Star Station
		case CourseSkyStation1:
			instance_create(x, y, obj_BG_StarStation_Act1);
		break;
		case CourseSkyStation2:
			instance_create(x, y, obj_BG_StarStation_Act2);
		break;
		// Technology Tree
		case CourseTechTree:
			instance_create(x, y, obj_BG_TechTree_Act2);
			instance_create(x, y, PollenMaker_White);
		break;
	}