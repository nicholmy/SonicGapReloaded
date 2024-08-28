/// @description Main
// You can call your scripts in this editor
	
	// Do collision
	object_act_solid(true, true, true, true);
	if ((Player.Animation == AnimHammerSpring or Player.IsAmyHammerJumping or Player.Animation == AnimHammerRush) and object_check_player(ColHitbox2)) {
		player_reset_air(false);
		
		Player.Grounded = false;
		Player.OnObject = false;
		Player.Animation = AnimHammerSpring;
		Player.ClimbState = false;
		animation_reset(1);
		audio_sfx_play(sfxSpring, false);
			
		Player.Xsp = Player.BarrierType == BarrierWater ? LaunchForce * image_xscale * 1.25 : LaunchForce * image_xscale
		Player.Ysp = Player.BarrierType == BarrierWater ? -LaunchForce * image_yscale * 1.25 : -LaunchForce * image_yscale
		Player.Facing = image_xscale;
			
		if (Player.BarrierType == BarrierWater) {
			// Update barrier
			with Barrier
			{
				animation_play(spr_obj_barrier_water_drop, [6, 19, 0], 0);
			}

			audio_sfx_play(sfxWaterBarrierBounce, false);
		}
	}
	else 
	if (floor(Player.PosX + 4 * image_xscale) - x) * image_xscale >= 0 
	{	
		if (Player.Animation == AnimHammerRush and object_check_player(image_yscale ? ColSolidU : ColSolidD)) {
			Player.Animation = AnimHammerSpring;
			Player.ClimbState = false;
		
			Player.Xsp = Player.BarrierType == BarrierWater ? LaunchForce * image_xscale * 1.25 : LaunchForce * image_xscale
			Player.Ysp = Player.BarrierType == BarrierWater ? -LaunchForce * image_yscale * 1.25 : -LaunchForce * image_yscale
			Player.Facing = image_xscale;
		
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
		// Launch player
		else if object_check_player(image_yscale ? ColSolidU : ColSolidD) or object_check_player(ColSolidL) or object_check_player(ColSolidR)
		{
			if image_yscale
			{
				Player.Animation  = AnimSpring;
				Player.ClimbState = false;
			}
			Player.Xsp    =  LaunchForce * image_xscale;
			Player.Ysp	  = -LaunchForce * image_yscale;	
			Player.Facing = image_xscale;
			
			animation_reset(1);
			audio_sfx_play(sfxSpring, false);	
			
			// Player should be airborne now
			Player.Grounded = false;
			Player.OnObject = false;
		}
	}