/// @description Main
// You can write your code in this editor
	
	
	
	// Damage player
	if object_check_player(image_xscale == 1 ? ColSolidR : ColSolidL)
	{
		if (global.Character == CharMighty) {
			if (Player.Animation == AnimSpin) {
				if (!Player.Grounded) {
					if (Player.BarrierType == BarrierThunder) {
						Player.Animation	= AnimSpin;
						Player.Xsp			= 2 * image_xscale;
						Player.Ysp			= -7;
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
					} else {
						Player.Animation	= AnimUncurl;
						Player.Xsp			= 4 * image_xscale;
						Player.Ysp			= -4;
						audio_sfx_play(sfxSpikeBump, false);
					}
					
					
					Player.Grounded		= false;
					Player.OnObject		= false;
					Player.Jumping		= false;
					Player.Spinning		= false;
					
					Player.HammerState	= false;
					Player.RadiusX		= Player.DefaultRadiusX;
					Player.RadiusY		= Player.DefaultRadiusY;
				}
			} else if (Player.Xsp < 0) {
				player_damage(false, false, false);
			}
		}
		else {
			player_damage(false, false, false);
		}
	}
	// Do collision
	object_act_solid(true, true, true, false);