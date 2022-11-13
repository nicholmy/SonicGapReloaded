/// @description Draw the Laser!
/// ooooh yes we're cheating by resetting the shader, can't draw lines with the main shader
shader_reset();
var lx = x-1;
var ly = y + distance;

draw_set_color(color1);
draw_line_width(lx, y, lx, ly, (height * 8) + 0.1);
draw_circle(lx, ly, 6, false);


draw_set_color(color2);
draw_line_width(lx, y, lx, ly, (height * 4) + 0.1);
draw_circle(lx, ly, 4, false);

draw_set_color(color3);
draw_line_width(lx, y, lx, ly, (height * 2) + 0.1);
draw_circle(lx, ly, 2, false);

shader_set(ShaderMain);
draw_self();
draw_set_color(c_white);
if (global.DevMode) {
	draw_set_halign(fa_center);
	draw_set_font(Font.FontDefault);
	draw_text(x, y, string(distance));
}