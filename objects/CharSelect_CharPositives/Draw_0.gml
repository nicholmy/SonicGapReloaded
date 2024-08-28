/// @description Insert description here
// You can write your code in this editor
	draw_set_font(Font.FontDefault);
	draw_set_color(c_green);

	
	switch global.Character
	{
			case CharSonic:
				draw_text(x, y, "PEELOUT\n\nDROPDASH\n\nSHIELD ABILITIES"); 
			break;
			case CharTails:
				draw_text(x, y, "SIMPLE\n\nEASY FLYING"); 
			break;
			case CharKnuckles:
				draw_text(x, y, "GLIDE\n\nCLIMB WALLS\n\nEASILY BREAKS ROCKS"); 
			break;
			case CharMighty:
				draw_text(x, y, "STOMP MOVE\n\nSPIKE SPECIALIST\n\nREFLECTS PROJECTILES"); 
			break;
			case CharRay:
				draw_text(x, y, "WILD FLIER"); 
			break;
			case CharAmy:
				draw_text(x, y, "LONG REACH\n\nSPRING SPECIALIST\n\nSHIELD ABILITIES"); 
			break;
			default:
				draw_text(x, y, "CHARACTER"); 
			break;
	}