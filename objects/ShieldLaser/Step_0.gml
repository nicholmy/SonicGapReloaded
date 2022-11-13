/// @description Give shield on contact
for(var i = 0; i < max_length; i++){

    lx = originX + lengthdir_x(i, direction);
    ly = y + lengthdir_y(i, direction);

	if (collision_point(lx, ly, Player, false, true) && !Player.Hurt && !Player.Death) {
		
		if (Player.BarrierType != shield_reward) {
			switch shield_reward
			{
				case BarrierWater:
					audio_sfx_play(sfxWaterBarrier, false);
					break;
				case BarrierThunder:
					audio_sfx_play(sfxThunderBarrier, false);
					break;
				case BarrierFlame:
					audio_sfx_play(sfxFlameBarrier, false);
					break;
			}
			if (instance_exists(Barrier)) instance_destroy(Barrier);
		
			Player.BarrierType = shield_reward;
			instance_create(Player.PosX, Player.PosY, Barrier);
		}
		break;
	}
	if (tile_check(lx, ly, false, LayerA)) {
		break;
	}
}
distance = i;