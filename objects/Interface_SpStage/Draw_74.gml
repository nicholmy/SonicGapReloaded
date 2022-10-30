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
					case 1: 
					{
						if Player.Lives > 1
						{
							fade_perform(ModeInto, BlendBlack, 1);
							audio_sfx_play(sfxPauseSelect, false);
						}
						else
						{
							audio_sfx_play(sfxFail, false);
						}
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
					global.Lives -= 1; room_restart();						
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
		if Enabled
		{
			var X = OffsetX + global.ScreenBuffer;
			var Y = OffsetY;
	
			draw_set_font(Font.FontDigits1);
	
			// Handle stage timer
			if Stage.Time < 35999
			{
				var Min	= Stage.Time div 3600;
				var Sec	= (Stage.Time - Min * 3600) div 60;
				var Msc = floor(Stage.Time mod 60 / 3 * 5);
			} 
			else
			{
				var Min	= 9;
				var Sec = 59;
				var Msc = 99;
			}
		
			// Draw SCORE
			/*draw_sprite(gui_hud_score, 0, X + 36, Y + 14);
	
			draw_set_halign(fa_right);	
			draw_text(X + 116, Y + 9, Player.Score);
			*/
			// Draw TIME
			if Stage.Time < 600
			{
				draw_anisprite(gui_hud_time, 8, true, X + 32, Y + 14);
			}
			else
			{
				draw_sprite(gui_hud_time, 0, X + 32, Y + 14);
			}
			if !global.CDStageTimer
			{
				var TimeString = string(Min) + ":" + (Sec > 9 ? "" : "0") + string(Sec);
			}
			else
			{
				var TimeString = string(Min) + "'" + (Sec > 9 ? "" : "0") + string(Sec) + ";" + (Msc > 9 ? "" : "0") + string(Msc);
			}
			draw_set_halign(fa_left);
	
			draw_text(X + 60, Y + 9, TimeString);
	
			
			// Draw RINGS
			if (SpecialStage_Base.SpecialStageType == 1 or SpecialStage_Base.SpecialStageType == 3) {
				draw_sprite(gui_hud_left, 0, X + 32, Y + 30);
			
				draw_set_halign(fa_right);
	
				draw_text(X + 92, Y + 25, string(SpecialStage_Base.RingsLeft));
			} else if (SpecialStage_Base.SpecialStageType == 2) {
				draw_sprite(gui_hud_left, 0, X + 32, Y + 30);
			
				draw_set_halign(fa_right);
	
				draw_text(X + 92, Y + 25, string(SpecialStage_Base.EnemiesLeft));
			}
			/*
			// Draw LIVES
			draw_set_font(Font.FontDigits2);
			draw_text(X + 65, Y + global.Height - 15, Player.Lives);
	
			draw_sprite(gui_hud_lives, global.Character, X + 40, Y + global.Height - 16);
			
			if (Stage.GapLevel) {
				// Set font
				draw_set_alpha(1);
				draw_set_halign(fa_right);
				draw_set_font(Font.FontDefault);
				
				draw_text_ext_transformed(global.Width - 8, 8, Stage.CurrentGapName, 8, 256, 1, 1, 0);
				
				if (Stage.GapChainCount > 0) {
					draw_set_alpha(1);
					draw_set_halign(fa_right);
					draw_set_font(Font.FontDefault);
				
					draw_text_ext_transformed(global.Width - 8, Y + global.Height - 31, string(Stage.GapChainCount), 8, 256, 1, 1, 0);
					draw_text_ext_transformed(global.Width - 8, Y + global.Height - 15, string(Stage.GapComboTotal), 8, 256, 1, 1, 0);
				}
			}*/
		}
	}
	#endregion
	
	#region Draw GameOver
	{
		if Stage.RestartEvent
		{
			var CentreX = global.Width  / 2 + global.ScreenBuffer;
			var CentreY = global.Height / 2;
	
			// Move assets
			GameOverValue[0] = min(GameOverValue[0] + 16 * (global.Width / 320), CentreX - 40);
			GameOverValue[1] = max(GameOverValue[1] - 16 * (global.Width / 320), CentreX + 40);
	
			// Draw assets
			draw_sprite(gui_gameover_gametime, Stage.Time == 36000 and Player.Lives, GameOverValue[0], CentreY);
			draw_sprite(gui_gameover_over,	   0,									 GameOverValue[1], CentreY);
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
						if CardValue[0] == 60
						{
							fade_perform(ModeFrom, BlendBlack, 1);
						}
						if !fade_check(StateActive)
						{
							Input.IgnoreInput         = false;
							Stage.TimeEnabled         = true;
							Stage.UpdateObjects       = true;
							Renderer.UpdateAnimations = true;
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