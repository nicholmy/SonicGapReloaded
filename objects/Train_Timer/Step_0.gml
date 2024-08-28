/// @description Insert description here
// You can write your code in this editor
if (!Stage.IsPaused and Stage.TimeEnabled) timer = ++timer mod 450;


if (timer == 100) {
	with Train_Stoplight {
		state = 1;
	}
} else if (timer == 250) {
	with Train_Stoplight {
		state = 2;
	}
} else if (timer == 0) {
	with Train_Stoplight {
		state = 0;
	}
}
if (timer > 100 and timer < 250) {
	state = 1;
} else if (timer >= 250 and timer < 320) {
	state = 2;
} else {
	state = 0;
}