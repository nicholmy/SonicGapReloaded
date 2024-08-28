/// @description Insert description here
// You can write your code in this editor
	draw_set_font(Font.FontCard);
	draw_set_color(c_white)


	
	switch global.Character
	{
			case CharSonic:
				draw_text(x, y, "SONIC"); 
			break;
			case CharTails:
				draw_text(x, y, "TAILS"); 
			break;
			case CharKnuckles:
				draw_text(x, y, "KNUCKLES"); 
			break;
			case CharMighty:
				draw_text(x, y, "MIGHTY"); 
			break;
			case CharRay:
				draw_text(x, y, "RAY"); 
			break;
			case CharAmy:
				draw_text(x, y, "AMY"); 
			break;
			default:
				draw_text(x, y, "CHARACTER"); 
			break;
	}