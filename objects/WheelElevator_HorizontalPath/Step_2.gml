/// @description Lock the elevator's position at the ends
// You can write your code in this editor
if (wheel.state == 1 or wheel.state == 2) {
	if (wheel.x < x) {
		wheel.x = x;
		Player.PosX = x;
	}
	


	if (wheel.x > x + distance) {
		wheel.x = x + distance;
		Player.PosX = x + distance;
	}
}

if (wheel.state == 3 and wheel.x == x) {
	wheel.state = 0;
}



