// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerRayFlight(){
	if !RayFlightState return;
	
	Animation = AnimRayGlideUp;
	
	// Stop on collision with left wall
	var FindWall = tile_find_h(PosX - RadiusX, PosY, false, Layer);
	if  FindWall[0] <= 0
	{
		if !(Xsp > 0)
		{
			RayFlightState = false;
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
			Animation = AnimSpin;
			return;
		}
	}
	
	// Stop if not holding the jump button
	if (!Input.ABC) {
		RayFlightState = false;
		Animation = AnimSpin;
		return;
	}
}