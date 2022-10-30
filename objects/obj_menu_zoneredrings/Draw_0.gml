/// @description Draw all rings for this zone
// You can write your code in this editor
for (var i = 0; i < array_length(global.RedRingList[zoneID]); i++) {
	if (global.RedRingList[zoneID][i]) {
		//draw_sprite(spr_obj_redring, 0, x + 36 * i, y);
		draw_sprite_ext(spr_obj_redring, 0, x + 18 * i, y, 0.5, 0.5, 0, image_blend, image_alpha);
	} else {
		//draw_sprite(spr_obj_redring_disabled, 0, x + 36 * i, y);
		draw_sprite_ext(spr_obj_redring_disabled, 0, x + 18 * i, y, 0.5, 0.5, 0, image_blend, image_alpha);
	}
}


