/// @description Display Special Rings Collected, specified by ZoneID
if !showBlink or (showBlink and RenderFlag)
{
	for (var i = 0; i < array_length(flagList); i++) {
		show_debug_message(string(flagList[i]));
		if (global.SpecialRingList2[flagList[i]]) {
			draw_sprite(spr_obj_ring_special, 0, x + 28 * i, y);
		} else {
			draw_sprite(spr_obj_ring_special_disabled, 0, x + 28 * i, y);
		}
	}
	
}







