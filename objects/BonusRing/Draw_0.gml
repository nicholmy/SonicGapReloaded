/// @description Handle blinking when time is low

if isBlinking and !(decayTimeLeft mod 3) and decayTimeLeft > 0
{
	image_alpha = !image_alpha;
} else {
	image_alpha = 1;
}

draw_self();

