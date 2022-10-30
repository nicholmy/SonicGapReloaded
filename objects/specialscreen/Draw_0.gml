/// @description Draw
// You can write your code in this editor
	
	if !global.SpecialState or State == 3
	{
		return;
	}
	
	// Set text properties
	draw_set_font(Font.FontCard);
	draw_set_halign(fa_center);
	
	var CentreX	= global.Width  / 2;
	var CentreY = global.Height / 2;
	var ShiftY  = floor(Offset[3]);
	
	// Display win messages
	if global.SpecialState == 1
	{
		// All emeralds
		if global.Emeralds == 7
		{
			// State 1, first message
			if !State
			{
				switch global.Character
				{
					case CharSonic:
						var Text1 = "SONIC____GOT____ALL";
					break;
					case CharTails:
						var Text1 = "TAILS____GOT____ALL";
					break;
					case CharKnuckles:
						var Text1 = "KNUCKLES____GOT____ALL";
					break;
					case CharMighty:
						var Text1 = "MIGHTY____GOT____ALL";
					break;
					default:
						var Text1 = "CHARACTER____GOT____ALL";
				}
				var Text2 = "SPECIAL____RINGS";
			}
			
			// State 2, second message
			else
			{
				switch global.Character
				{
					case CharSonic:
					{
						var Text1 = "NOW____SONIC____CAN";
						var Text2 = "BE____SUPER____SONIC";
					}
					break;
					case CharTails:
					{
						var Text1 = "NOW____TAILS____CAN";
						var Text2 = "BE____SUPER____TAILS";
					}
					break;
					case CharKnuckles:
					{
						var Text1 = "NOW____KNUCKLES____CAN";
						var Text2 = "BE____SUPER____KNUCKLES";
					}
					break;
					default:
					{
						var Text1 = "NOW____CHARACTER____CAN";
						var Text2 = "BE____SUPER____CHARACTER";
					}
				}				
			}
			
			draw_text(CentreX + 12 + Offset[0], CentreY - 44 + ShiftY, Text1);
			draw_text(CentreX + 12 + Offset[1], CentreY - 20 + ShiftY, Text2);
		}
		
		// Collecting emeralds...
		else
		{
			switch global.Character
			{
				case CharSonic:
					var Text1 = "SONIC____GOT____A";
				break;
				case CharTails:
					var Text1 = "TAILS____GOT____A";
				break;
				case CharKnuckles:
					var Text1 = "KNUCKLES____GOT____A";
				break;
				case CharMighty:
					var Text1 = "MIGHTY____GOT____A";
				break;
				default:
					var Text1 = "CHARACTER____GOT____A";
			}
			var Text2 = "SPECIAL____RING";
			
			draw_text(CentreX + Offset[0], CentreY - 44 + ShiftY, Text1);
			draw_text(CentreX + Offset[1], CentreY - 20 + ShiftY, Text2);
		}
	}
	
	// Display lose messages
	else if global.SpecialState == 2
	{
		draw_text(CentreX + Offset[1], CentreY - 20 + ShiftY, "SPECIAL____STAGE");
	}
	/*
	draw_sprite(gui_results_score,     0, CentreX - 80 + 22 + Offset[4], CentreY + 35);
	draw_sprite(gui_results_ringbonus, 0, CentreX - 80 + 42 + Offset[5], CentreY + 51);
	
	// Display counters
	draw_set_font(Font.FontDigits1);
	draw_set_halign(fa_right);

	draw_text(CentreX + 80 + Offset[4], CentreY + 33, global.Score);
	draw_text(CentreX + 80 + Offset[5], CentreY + 49, global.SpecialScore);
	*/
	
	// Display emeralds
	if RenderFlag
	{
		for (var i = 0; i < array_length(global.SpecialRingList[global.LastZoneCleared]); i++) {
			if (global.SpecialRingList[global.LastZoneCleared][i]) {
				draw_sprite(spr_obj_ring_special, 0, CentreX - 110 + 28 * i, CentreY);
			} else {
				draw_sprite(spr_obj_ring_special_disabled, 0, CentreX - 110 + 28 * i, CentreY);
			}
		}
	}