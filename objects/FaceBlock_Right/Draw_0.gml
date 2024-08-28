/// @description Draw sprite based on state
// You can write your code in this editor

if (state == 0) {
	draw_sprite(spr_faceblock_right_empty, 0, x, y);
} 
else if (state == 1) {
	draw_sprite(spr_faceblock_right_filling, 0, x, y);
}
else {
	draw_sprite(spr_faceblock_right_solid, 0, x, y);
}






