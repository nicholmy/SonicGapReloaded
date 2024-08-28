/// @description Handle hanging
// You can write your code in this editor

if (object_check_player(ColHitbox) and Player.Ysp > 0 and !Player.Hanging and Active) {
	player_reset_air(false);
	Player.Hanging = true;
	Player.GlideState = false;
	Player.FlightState = false;
	Player.Animation = AnimHang;
	Player.Ysp = 0;
	Player.Xsp = 0;
	//Player.PosX = x + PlayerXOffset;
	Player.PosY = y;
	
	//PlayerXOffset = clamp(Player.PosX - x, -16, 16);
	PlayerXOffset = Player.PosX - x;
	audio_sfx_play(sfxGrab, false);
	isAttached = true;
}

if (isAttached) {
	Player.Ysp = 0;
	
	//Player.PosX = x + PlayerXOffset;
	//Player.PosY = y;
	Player.DropdashFlag = -1;
	Player.DropdashRev = -1;
	
	if (Input.Left) {
		Player.Xsp = -moveSpd;
	} else if (Input.Right) {
		Player.Xsp = moveSpd;
	} else {
		Player.Xsp = 0;
	}
	
	if (Player.Hurt or Player.Death) {
		Player.Hanging = false;
		isAttached = false;
		Player.AllowMovement = true;
	}
}

if (isAttached and Input.ABCPress) {
	isAttached = false;
	Player.Hanging = false;
	Player.AllowMovement = true;
	Player.DropdashFlag = -1;
	
	Player.Ysp = -4;
	if (Input.Down) Player.Ysp = 1;
	if (Input.Up) {
		Player.Ysp = -7;
	}
	
	Player.Xsp = 0;
	
	player_reset_air(false);
	
	Active = false;
	alarm[0] = 15;
	if (!Input.Down) { audio_sfx_play(sfxJump, false); }
}

if (isAttached and 
	((Player.Xsp > 0 and Player.x > x + sprite_width/2) or 
	(Player.Xsp < 0 and Player.x < x - sprite_width/2))) {
	isAttached = false;
	Active = false;
	
	player_reset_air(false);
	alarm[0] = 15;
}




