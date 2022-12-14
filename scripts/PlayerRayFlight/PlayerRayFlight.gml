// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerRayFlight(){
	if !RayFlightState return;
	
	// Stop on collision with left wall
	var FindWall = tile_find_h(PosX - RadiusX, PosY, false, Layer);
	if  FindWall[0] <= 0
	{
		if !(Xsp > 0)
		{
			RayFlightState = false;
			Spinning		= true;
			Animation = AnimSpin;
			return;
		}
	}
	
	// Stop on collision with right wall
	var FindWall = tile_find_h(PosX + RadiusX, PosY, true, Layer);
	if  FindWall[0] <= 0
	{
		if !(Xsp < 0)
		{
			RayFlightState = false;
			Spinning		= true;
			Animation = AnimSpin;
			return;
		}
	}
	
	// Stop if not holding the jump button
	if (!Input.ABC) {
		RayFlightState = false;
		Spinning		= true;
		Animation = AnimSpin;
		return;
	}
	
	RayGlideSpeed += RayGlideGravity * RayGlidePeriodFactor * -dsin(RayGlideAngle);
	
	// Unique behavior for flying straight forward since sin(angle) is 0
	if (RayGlideAngle == 0) {
		RayGlideSpeed -= 0.125;
	}
	// Cap your glide speed because otherwise this gets ridiculous
	RayGlideSpeed = min(max(RayGlideSpeed, 1), 16);
	
	// Change your gliding direction based on whether you pull back or forward
	if ((Xsp > 0 and Input.LeftPress) || (Xsp < 0 and Input.RightPress) ) {
		// If you're turning upwards in the glide, get a speed boost
		if (RayGlideAngle < -22.5) {
			if (BarrierType == BarrierFlame) {
				RayGlideSpeed += RayGlideBoost * 1.5;
				audio_sfx_play(sfxFlameBarrierDash, false);
				// Update barrier
				with Barrier
				{
					object_set_depth(Player, 1);
					animation_play(spr_obj_barrier_flame_dash, 2, 0);
				}
			} else if (BarrierType == BarrierWater) {
				RayGlideSpeed += RayGlideBoost * 1.5;
				// Update barrier
				with Barrier
				{
					animation_play(spr_obj_barrier_water_drop, [6, 12, 0], 0);
				}

				audio_sfx_play(sfxWaterBarrierBounce, false);
			} else {
				RayGlideSpeed += RayGlideBoost;
				audio_sfx_play(sfxRelease, false);
			}
		}
		RayGlideAngleDirection = -1;
	} else if ((Xsp > 0 and Input.RightPress) || (Xsp < 0 and Input.LeftPress)) {
		
		RayGlideAngleDirection = 1;
	}
	
	RayGlideAngle -= sign(RayGlideAngleDirection) * RayGlideAngleSpeed;
	
		// Fix Gliding angle so you don't lean too much
	if (RayGlideAngle >= 45) {
		Animation = AnimRayGlideUp;
		RayGlideAngle = 45;
	} else if (RayGlideAngle <= -45) {
		Animation = AnimRayGlideDown;
		RayGlideAngle = -45;
	} else {
		Animation = AnimRayGlideTurn;
	}
	
	/*** CHARACTER MOVEMENT ***/
	Xsp = RayGlideSpeed * dcos(RayGlideAngle) * Facing;
	
	// Fall if you're not gliding fast enough
	if (RayGlideSpeed <= 1) {
		if (Ysp > -dsin(RayGlideAngle)) Ysp = dsin(RayGlideAngle);
		if (RayGlideAngle == 0) { 
			Ysp = 1;
		}
	} else {
		Ysp = RayGlideSpeed * -dsin(RayGlideAngle);
	}
}