/// @description Insert description here
// You can write your code in this editor
draw_self();

draw_set_font(Font.FontDefault);
draw_set_halign(fa_center);

draw_text(x, y-64, messageTop);
draw_text(x, y+64, messageBottom);