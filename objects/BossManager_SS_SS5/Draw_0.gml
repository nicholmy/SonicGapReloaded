/// @description Insert description here
// You can write your code in this editor
if (global.DevMode) {
	draw_set_halign(fa_center);
	draw_set_font(Font.FontDefault);
	draw_text(x, y, string(state));
	draw_text(x, y-32, string(switchTimer));
}