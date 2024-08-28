/// @description Insert description here
// You can write your code in this editor

if (isShaking) {
	draw_sprite(sprite_index, image_number, x + random_range(-1,1), y + random_range(-1,1));
} else {
	draw_self();
}

if (global.DevMode) {
	draw_set_halign(fa_center);
	draw_set_font(Font.FontDefault);
	draw_text(x, y+ 16, string(state) );
	draw_text(x, y+ 32, string(floor(Xsp)) );
}



