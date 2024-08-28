/// @description Insert description here
// You can write your code in this editor

if (global.DevMode) {
	draw_set_font(Font.FontMenu);
	draw_set_halign(fa_center);

	draw_text(x, y+24, string(state));	
}
draw_self();







