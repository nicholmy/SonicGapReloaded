/// @description Flip the sprite
// You can write your code in this editor
if (Ysp > 0) {
	image_yscale = -1;
}
else if (Ysp < 0) {
	image_yscale = 1;
}
draw_self();