/// @description Main
// You can write your code in this editor

	// Do collision
	object_act_solid(true, true, true, true);
		
	// Launch player
	if object_check_player(image_yscale ? ColSolidU : ColSolidD)
	{	
		if image_yscale
		{
			Player.Animation = (Player.Animation == AnimHammerSpring) ? AnimHammerSpring : AnimSpring;
		}
		else
		{
			Player.ClimbState = false;
			Player.Xsp        = 0;
		}
		Player.Ysp = -LaunchForce * image_yscale;
		
		animation_reset(1);
		audio_sfx_play(sfxSpring, false);
		
		// Player should be airborne now
		Player.Grounded = false;
		Player.OnObject = false;
	}
	
	if (global.Character == CharAmy and Player.Animation == AnimHammerRush and (object_check_player(ColSolidL) or object_check_player(ColSolidR))) {
		Player.Animation = AnimHammerSpring;
		Player.ClimbState = false;
		Player.Xsp        = 0;
		
		Player.Ysp = Player.BarrierType == BarrierWater ? -LaunchForce * image_yscale * 1.25 : -LaunchForce * image_yscale
		
		animation_reset(1);
		audio_sfx_play(sfxSpring, false);
		
		// Player should be airborne now
		Player.Grounded = false;
		Player.OnObject = false;
		
		if (Player.BarrierType == BarrierWater) {
			// Update barrier
			with Barrier
			{
				animation_play(spr_obj_barrier_water_drop, [6, 19, 0], 0);
			}

			audio_sfx_play(sfxWaterBarrierBounce, false);
		}
	}