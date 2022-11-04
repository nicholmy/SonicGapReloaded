/// @description Draw all rings for this zone
// You can write your code in this editor
for (var i = 0; i < array_length(global.SpecialRingList[zoneID]); i++) {
	if (global.SpecialRingList[zoneID][i] >= 2) {
		draw_sprite(spr_obj_ring_special, 0, x + 28 * i, y);
	} else {
		draw_sprite(spr_obj_ring_special_disabled, 0, x + 28 * i, y);
	}
}


