/// @description Main
// You can write your code in this editor
	
	switch State
	{
		case 0:
		{
			
			// Make the ring visible
			visible = true;
			
			// Increment state
			State++;
		}
		break;
		case 1:
		{
			// Check for overlap
			if object_check_player(ColHitbox)
			{	
				// Play sound
				audio_sfx_play(sfxSpecialRing, false);
				
				// Remember this ring
				//global.SpecialRingList[array_length(global.SpecialRingList)] = id;

				
				Player.AllowCollision = false;
				Input.IgnoreInput = true;
					
				// Remember player and stage data
				global.SpecialRingData[0] = x;
				global.SpecialRingData[1] = y + 64;
				global.SpecialRingData[2] = Player.Rings;
				global.SpecialRingData[3] = Player.BarrierType;
				global.SpecialRingData[4] = Stage.Time;
				global.SpecialRingData[5] = Stage.TargetBottomBoundary;
				global.InSpecialStage = true;
						
				// Buffer score and lives into their global variables
				global.Score = Player.Score;
				global.Lives = Player.Lives;
					
				// Create flash object
				instance_create(x, y, SpecialRingFlash);
				image_alpha = 0;
					
				// Stop player
				with Player
				{
					visible		  = 0;
					Xsp		      = 0;
					Ysp			  = 0;
					Gsp			  = 0;
					AllowMovement = 0;
					BarrierType   = false;
				}
					
				audio_sfx_stop(sfxTired);
				audio_sfx_stop(sfxFlying);
					
				// Increment state
				State++;
			}
		}
		break;
		case 2:
		{	
			// Perform fade after 32 frames
			if (++Timer) == 32
			{				
				fade_perform(ModeInto, BlendWhite, 1);
				
				Camera.Enabled		      = false;
				Stage.UpdateObjects       = false;
				Stage.TimeEnabled         = false;
				Renderer.UpdateAnimations = false;
				
				// Play sound and increment state
				audio_play_sound(sfxSpecialWarp, 0, false);
				State++;
				
				// Stop music instantly
				audio_bgm_stop(AudioPrimary,  0);
				audio_bgm_stop(AudioSecondary, 0);
				
				global.ReturnRoom = room;
			}
		}
		break;
	}