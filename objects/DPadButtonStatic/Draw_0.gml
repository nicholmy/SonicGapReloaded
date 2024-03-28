/// @description Insert description here
// You can write your code in this editor

switch (keyVal) {
	case 1: {
		if (Input.Up) draw_rectangle(x-17, y-15, x+17, y+15, c_yellow);
		break;
	}
	case 2: {
		if (Input.Down) draw_rectangle(x-17, y-15, x+17, y+15, c_yellow);
		break;
	}
	case 3: {
		if (Input.Left) draw_rectangle(x-17, y-15, x+17, y+15, c_yellow);
		break;
	}
	case 4: {
		if (Input.Right) draw_rectangle(x-17, y-15, x+17, y+15, c_yellow);
		break;
	}
}
draw_self();






