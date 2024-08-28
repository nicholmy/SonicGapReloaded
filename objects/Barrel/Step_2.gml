/// @description Handle basic enter/exit states
// You can write your code in this editor
if (state == 1) {
	Player.PosX = x;
	Player.PosY = y;
	Player.Xsp = 0;
	Player.Ysp = 0;
	Player.Animation = AnimSpin;
	Player.Spinning = true;
	player_reset_air(false);
	
	Camera.Target = id;
	
}

if (state == 1 and (Player.Hurt or Player.Death)) {
	Camera.Target = Player;
	state = 2;
	alarm[0] = cooldownLength;
}
// Children barrels need to handle exit methods