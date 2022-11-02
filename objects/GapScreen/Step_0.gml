/// @description Main
// You can write your code in this editor

	if (!State and fade_check(StateActive))
	{
		return;
	}
	switch State
	{
		case 0:
		{
			// Shift main text
			if Offset[0] < 0
			{
				Offset[0] += 15;
			}
			if Offset[1]
			{
				Offset[1] -= 15;
			}
			else if Offset[3] > -24
			{
				Offset[3] -= 0.5;
			}
			else
			{	
				// Shift counters
				if Offset[4]
				{
					Offset[4] -= 15;
				}
				if Offset[5]
				{
					Offset[5] -= 15;
				}
			
				// Render emeralds
				if RenderFlag == -1
				{
					RenderFlag = true;
				}
				else if RenderAlpha < 1
				{
					RenderAlpha += 0.1;
				}
				
				if !audio_bgm_is_playing(AudioPrimary)
				{		
					if (global.RingBonus or global.CoolBonus or global.ChainBonus) 
					{
						if global.RingBonus
						{
							if !audio_sfx_is_playing(sfxScoreCount)
							{
								audio_sfx_play(sfxScoreCount, true);
							}
							global.RingBonus	-= 10;
							global.Score		+= 10;
						}
						if global.ChainBonus
						{
							if !audio_sfx_is_playing(sfxScoreCount)
							{
								audio_sfx_play(sfxScoreCount, true);
							}
							global.ChainBonus	-= 10;
							global.Score		+= 10;
						}
						if global.CoolBonus
						{
							if !audio_sfx_is_playing(sfxScoreCount)
							{
								audio_sfx_play(sfxScoreCount, true);
							}
							global.CoolBonus	-= 10;
							global.Score		+= 10;
						}
					}
					else if global.Score < global.LastScoreTarget
					{
						audio_sfx_stop(sfxScoreCount);
						audio_sfx_play(sfxScoreTally, false);
						
						// Increment state
						State++;
					}
					else
					{
						audio_sfx_stop(sfxScoreCount);
						audio_sfx_play(sfxScoreTally, false);
						
						// Lower state
						State--;
					}
				}
			}
		}
		break;
		
		// Shift main text back to show "character can be super" message
		case -1:
		{
			if Offset[2] >= 0
			{
				Offset[2] -= 30;
			}
			else if !audio_sfx_is_playing(sfxScoreTally)
			{
				if global.LastZoneCleared == 0
				{
					if global.LastRingCleared == 0 or global.LastRingCleared == 2 and !global.SpecialRingList[global.LastZoneCleared][global.LastRingCleared+1]
					{
						global.SpecialRings++;
						global.SpecialRingList[global.LastZoneCleared][global.LastRingCleared+1] = 2;
					}
				}
				audio_sfx_play(sfxEmerald, false);
				// Increment state
				State += 2;
			}
		}
		break;
		case 1:
		{
			// Shift "character can be super" message
			if global.Emeralds == 7
			{
				if Offset[0] < 0
				{
					Offset[0] += 30;
				}
				if Offset[1]
				{
					Offset[1] -= 30;
				}
			}
			
			// Increment state and perform fade after 3 seconds
			if ((++RoomTimer) >= 180) and !audio_sfx_is_playing(sfxEmerald)
			{
				State++
				
				fade_perform(ModeInto, BlendWhite, 1);
				audio_sfx_play(sfxSpecialWarp, false);
			}
		}
		break;
		case 2:
		{
			// Fade to black and increment state
			if fade_check(StateMax)
			{
				State++;
				fade_perform(ModeInto, BlendBlack, 1);
			}
		}
		break;
		case 3:
		{			
			if fade_check(StateMax) and !audio_sfx_is_playing(sfxSpecialWarp)
			{
				global.LastZoneCleared = 0;
				global.LastRingCleared = 0;
				
				// Save our progress
				if global.ActiveSave != -1
				{
					//savedata_save(global.ActiveSave);
					savedata_save_ini(global.ActiveSave);
				}
				
				if (global.ReturnRoom) {
					room_goto(global.ReturnRoom);
				} else {
					room_goto(Screen_DevMenu);
				}
			}
		}
		break;
	}
	
	// Flick emeralds
	if RenderFlag != -1
	{
		RenderFlag = !RenderFlag;
	}