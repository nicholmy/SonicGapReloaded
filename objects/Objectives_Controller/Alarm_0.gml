/// @description Go to Destination
// You can write your code in this editor

switch global.LastCourseID
	{
			case CourseSkyStation1:
				room_goto(Stage_StarStation);
			break;
			case CourseSkyStation2:
				room_goto(Stage_StarStation2); 
			break;
			case CourseTechTree:
				room_goto(Stage_TechTree1); 
			break;
			/*
			case CourseVividVoyage:
				draw_text(x, y, "VIVID VOYAGE"); 
			break;
			case CourseBackwardBurrow:
				draw_text(x, y, "BACKWARD BURROW"); 
			break;
			case CourseFinal:
				draw_text(x, y, "FINAL"); 
			break;
			*/
			default:
				room_goto(Map_SkyStation); 
			break;
	}
