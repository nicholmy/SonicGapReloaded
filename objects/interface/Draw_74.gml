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
			draw_sprite(gui_hud_score, 0, X + 36, Y + 14);
	
			draw_set_halign(fa_right);	
			draw_text(X + 116, Y + 9, Player.Score);
	
			// Draw TIME
			if Stage.Time > 32400
			{
				draw_anisprite(gui_hud_time, 8, true, X + 32, Y + 30);
			}
			else
			{
				draw_sprite(gui_hud_time, 0, X + 32, Y + 30);
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
	
			draw_text(X + 60, Y + 25, TimeString);
	
			// Draw RINGS
			if !Player.Rings
			{
				draw_anisprite(gui_hud_rings, 8, true, X + 36, Y + 46);
			}
			else
			{
				draw_sprite(gui_hud_rings, 0, X + 36, Y + 46);
			}	
			draw_set_halign(fa_right);
	
			draw_text(X + 92, Y + 41, Player.Rings);

			// Draw LIVES
			draw_set_font(Font.FontDigits2);
			
			if (!Stage.GapLevel) {
				draw_text(X + 65, Y + global.Height - 15, Player.Lives);
	
				draw_sprite(gui_hud_lives, global.Character, X + 40, Y + global.Height - 16);
			}
			else if (Stage.GapLevel) {
				// Set font
				draw_set_alpha(1);
				draw_set_halign(fa_right);
				draw_set_font(Font.FontDefault);
				
				if (Stage.CurrentGapID != -1) {
					var curStaleFactor = Stage.GapStaleList[Stage.CurrentGapID] + Stage.TempStaleList[Stage.CurrentGapID]
					if (curStaleFactor == 0) draw_set_color(c_aqua);
					else if (curStaleFactor >= 4) draw_set_color(c_red);
				}
				draw_text_ext_transformed(global.Width - 8, 8, Stage.CurrentGapName, 8, 256, 1, 1, 0);
				draw_set_color(c_white);
				
				if (Stage.SONICComboList[0]) draw_text(X + 24, Y + 60, "S");
				if (Stage.SONICComboList[1]) draw_text(X + 40, Y + 60, "O");
				if (Stage.SONICComboList[2]) draw_text(X + 56, Y + 60, "N");
				if (Stage.SONICComboList[3]) draw_text(X + 72, Y + 60, "I");
				if (Stage.SONICComboList[4]) draw_text(X + 88, Y + 60, "C");
				
				var barXCenter = global.Width/2
				var barYTop = Y + global.Height - 7
				var barWidth = 64
				var barHeight = 8
				var minColor = Player.GapComboInvincible > 0 ? c_blue : c_red
				var maxColor = Player.GapComboInvincible > 0 ? c_blue : c_green
				
				if (Stage.GapChainCount > 0 or Stage.GapComboTotal > 0) {
					draw_set_alpha(1);
					draw_set_font(Font.FontDefault);
					
					draw_set_color(c_yellow);
					draw_set_halign(fa_left);
					draw_text_ext_transformed(global.Width - 100, Y + global.Height - 31, "CHAIN", 8, 256, 1, 1, 0);
					draw_text_ext_transformed(global.Width - 100, Y + global.Height - 15,"TOTAL", 8, 256, 1, 1, 0);
					
					
					draw_set_halign(fa_right);
					draw_set_color(c_white);
					draw_text_ext_transformed(global.Width - 8, Y + global.Height - 31, string(Stage.GapChainCount), 8, 256, 1, 1, 0);
					draw_text_ext_transformed(global.Width - 8, Y + global.Height - 15, string(Stage.GapComboTotal), 8, 256, 1, 1, 0);
					
					//draw_text_ext_transformed(global.Width/2, Y + global.Height - 15, string(Stage.ComboTimeLeft), 8, 256, 1, 1, 0);
					
					draw_healthbar(barXCenter - barWidth/2, barYTop, barXCenter + barWidth/2, barYTop - barHeight, Stage.ComboTimeLeft / Stage.MaxComboTime * 100, c_black, minColor, maxColor, 0, true, true)
				}
			}
			draw_set_font(Font.FontDefault);
			draw_set_halign(fa_center);
			if (Stage.EventMessage != "" and Stage.EventTimer > 0)
				draw_text(X + global.Width/2, Y + global.Height - 23, Stage.EventMessage);
			
		}
	}
	#endregion
	
	#region Draw Results
	{
		/* Value Table Reference
		----------------------------
		Value[0]  - Timer
		Value[1]  - Character Head X
		Value[2]  - 'CHARACTER GOT ' X
		Value[3]  - 'THROUGH' X
		Value[4]  - 'SCORE' X
		Value[5]  - 'TIME BONUS' X
		Value[6]  - 'RINGS BONUS' X
		Value[7]  - 'ACT' X
		Value[8]  - State
		Value[9]  - Ring Bonus
		Value[10] - Time Bonus
		Value[11] - Continue flag
		----------------------------
		*/
	
		if Stage.IsFinished >= 2
		{
			if !fade_check(StateActive)
			{	
				switch ResultsValue[8]
				{
					case 0:
					{
						// Calculate ring bonus
						ResultsValue[9] = Player.Rings * 100;
			
						// Calculate time bonus
						/*if Stage.Time >= 35940
						{
							ResultsValue[10] = 100000;
						}
						else*/ 
						if Stage.Time < 1800
						{
							ResultsValue[10] = 10000;
						}			
						else if Stage.Time >= 1800 and Stage.Time < 2700
						{
							ResultsValue[10] = 5000;
						}
						else
						{
							switch Stage.Time div 1800
							{
								case 0:			
									ResultsValue[10] = 4000; 
								break;
								case 1:			
									ResultsValue[10] = 4000;  
								break;
								case 2:			
									ResultsValue[10] = 3000;  
								break;
								case 3:			
									ResultsValue[10] = 2000;  
								break;
								case 4: 
								case 5: 
									ResultsValue[10] = 1000;  
								break;
								case 6: 
								case 7: 
									ResultsValue[10] = 500;  
								break;
								case 8: 
								case 9: 
									ResultsValue[10] = 500;   
								break;
								default:
									ResultsValue[10] = 0;	  
							}
						}			
			
						// Check if we can get a continue
						ResultsValue[11] = (ResultsValue[9] + ResultsValue[10] >= 10000);
			
						// Increment state
						ResultsValue[8]++;
					}
					break;
			
					// State 1
					case 1:
					{
						// Shift assets
						if (++ResultsValue[0]) < 300
						{
							if ResultsValue[2]
							{
								ResultsValue[2] -= 20;
							}
							else if ResultsValue[3]
							{
								ResultsValue[3] -= 20;
							}
							else if ResultsValue[7]
							{
								if ResultsValue[1]
								{
									ResultsValue[1] -= 20;
								}
								ResultsValue[7] -= 20;
							}
							else
							{		
								if ResultsValue[4]
								{
									ResultsValue[4] -= 20;
								}
								if ResultsValue[5] 
								{
									ResultsValue[5] -= 20;
								}
								if ResultsValue[6] 
								{
									ResultsValue[6] -= 20;
								}
							}
						}
						else
						{
							if ResultsValue[0] == 300
							{
								audio_sfx_play(sfxScoreCount, true);
							}
				
							// Count bonuses
							if ResultsValue[10]
							{ 
								ResultsValue[10] -= 100;
								Player.Score     += 100;
							}
							if ResultsValue[9]
							{
								ResultsValue[9] -= 100;
								Player.Score    += 100;
							}
			
							// Score tally
							if ResultsValue[10] == 0 and ResultsValue[9] == 0
							{
								audio_sfx_play(sfxScoreTally, false);
								audio_sfx_stop(sfxScoreCount);
					
								// If earned more than 10000 points, grant continue
								if ResultsValue[11]
								{
									ResultsValue[8] = 3;
									ResultsValue[0] = -1;
								}
					
								// Else don't grant anything
								else
								{
									ResultsValue[8] = 2;
									ResultsValue[0] = 0;
								}
							}
						}
					}
					break;
					case 2:
					{
						// No continue
						if (++ResultsValue[0]) == 180
						{
							if (!Stage.NextActFlag) {
								fade_perform(ModeInto, BlendBlack, 1);
					
								Stage.UpdateObjects       = false;
								Renderer.UpdateAnimations = false;
							} else {
								ResultsValue[8] = 4;
								ResultsValue[0] = 0;
							}
						}
					}
					break;
					case 3:
					{
						// Earned continue
						if ResultsValue[0] == -1
						{
							if !audio_sfx_is_playing(sfxScoreTally)
							{
								global.Continues++;
								audio_sfx_play(sfxContinue, false);
						
								// Increment timer
								ResultsValue[0] = 0;
							}
						}
						else if (++ResultsValue[0]) == 260
						{
							if (!Stage.NextActFlag) {
								fade_perform(ModeInto, BlendBlack, 1);
					
								Stage.UpdateObjects       = false;
								Renderer.UpdateAnimations = false;
							} else {
								ResultsValue[8] = 4;
								ResultsValue[0] = 0;
							}
						}
					}
					break;
					// Move the results out the screen
					case 4:
					{
						//var maxDist = 400;
						if ((++ResultsValue[0]) < 60) {
							ResultsValue[1] += 20;
							ResultsValue[2] += 20;
							ResultsValue[3] += 20;
							ResultsValue[4] += 20;
							ResultsValue[5] += 20;
							ResultsValue[6] += 20;
							ResultsValue[7] += 20;
						} else {
							// Reset the position of the results
							ResultsValue[1]  = 400;
							ResultsValue[2]  = 400;
							ResultsValue[3]  = 400;
							ResultsValue[4]  = 400;
							ResultsValue[5]  = 440;
							ResultsValue[6]  = 480;
							ResultsValue[7]  = 560;
							
							ResultsValue[8] = 0;
							
							Stage.IsFinished = 0;
							Stage.ActID++;
							global.CurrentAct++;
							
							if (Stage.StageMusic2) {
								audio_bgm_play(AudioPrimary, Stage.StageMusic2);
							} else {
								audio_bgm_play(AudioPrimary, Stage.StageMusic);
							}
							
							// Trigger the title card
							CardValue[0] = 0;
							CardValue[1] = 0;	
							CardValue[2] = global.Height / 2;
							CardValue[3] = -108;
							CardValue[4] = -100;
							CardValue[5] = 1;
							CardValue[6] = -48;
							CardValue[7] = global.Width * 2 + 128;
							
							// Save these for the end of the title card
							Stage.Time = 0;
							Stage.TimeEnabled = true;
							Player.Rings = 0;
 						}
					}
					break;
					// Reset the act
					case 5:
					{
						
					}
					break;
				}
			}
			
			// Get character
			switch global.Character
			{
				case CharSonic:
				{
					var Char = "SONIC____GOT";
					var Icon = gui_icon_sonic;
				}
				break;
				case CharTails:
				{
					var Char = "TAILS____GOT";
					var Icon = gui_icon_tails;
				}
				break;
				case CharKnuckles:
				{
					var Char = "KNUCKLES____GOT";
					var Icon = gui_icon_knuckles;
				}
				break;
				case CharMighty:
				{
					var Char = "MIGHTY____GOT";
					var Icon = gui_icon_sonic;
				}
				break;
				case CharRay:
				{
					var Char = "RAY____GOT";
					var Icon = gui_icon_sonic;
				}
				break;
				case CharAmy:
				{
					var Char = "AMY____GOT";
					var Icon = gui_icon_amy;
				}
				break;
				default:
				{
					var Char = "CHARACTER____GOT";
					var Icon = noone;
				}
			}
	
			// Get screen centre
			var CentreX = global.Width  / 2 + global.ScreenBuffer;
			var CentreY = global.Height / 2;
			
			// Draw assets and main text
			draw_set_font(Font.FontCard);
			draw_set_halign(fa_center);
			
			draw_sprite(gui_results_head,	   global.Character, CentreX + 83 + ResultsValue[1], CentreY - 25);
			draw_sprite(gui_results_act,	   Stage.ActID,      CentreX + 76 + ResultsValue[7], CentreY - 23);	
			draw_sprite(gui_results_score,	   0,			     CentreX - 58 + ResultsValue[4], CentreY + 20);
			draw_sprite(gui_results_timebonus, 0,			     CentreX - 38 + ResultsValue[5], CentreY + 36);
			draw_sprite(gui_results_ringbonus, 0,			     CentreX - 38 + ResultsValue[6], CentreY + 52);
			
			draw_text(CentreX - 7 - ResultsValue[2], CentreY - 48, Char);
			draw_text(CentreX - 8 - ResultsValue[3], CentreY - 28, "THROUGH");
			
			// Draw continue icon
			if ResultsValue[8] == 3 and Icon != noone
			{
				if ResultsValue[0] >= 0 and ResultsValue[0] mod 32 <= 15
				{
					draw_anisprite(Icon, 8, false, CentreX + 96, CentreY + 11);
				}
			}
	
			// Draw counters
			draw_set_font(Font.FontDigits1);
			draw_set_halign(fa_right);
	
			draw_text(CentreX + 83 + ResultsValue[4], CentreY + 13, Player.Score);
			draw_text(CentreX + 83 + ResultsValue[5], CentreY + 29, ResultsValue[10]);
			draw_text(CentreX + 83 + ResultsValue[6], CentreY + 45, ResultsValue[9]);
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