/// @description Insert description here
// You can write your code in this editor

if (state == 0) animation_play(spr_train_stoplight_green, 2, 0);
else if (state == 1) animation_play(spr_train_stoplight_yellow, 2, 0);
else animation_play(spr_train_stoplight_red, 2, 0);

draw_self();
if (global.DevMode) {
	draw_set_halign(fa_center);
	draw_set_font(Font.FontDefault);
	draw_text(x+20, y-24, string(Train_Timer.timer) );
}