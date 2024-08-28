/// @description Draw button name for input
// You can write your code in this editor
draw_set_font(Font.FontMenu);
draw_set_halign(fa_center);

var Key = global.KeyboardControl;

draw_text(x+8, y, menu_get_keyname(Key[KeyValue]));