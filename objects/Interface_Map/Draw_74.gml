/// @description Draw Overlay
// You can write your code in this editor

	#region Pause Process
	{
		if Stage.IsPaused
		{		
			if !fade_check(StateActive)
			{
				// Loop through options
				if Input.DownPress
				{
					PauseValue = loop_value(PauseValue + 1, 0, 2); audio_sfx_play(sfxPauseSwitch, false);
				}
				else if Input.UpPress
				{
					PauseValue = loop_value(PauseValue - 1, 0, 2); audio_sfx_play(sfxPauseSwitch, false);
				}
			
				PauseTimer++;
				PauseTimer = PauseTimer mod 16;
			
				// React
				if (Input.StartPress or Input.ABCPress) then switch PauseValue
				{
					// Continue
					case 0:
					{
						Stage.IsPaused            = false;
						Stage.UpdateObjects		  = true;
						Stage.TimeEnabled		  = true;
						Camera.Enabled			  = true;
						Renderer.UpdateAnimations = true;
					
						instance_activate_range(Camera.ViewX);
					
						audio_resume_all();
						audio_sfx_play(sfxPauseBack, false);
					}
					break;
					
					// Restart
					// No lives ever!
					case 1: 
					{
						/*
						if Player.Lives > 1
						{
							fade_perform(ModeInto, BlendBlack, 1);
							audio_sfx_play(sfxPauseSelect, false);
						}
						else
						{
							audio_sfx_play(sfxFail, false);
						}*/
						fade_perform(ModeInto, BlendBlack, 1);
						audio_sfx_play(sfxPauseSelect, false);
					}
					break;
					
					// Exit
					case 2: 
					{
						fade_perform(ModeInto, BlendBlack, 1);
						audio_sfx_play(sfxPauseSelect, false);
					}
					break;
				}
			}
			else if fade_check(StateMax)
			{
				// Restart the Stage
				if PauseValue == 1
				{
					//global.Lives -= 1; 
					room_restart();						
				}
					
				// Exit to DevMenu
				else if PauseValue == 2
				{
					//global.SpecialRingList = [];
					global.StarPostData	   = [];
				
					room_goto(Screen_DevMenu);
				}
			}
		}
	
		// Pause the game
		else if Input.StartPress
		{
			if CardValue[1] == 3 and !Stage.IsFinished and !Player.Death
			{
				Renderer.UpdateAnimations = false;
				Camera.Enabled            = false;
				Input.StartPress	      = false;
				Stage.UpdateObjects       = false;
				Stage.TimeEnabled         = false;
				Stage.IsPaused	          = true;
			
				audio_pause_all();
				audio_sfx_play(sfxPauseSelect, false);
			}
		}
	}
	#endregion

	/* Low plane is rendered below the fade. Please note that you have
	to add global.ScreenBuffer to your X positions here */
	
	#region Low Plane Process
	{
		shader_set(ShaderMain);
		surface_set_target(Renderer.SurfaceLow);
	}
	#endregion
	
	#region Draw HUD
	{
		var X = OffsetX + global.ScreenBuffer;
		var Y = OffsetY;
		
		var specialRingList = specialringflags_get(ZoneID);
		//var redRingList = global.RedRingList2;
		var offsetY = 32;
		var redSpecialSpace = 24
		if Enabled
		{
			for (var i = 0; i < array_length(specialRingList); i++) {
				if (global.SpecialRingList2[specialRingList[i]]) {
					//draw_sprite(spr_obj_ring_special, 0, X + 32 + 32 * i, Y + global.Height - 64);
					draw_sprite_ext(spr_obj_ring_special, 0,  X + 32 + 20 * i, Y + offsetY, 0.75, 0.75, 0, image_blend, image_alpha);
				} else {
					//draw_sprite(spr_obj_ring_special_disabled, 0, X + 32 + 32 * i, Y + global.Height - 64);
					draw_sprite_ext(spr_obj_ring_special_disabled, 0,  X + 32 + 20 * i, Y + offsetY, 0.75, 0.75, 0, image_blend, image_alpha);
				}
			}
			
			// Assuming each zone has 10 red rings always, might need to change this in the future
			for (var i = 0; i < 10; i++) {
				if ( global.RedRingList2[ZoneID * 10 + i]) {
					draw_sprite_ext(spr_obj_redring, 0,  X + 32 + 18 * i, Y + offsetY + redSpecialSpace, 0.5, 0.5, 0, image_blend, image_alpha);
				} else {
					//draw_sprite(spr_obj_redring_disabled, 0, X + 32 + 32 * i, Y + global.Height - 32);
					draw_sprite_ext(spr_obj_redring_disabled, 0,  X + 32 + 18 * i, Y + offsetY + redSpecialSpace, 0.5, 0.5, 0, image_blend, image_alpha);
				}
			}
			
		}
	}
	#endregion
	
	#region Draw Pause
	{
		if Stage.IsPaused
		{
			var CentreX = global.Width  / 2 + global.ScreenBuffer;
			var CentreY = global.Height / 2;
	
			draw_sprite(gui_pause_menu,	PauseTimer > 7 ? 0 : PauseValue + 1, CentreX, CentreY);
		}
	}
	#endregion
	
	#region Update Plane
	{
		surface_reset_target();
	}
	#endregion

	/* High plane is rendered above the fade. No need to
	add global.ScreenBuffer here! */
	
	#region High Plane Process
	{
		surface_set_target(Renderer.SurfaceHigh);
		draw_clear_alpha(c_white, 0);
	}
	#endregion
	
	#region Draw Card
	{
		/* Value Table Reference
		------------------------
		Value[0] - Timer
		Value[1] - State
		Value[2] - Ribbon Y
		Value[3] - Ribbon X
		Value[4] - Logo X
		Value[5] - Logo Scale
		Value[6] - Act Number X
		Value[7] - Zone Name X
		------------------------
		*/
	
		if CardValue[1] < 3
		{
			switch CardValue[1]
			{
				// Appear
				case 0:
				{	
					// Increment state after a second
					if (++CardValue[0]) == 60
					{
						CardValue[0] = 0;
						CardValue[1] = 1;
					}
					else
					{
						// Move ribbon
						if (++CardValue[2] mod 16) == 0
						{
							CardValue[2] -= 16;
						}
						CardValue[3] = CardValue[3] + max(0, 6 - CardValue[0] / 8);
				
						// Move logo
						if CardValue[0] > 4
						{
							CardValue[4] = CardValue[4] + max(0, 6 - (CardValue[0] - 4) / 8);
						}
				
						// Move act number
						if CardValue[0] > 32
						{
							CardValue[6] = min(global.Width - 96, CardValue[6] + 24);
						}
				
						// Move zone name
						if CardValue[0] > 24
						{
							CardValue[7] = max(global.Width - 32, CardValue[7] - 24);
						}
					}
				}
				break;
		
				// Idle
				case 1:
				{
					// Increment state after two seconds
					if (++CardValue[0]) == 120
					{
						CardValue[0] = 0;
						CardValue[1] = 2;	
					}
					else
					{
						// Start gameplay
						if CardValue[0] == 60 and !Stage.NextActFlag
						{
							fade_perform(ModeFrom, BlendBlack, 1);
						}
						if !fade_check(StateActive) or (CardValue[0] == 60 and Stage.NextActFlag)
						{
							Input.IgnoreInput         = false;
							Stage.TimeEnabled         = true;
							Stage.UpdateObjects       = true;
							Renderer.UpdateAnimations = true;
							Stage.NextAct = true;
							
							// Reset the boundaries (in case of act transition)
							Stage.TargetTopBoundary = 0;
							Stage.TargetRightBoundary = room_width;
							Stage.TargetBottomBoundary = room_height;
						}
				
						// Move ribbon
						if (++CardValue[2] mod 16) == 0
						{
							CardValue[2] -= 16;
						}
					}
				}
				break;
		
				// Disappear
				case 2:
				{
					// Increment state after one second
					if (++CardValue[0]) == 60
					{
						CardValue[0] = 0;
						CardValue[1] = 3;
						//Stage.NextActFlag = false;
					}
					else
					{
						// Move ribbon
						if (++CardValue[2] mod 16) == 0
						{
							CardValue[2] -= 16;
						}
						if CardValue[0] >= 16
						{
							CardValue[3] -= CardValue[0] / 4;
						}
				
						// Scale logo
						if CardValue[0] < 5
						{
							CardValue[5] += 0.05;
						}
						else if CardValue[5] > 0
						{
							CardValue[5] = max(CardValue[5] - 0.1, 0);
						}
				
						// Move zone name and act number
						if CardValue[0] >= 48
						{
							CardValue[6] -= 48;
							CardValue[7] += 24;
						}
					}
				}
				break;
			}
		
			// Draw assets
			draw_sprite(gui_card_act, Stage.ActID, CardValue[6], global.Height / 2 + 4);	
			draw_sprite(gui_card_ribbon, 0, floor(CardValue[3]), floor(CardValue[2]));
			draw_sprite_ext(gui_card_logo, 0, floor(CardValue[4]), global.Height - 24, CardValue[5], CardValue[5], 0, c_white, 1);
		
			// Draw zone name
			draw_set_halign(fa_right);
			draw_set_font(Font.FontCard);
			draw_text(CardValue[7], global.Height / 2 - 38, Stage.ZoneName);
		}
	}
	#endregion
	
	#region Update Plane
	{
		surface_reset_target();
		shader_reset();
	}
	#endregion