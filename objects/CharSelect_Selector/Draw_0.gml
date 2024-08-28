/// @description Draw the characters in a circle
// You can write your code in this editor

var totalChars = 6;

for (var i = 0; i < totalChars; i++) {
	var Angle = charAngles[i];
	var CurCharacter = i;

	var xDraw = x + circleRadius * dcos(Angle);
	var yDraw = y - circleRadius * dsin(Angle);

	switch CurCharacter
	{
		case CharSonic:
			draw_sprite(spr_sonic_idle, 3, xDraw, yDraw);
		break;
		case CharTails:
			draw_sprite(spr_tails_tail_idle, 0, xDraw, yDraw+4);
			draw_sprite(spr_tails_idle, 11, xDraw, yDraw+4);
		break;
		case CharKnuckles:
			draw_sprite(spr_knuckles_idle, 28, xDraw, yDraw);
		break;
		case CharMighty:
			draw_sprite(spr_mighty_goal, 10, xDraw, yDraw);
		break;
		case CharRay:
			draw_sprite(spr_ray_idle, 19, xDraw, yDraw-1);
		break;
		case CharAmy:
			draw_sprite(spr_amy_goal, 13, xDraw, yDraw);
		break;
	}
	
	
}

if (state == 1) blinkFlag = !blinkFlag;

if (blinkFlag)
{
	draw_circle(x + circleRadius,  y, 48, c_white);
}