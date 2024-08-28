/// @description Insert description here
// You can write your code in this editor
	draw_set_font(Font.FontDefault);
	draw_set_color(c_red);

	
	switch global.Character
	{
			case CharSonic:
				draw_text(x, y, "NO FLYING"); 
			break;
			case CharTails:
				draw_text(x, y, "SLOW FLYING"); 
			break;
			case CharKnuckles:
				draw_text(x, y, "LOW JUMP"); 
			break;
			case CharMighty:
				draw_text(x, y, "NO FLYING"); 
			break;
			case CharRay:
				draw_text(x, y, "DIFFICULT TO USE"); 
			break;
			case CharAmy:
				draw_text(x, y, "NO FLYING"); 
			break;
			default:
				draw_text(x, y, "NOT PLANNED OUT"); 
			break;
	}