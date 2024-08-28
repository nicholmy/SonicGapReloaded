// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_enter_water(){
	audio_sfx_stop(sfxFlying);
	audio_sfx_stop(sfxTired);
				
	Xsp			*= 0.5;
	Ysp			*= 0.25;
	IsUnderwater = true;
			
	// Create bubble controller once we enter the water
	if !instance_exists(BubbleController) and !DebugMode
	{
		instance_create(-16, -16, BubbleController);
	}
				
	// Lower default gravity value by 0x28 (0.15625)
	if !Hurt and !FlightState and GlideState != GlideAir
	{
		Grv = 0.0625;
	}
		
	// Will leave the creation of the splash object to the object calling this
	// Create splash object
	/*if !Grounded and !ClimbState and GlideState != GlideGround
	{
		// Will have to think of how to set the water height with pools
		instance_create(PosX, PosY, WaterSplash);
	}*/
			
	// Destroy barrier
	if BarrierType == BarrierFlame or BarrierType == BarrierThunder
	{	
		if BarrierType == BarrierThunder
		{
			fade_perform(ModeFrom, BlendFlash, 4);
		}
		BarrierType = false;			
	}
}