/// @description Insert description here
// You can write your code in this editor
if (state == 1) {
	draw_sprite_ext(spr_flipper_vertical, 1, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
} else if (state == 2) {
	draw_sprite_ext(spr_flipper_vertical, 2, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
} else {
	draw_sprite_ext(spr_flipper_vertical, 0, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
}