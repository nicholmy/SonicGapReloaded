/// @description Insert description here
// You can write your code in this editor

draw_self();

if (global.DevMode) {
draw_set_halign(fa_center);
draw_set_font(Font.FontDefault);
draw_text(x, y-16, string(floor(triggeredSpd > 10 ? 2 : 8)));
}



