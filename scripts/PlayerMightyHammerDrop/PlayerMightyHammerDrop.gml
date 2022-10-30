function PlayerMightyHammerDrop()
{
	if !AllowCollision or !HammerState
	{
		return;
	}
	
	if (Animation != AnimHammerDrop) {
		HammerState = false;
	}
	// Collide with floor
	else if Ysp >= 0
	{
		var X1 = PosX - RadiusX;
		var X2 = PosX + RadiusX;
		var Y1 = PosY + RadiusY;
		var FindFloor = tile_find_2v(X1, Y1, X2, Y1, true, noone, Layer);
		
		// Are we airborne?
		if FindFloor[0] < 0
		{
			show_debug_message("Landed!")
			show_debug_message(string(FindFloor[0]) + " " + string(FindFloor[1]));
			show_debug_message("X Launch: " + string(3 * dsin(FindFloor[1])) );
			show_debug_message("Y Launch: " + string(-3 * dcos(FindFloor[1])) );
			if FindFloor[1] <= 45 or FindFloor[1] >= 316.41
			{
				
				// If floor is shallow enough, bounce off a bit
				Animation = AnimSpin;
				Grounded = false;
				HammerState = false;
				Xsp = -3 * dsin(FindFloor[1]);
				Ysp = -3 * dcos(FindFloor[1]);
				audio_sfx_play(sfxObjectDestroy, false);
			}
			else
			{
				// If the floor is a deep incline, shoot forwards on the ground quickly
				Grounded = true;
				Spinning  = true;
				Animation = AnimSpin;
				HammerState = false;

				Gsp	= FindFloor[1] > 180 ? 10 : -10;
				Angle = FindFloor[1];
				audio_sfx_play(sfxObjectDestroy, false);
			}
			
			// Adhere to the surface
			PosY += FindFloor[0];
			
			// Create Clouds:
	        for(i = 0; i < 3; i++){
	            var Cloud = instance_create(floor(PosX), floor(PosY + 22), Dust_HammerDrop);
	            Cloud.Direction =  FindFloor[1];
	            Cloud.Speed = 0.5*i + 0.5;
                
	            var Cloud2 = instance_create(floor(PosX), floor(PosY + 22),  Dust_HammerDrop);
	            Cloud2.Direction =   (FindFloor[1] + 180) % 360;
	            Cloud2.Speed = 0.5*i + 0.5;
	        }
			
			// Maybe this should rotate on angle? Not sure
			instance_create(PosX, floor(PosY + 20), HammerDrop_Hitbox);
			
			Camera.ShakeTime = 15;
		}
	}
}