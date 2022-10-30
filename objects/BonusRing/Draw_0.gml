/// @description Handle blinking when time is low
// You can write your code in this editor
if isBlinking and !(decayTimeLeft mod 3) and decayTimeLeft > 0
{
	image_alpha = !image_alpha;
} else {
	image_alpha = 1;
}

draw_self();

