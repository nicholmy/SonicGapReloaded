function PlayerResetOnFloor()
{	
	// Wait until grounded flag is set. That means player has landed
	if !Grounded or MoveState != StateCommon
	{
		return;
	}
	
	// Is water barrier active?
	if BarrierIsActive and BarrierType == BarrierWater and global.Character == CharSonic
	{
		var Force = IsUnderwater ? -4 : -7.5;
		Ysp		  = Force * dcos(Angle);
		Xsp       = Force * dsin(Angle);
		
		BarrierIsActive = false;
		Grounded        = false;
		OnObject	    = false;

		// Update barrier animation
		with Barrier
		{
			animation_play(spr_obj_barrier_water_bounce, [7, 13, 0], 0);
		}
		
		audio_sfx_play(sfxWaterBarrierBounce, false);
	}
	else
	{
		// Update player animation
		if !OnObject and Animation != AnimIdle and Animation != AnimHammerRush
		{
			if  Animation != AnimSpindash 
			and Animation != AnimDropStand 
			and Animation != AnimGlideStand
			{
				if (Input.Down) {
					Animation = AnimSpin;
				} else {
					Animation = AnimMove;
				}
			}
		}
		
		// Reset flags
		if Hurt
		{
			Hurt = false;
			Gsp  = 0;
		}
		Spinning		 = false;
		Jumping			 = false;
		AirLock			 = false;
		Pushing			 = false;
		FlightState		 = false;
		GlideState		 = false;
		ClimbState		 = false;
		HammerState		 = false;
		RayFlightState	 = false;
		ScoreCombo		 = false;
		BarrierIsActive  = false;
		AllowSpikeTap	 = false;
		DropdashFlag	 = DashLocked;
		DoubleSpinAttack = SpinReady;
		
		audio_sfx_stop(sfxFlying);
		audio_sfx_stop(sfxTired);
	
		// Update visual angle if floor is steep enough
		if global.SmoothRotation and Angle >= 35.16 and Angle <= 324.84
		{
			VisualAngle = Angle;
		}
		
		// Reset gravity
		if !IsUnderwater
		{
			Grv = 0.21875;
		}
		else
		{
			// Reduce by 0x28 (0.15625) if underwater
			Grv = 0.0625
		}
		
		// Release/reset dropdash
		if DropdashRev == 20
		{	
			if RadiusY != SmallRadiusY
			{
				PosY   -= SmallRadiusY - RadiusY;
				RadiusX = SmallRadiusX;
				RadiusY = SmallRadiusY;
			}
			if SuperState
			{
				var DropForce = 12;
				var MaxForce  = 13;
			}
			else
			{
				var DropForce = 8;
				var MaxForce  = 12;
			}
		
			// Define dropspeed
			if DropdashSide == FlipRight
			{
				var Dropspeed = Gsp / 4 + DropForce * Facing;
			}
			else if DropdashSide == FlipLeft
			{
				if Angle == 360
				{
					var Dropspeed = DropForce * Facing;
				}
				else
				{
					var Dropspeed = Gsp / 2 + DropForce * Facing;
				}
			}
			Dropspeed = clamp(Dropspeed, -MaxForce, MaxForce);
			
			// Shake and/or delay camera
			if !global.CDCamera
			{
				Camera.ScrollDelay = 16;
			}
			if SuperState
			{
				Camera.ShakeTime = 30;
			}
			
			// Apply dropspeed
			Gsp			= Dropspeed;
			DropdashRev = -1;
			Spinning    = true;
			Animation   = AnimSpin;
			
			audio_sfx_stop(sfxDropDash);
			
			if (global.Character == CharAmy) {
				Spinning = false;
				Animation = AnimHammerRush;
				/*PosY   -= DefaultRadiusY - RadiusY;
				RadiusX	= DefaultRadiusX;
				RadiusY = DefaultRadiusY; */
				
				if (!BarrierIsActive and BarrierType == BarrierFlame) {
					BarrierIsActive = true;
					Gsp = 12 * Facing;
					
					// Update barrier
					with Barrier
					{
						object_set_depth(Player, 1);
						animation_play(spr_obj_barrier_flame_dash, 2, 0);
					}
						
					audio_sfx_play(sfxFlameBarrierDash, false);
				}
			}
			audio_sfx_play(sfxRelease, false);
			
			instance_create(PosX, PosY + RadiusY, DropdashDust);
		}
		else
		{
			DropdashRev = -1;
		}
	
		// Reset collision radiuses if not rolling
		if !Spinning
		{
			PosY   -= DefaultRadiusY - RadiusY;
			RadiusX	= DefaultRadiusX;
			RadiusY = DefaultRadiusY; 
		}
	}
}
