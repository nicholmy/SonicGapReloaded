/// @description Insert description here
// You can write your code in this editor
draw_self();

if (global.DevMode) {
	draw_set_halign(fa_center);
	draw_set_font(Font.FontDefault);
	draw_text(x-70, y, string(state) );
}