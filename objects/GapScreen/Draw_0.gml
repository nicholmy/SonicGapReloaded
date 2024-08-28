/// @description Draw
// You can write your code in this editor
	
	if State == 3
	{
		return;
	}
	
	// Set text properties
	draw_set_font(Font.FontCard);
	draw_set_halign(fa_center);
	
	var CentreX	= global.Width  / 2;
	var CentreY = global.Height / 2;
	var ShiftY  = floor(Offset[3]);
	
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
		case CharRay:
			var Text1 = "RAY____GOT____A";
		break;
		case CharAmy:
			var Text1 = "AMY____GOT____A";
		break;
		default:
			var Text1 = "CHARACTER____GOT____A";
	}
	var Text2 = "SPECIAL____RING";
			
	draw_text(CentreX + Offset[0], CentreY - 44 + ShiftY, Text1);
	draw_text(CentreX + Offset[1], CentreY - 20 + ShiftY, Text2);
			
	draw_sprite(gui_results_score,     0, CentreX - 80 + 22 + Offset[4], CentreY + 35);
	draw_sprite(gui_results_ringbonus, 0, CentreX - 80 + 42 + Offset[5], CentreY + 51);
	draw_sprite(gui_results_chainbonus, 0, CentreX - 84 + 42 + Offset[5], CentreY + 67);
	draw_sprite(gui_results_coolbonus, 0, CentreX - 80 + 42 + Offset[5], CentreY + 83);
	draw_sprite(gui_results_target,     0, CentreX - 80 + 26 + Offset[4], CentreY + 99);
	
	// Display counters
	draw_set_font(Font.FontDigits1);
	draw_set_halign(fa_right);

	draw_text(CentreX + 80 + Offset[4], CentreY + 28, global.Score);
	draw_text(CentreX + 80 + Offset[5], CentreY + 44, global.RingBonus);
	draw_text(CentreX + 80 + Offset[5], CentreY + 60, global.ChainBonus);
	draw_text(CentreX + 80 + Offset[5], CentreY + 76, global.CoolBonus);
	draw_text(CentreX + 80 + Offset[4], CentreY + 92, global.LastScoreTarget);
	
	// Display emeralds
	if RenderFlag
	{
		/*for (var i = 0; i < global.Emeralds; i++)
		{
			draw_sprite(tex_sstage_reward, i, CentreX - 58 + 20 * i, CentreY);
		}
		
		for (var i = 0; i < array_length(global.SpecialRingList[global.LastZoneCleared]); i++) {
			if (global.SpecialRingList[global.LastZoneCleared][i]) {
				draw_sprite(spr_obj_ring_special, 0, CentreX - 110 + 28 * i, CentreY);
			} else {
				draw_sprite(spr_obj_ring_special_disabled, 0, CentreX - 110 + 28 * i, CentreY);
			}
		}*/
		
		/*
		for (var i = 0; i < array_length(global.SpecialRingList[global.LastZoneCleared]); i++) {
			if (global.SpecialRingList[global.LastZoneCleared][i]) {
				draw_sprite(spr_obj_ring_special, 0, CentreX - 90 + 28 * i, CentreY - 32);
			} else {
				draw_sprite(spr_obj_ring_special_disabled, 0, CentreX - 90 + 28 * i, CentreY - 32);
			}
		}
		
		for (var i = 0; i < array_length(global.RedRingList[global.LastZoneCleared]); i++) {
			if (global.RedRingList[global.LastZoneCleared][i]) {
				draw_sprite(spr_obj_redring, 0, CentreX - 48 + 28 * i, CentreY);
			} else {
				draw_sprite(spr_obj_redring_disabled, 0, CentreX - 48 + 28 * i, CentreY);
			}
		}*/
		
	}
	
	draw_sprite(spr_obj_ring_special, 0, CentreX + 128 + Offset[2], CentreY + 92);
	if global.SpecialRingList[global.LastZoneCleared][global.LastRingCleared+1]
		draw_sprite(spr_obj_checkmark, 0, CentreX + 128 + Offset[2], CentreY + 92);
	
	
	
	