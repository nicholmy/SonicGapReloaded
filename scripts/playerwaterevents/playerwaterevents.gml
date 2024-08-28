function PlayerWaterEvents()
{
	// Check for falling into the stage-wide water
	if Stage.WaterEnabled and !IsUnderwater and floor(PosY) > Stage.WaterLevel and !Death {
		player_enter_water();
	}
	
	if !IsUnderwater
	{
		return;
	}
	
	if IsUnderwater
	{
		// Countdown air timer
		if AirTimer > 0
		{
			if BarrierType != BarrierWater and !Stage.IsFinished and !Death
			{
				if AirTimer == 1500 or AirTimer == 1200 or AirTimer == 900
				{
					audio_sfx_play(sfxAirAlert, false);
				}
				else if AirTimer == 720
				{			
					audio_bgm_play(AudioPrimary, Drowning);
				}
				AirTimer--
			}
		}
		
		// If ran out of air, drown
		else if !Death
		{
			if !Drown
			{
				audio_sfx_play(sfxDrown, false);
				
				Xsp	= 0;
				Ysp	= 0;
				Grv = 0.0625;
				
				Stage.TimeEnabled = false;
				Camera.Enabled    = false;
				AllowCollision    = false;
				Grounded	      = false;
				OnObject	      = false;
				GroundLock        = false;
				FlightState       = false;
				ClimbState	      = false;
				GlideState	      = false;
				Jumping		      = false;
				Spinning	      = false;
				DropdashRev       = -1;
				SpindashRev       = -1;
				PeeloutRev        = -1;
				DoubleSpinAttack  = SpinRecharge;
				DropdashFlag	  = DashLocked;
				Animation		  = AnimDrown;
				Drown			  = true;
				AirLock		      = true;	
				
				// Draw player above everything
				depth = 50;
			}
			else if floor(PosY) >= Camera.ViewY + global.Height + 276
			{
				Death = true;
			}
		}
		
		// If we have a barrier, destroy it
		if BarrierType == BarrierFlame or BarrierType == BarrierThunder
		{
			BarrierType = false;
		}
	
		/*
		// Check for leaving the water
		if Stage.WaterEnabled and PosY < Stage.WaterLevel and !Death
		{
			player_exit_water();
		}
		*/
	}
}