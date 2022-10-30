/// @description Main
// You can write your code in this editor
	
	// Do collision
	if !Player.InvincibleBonus and !Player.InvincibilityFrames and !Player.SuperState
	{
		// Makes it so when you dropdash on spikes it doesn't trigger the dust?
		object_act_solid(true, true, true, true, false);
	}
	else
	{
		// Allow player to bounce and perform dropdash on the spikes if they're invincible
		object_act_solid(true, true, true, false, false);
	}
	
	// Damage player
	if object_check_player(image_yscale == 1 ? ColSolidU : ColSolidD)
	{
		/**/
		if (image_yscale == 1) {
			if (global.Character == CharMighty) {
				if (Player.Hurt) {
					with Player {
						Player.Hurt = 0;
						PlayerResetOnFloor();
					}
				}
				// AllowSpikeTap is only set true when jumping
				// TODO: Set it to true when going ground to air off a ledge
				else if (Input.ABC and Player.AllowSpikeTap and Player.Animation = AnimSpin) {
					if (Player.BarrierType == BarrierWater) {
						Player.Ysp = -6;
						audio_sfx_play(sfxWaterBarrierBounce, false);
						// Update barrier
						with Barrier
						{
							animation_play(spr_obj_barrier_water_drop, [6, 19, 0], 0);
						}
					} else {
						Player.Ysp = -2;
						audio_sfx_play(sfxSpikeTap, false);
						Player.AllowSpikeTap = false;
					}
					
					// Player should be airborne now
					Player.Grounded = false;
					Player.OnObject = false;
				}
				else if (Player.HammerState) {
					if (Player.BarrierType == BarrierFlame) {
						Player.Grounded		= false;
						Player.OnObject		= false;
						Player.Xsp			= 8 * Player.Facing;
						Player.Ysp			= -4;
						Player.AirLock		= true;
						Player.Animation	= AnimSpin;
						Player.Jumping		= false;
						
						if !global.CDCamera
						{
							Camera.ScrollDelay = 16;
						}
						// Update barrier
						with Barrier
						{
							object_set_depth(Player, 1);
							animation_play(spr_obj_barrier_flame_dash, 2, 0);
						}
						
						audio_sfx_play(sfxFlameBarrierDash, false);
					} else if (Player.BarrierType == BarrierThunder) {
						Player.Grounded		= false;
						Player.OnObject		= false;
						Player.Ysp			= -8;
						Player.AirLock		= false;
						Player.Animation	= AnimSpin;
						Player.Jumping		= false;
						
						
						// Create sparkles
						for (var i = 0; i < 4; i++)
						{
							var  Object = instance_create(Player.PosX, Player.PosY, BarrierSparkle);
							with Object
							{
								SparkleID = i;
							}
						}
						
						audio_sfx_play(sfxThunderBarrierJump, false);
					} else if (Player.BarrierType == BarrierWater) {
						Player.Grounded		= false;
						Player.OnObject		= false;
						Player.Ysp			= -6;
						Player.AirLock		= false;
						Player.Animation	= AnimSpin;
						
						audio_sfx_play(sfxWaterBarrierBounce, false);
						// Update barrier
						with Barrier
						{
							animation_play(spr_obj_barrier_water_drop, [6, 19, 0], 0);
						}
					} else {
						audio_sfx_play(sfxSpikeBump, false);
						Player.Animation	= AnimUncurl;
						Player.Grounded		= false;
						Player.OnObject		= false;
						Player.Jumping		= false;
						Player.Spinning		= false;
						Player.Xsp			= 4 * Player.Facing;
						Player.Ysp			= -4;
					
						Player.HammerState	= false;
						Player.RadiusX		= Player.DefaultRadiusX;
						Player.RadiusY		= Player.DefaultRadiusY;
					}
				}
				else if (Player.Animation = AnimSpin and abs(Player.Xsp) < 2) {
					audio_sfx_play(sfxSpikeBump, false);
					Player.Animation	= AnimUncurl;
					Player.Grounded		= false;
					Player.OnObject		= false;
					Player.Xsp			= 4 * Player.Facing;
					Player.Ysp			= -4;
					
					Player.HammerState	= false;
					Player.RadiusX		= Player.DefaultRadiusX;
					Player.RadiusY		= Player.DefaultRadiusY;
					Player.Jumping		= false;
					Player.Spinning		= false;
				} else if (Player.Animation != AnimSpin) {
					player_damage(false, false, false);
				}
			} else {
				/*if (Player.Grounded) {
					with Player {
						PlayerResetOnFloor();
					}		
				}*/
				player_damage(false, false, false);
			}
		} else if (!(global.Character == CharMighty and Player.Animation == AnimSpin)) {
			player_damage(false, false, false);
		}
	} else if (Player.Grounded and Player.AllowSpikeTap) {
		Player.AllowSpikeTap = false;
	}