// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_exit_water(){
	// Play previous track if running out of air
	if AirTimer <= 720
	{	
		if !SuperState
		{
			if HighspeedBonus
			{
				audio_bgm_play(AudioPrimary, HighSpeed);
			}
			else if InvincibleBonus
			{
				audio_bgm_play(AudioPrimary, Invincibility2);
			}
			else
			{
				audio_bgm_play(AudioPrimary, Stage.StageMusic);
			}
		}
		else
		{
			audio_bgm_play(AudioPrimary, SuperTheme);
		}
	}
			
	IsUnderwater = false;	
	AirTimer     = 1800;
			
	// Reset Tails' gravity and double vertical speed
	if !Hurt and GlideState != GlideAir
	{
		if !global.S3WaterPhysics
		or  global.S3WaterPhysics and Ysp >= -4
		{
			Ysp *= 2;
		}
		if Ysp < -16
		{
			Ysp = -16;
		}
				
		if !FlightState
		{
			Grv = 0.21875;
		}
	}
	if FlightState
	{
		audio_sfx_play(sfxFlying, true);
	}
			
	// Create splash object
	if !Grounded and !ClimbState and GlideState != GlideGround
	{
		//instance_create(PosX, Stage.WaterLevel, WaterSplash);
		instance_create(PosX, PosY, WaterSplash);
		audio_sfx_play(sfxWaterSplash, false);
	}
}