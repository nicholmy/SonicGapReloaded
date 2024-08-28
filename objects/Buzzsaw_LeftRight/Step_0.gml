/// @description Insert description here
// You can write your code in this editor

animation_play(sprite_index, 4, false)

if (!state and !Player.Hurt and !Player.Death and object_check_player(ColHitbox)) {
	if (global.Character == CharMighty and (Player.Animation == AnimSpin or Player.HammerState)) {
		// Set player speeds based on collision angle
		var Angle = point_direction(x, y, floor(Player.PosX), floor(Player.PosY));
			
		if Player.Grounded {
			Player.Gsp = 5 * dcos(Angle);
		}
		else with Player {
			if (Player.HammerState) {
				Xsp		= 7 * dcos(Angle);
				Ysp     = 7 * -dsin(Angle);
			} else {
				Xsp		= 5 * dcos(Angle);
				Ysp     = 5 * -dsin(Angle);
			}
			
			Jumping = false;
			AirLock = false;
		}
		
		Player.HammerState = false;
		Player.Animation = AnimSpin;
		Player.Spinning = true;
		
		audio_sfx_play(sfxSpikeTap, false);
		state = 1;
		alarm[0] = 10;
	} else {
		player_damage(false, false, false);
	}
}

x = xstart + 160 * dcos(Stage.AngleTimer + 90);

