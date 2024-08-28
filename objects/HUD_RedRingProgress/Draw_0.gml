/// @description Display Red Rings Collected, specified by ZoneID
if !showBlink or (showBlink and RenderFlag)
{
	/*for (var i = ZoneID * 10; i < ZoneID * 10 + 10; i++) {
		if (global.RedRingList2[i]) {
			draw_sprite(spr_obj_redring, 0, x + 32 * i, y);
		} else {
			draw_sprite(spr_obj_redring_disabled, 0, x + 32 * i, y);
		}
	}*/
	// Assuming each zone has 10 red rings always
	for (var i = 0; i < 10; i++) {
		if (global.RedRingList2[ZoneID * 10 + i]) {
			draw_sprite(spr_obj_redring, 0, x + 32 * i, y);
		} else {
			draw_sprite(spr_obj_redring_disabled, 0, x + 32 * i, y);
		}
	}
}





