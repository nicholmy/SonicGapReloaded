/// @description Insert description here
// You can write your code in this editor
	draw_set_halign(fa_center);
	draw_set_font(Font.FontCard);
	draw_set_color(c_white)

	
	switch global.LastCourseID
	{
			case CourseSkyStation1:
				draw_text(x, y, "SKY STATION A"); 
			break;
			case CourseSkyStation2:
				draw_text(x, y, "SKY STATION B"); 
			break;
			case CourseTechTree:
				draw_text(x, y, "TECHNOLOGY TREE"); 
			break;
			case CourseVividVoyage:
				draw_text(x, y, "VIVID VOYAGE"); 
			break;
			case CourseBackwardBurrow:
				draw_text(x, y, "BACKWARD BURROW"); 
			break;
			case CourseFinal:
				draw_text(x, y, "FINAL"); 
			break;
			default:
				draw_text(x, y, "FILLER"); 
			break;
	}