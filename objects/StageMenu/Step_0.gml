/// @description Main
// You can write your code in this editor
	
	#region Manual Process
	{
		if (Input.APress or Input.StartPress or Input.DownPress or Input.UpPress) {
			audio_sfx_play(sfxSwitch, false);
		}
		switch MenuID
		{
			// Character Select
			case 0:
			{
				if Input.APress or Input.StartPress
				{
					if (OptionID == 4) {
						room_goto(Screen_DevMenu);
					}
				}
			}
			break;
			
			// Level Type Select Menu
			case 1:
			{
				if (Input.APress or Input.StartPress)
				{
					global.Character = OptionID;
					/* Else automatic sredirection will happen here */
				}
			}
			break;
		
			// Gap & Special Level Menu
			case 2:
			case 3:
			{
				if Input.APress or Input.StartPress
				{	
					// Load into the game
					if MenuRedirect[MenuID][OptionID] != noone
					{
						global.Lives	  =  3;
						global.Continues  =  2;
						global.Score	  =  0;
						global.ZoneID     =  0;
						global.SaveState  =  0;
						global.ReturnRoom  =  StageRoom;
					
						room_goto(MenuRedirect[MenuID][OptionID]); 
					}
					else
					{
						show_message("NO STAGE FOUND! \nTarget room is set to NOONE for this option");
					}
					// Cancel automatic process
					return;
				}		
			}
			break;
			
			// Zone Select
			case 4:
			{
				if Input.APress or Input.StartPress
				{
					if MenuRedirect[MenuID][OptionID] != noone
					{
						room_goto(MenuRedirect[MenuID][OptionID]);
					} 
					else
					{
						show_message("NO STAGE FOUND! \nTarget room is set to NOONE for this option");
					}
					// Cancel automatic process
					return;
				}
			}
			break;
	
			// Options
			case 6:
			{	
				if Input.LeftPress or Input.RightPress
				{
					switch OptionID
					{
						// Fullscreen toggle
						case 0:	
						{		
							window_set_fullscreen(!window_get_fullscreen());
						}
						break;
					
						// Window size toggle
						case 1:
						{
							global.WindowSize = loop_value(global.WindowSize + (Input.RightPress ? 1 : -1), 1, 4);
						
							window_set_size(global.Width * global.WindowSize, global.Height * global.WindowSize);
						}
						break;
					
						// SFX volume
						case 2:
						{
							global.SoundVolume = loop_value(global.SoundVolume * 10 + (Input.RightPress ? 1 : -1), 0, 10) / 10;
						}
						break;
		
						// BGM volume
						case 3:
						{
							global.MusicVolume = loop_value(global.MusicVolume * 10 + (Input.RightPress ? 1 : -1), 0, 10) / 10;
						}
						break;
					}
				}
			
				// Update config file
				else if Input.BPress
				{
					settings_save();
				}
			}
			break;
		
			// Save Deletion
			case 7:
			{
				
			}
			break;
		}
	}
	#endregion
	
	#region Automatic Process
	{
		// Navigate between options
		if Input.DownPress
		{
			OptionID++;
		}
		else if Input.UpPress
		{
			OptionID--; 
		}
		OptionID = loop_value(OptionID, 0, MenuSize[MenuID] - 1);
	
		// Select
		if Input.APress or Input.StartPress
		{
			var Target  = MenuRedirect[MenuID][OptionID];
			if  Target != noone
			{
				PreviousOptionID[Target] = OptionID;
				PreviousMenuID[Target]   = MenuID;
				MenuID					 = Target;
				OptionID				 = 0;
	
				Input.APress	 = false;
				Input.StartPress = false;
			}
		}

		// Back to previous menu
		if Input.BPress and MenuID != 0
		{
			if PreviousOptionID[MenuID] != noone
			{
				OptionID = PreviousOptionID[MenuID];
			}
			else
			{
				OptionID = 0;
			}
			MenuID		 = PreviousMenuID[MenuID];
			Input.BPress = false;
		}
	}
	#endregion
	
	#region Update Option Strings
	{
		/* Because automatic process (i.e. redirection) happens after manual process,
		there is 1 frame delay for strings that have to load some data to display, so
		we're updating them here */
		
		// Exit if we're not in the options menu
		if MenuID != 6
		{
			return;
		}
		
		// Get initial option name
		var Option0 = menu_get_initial_string(MenuID, 0);
		var Option1 = menu_get_initial_string(MenuID, 1);
		var Option2 = menu_get_initial_string(MenuID, 2);
		var Option3 = menu_get_initial_string(MenuID, 3);
		
		// Update option
		menu_update_option(MenuID, 0, Option0 + menu_get_boolean(window_get_fullscreen()));
		menu_update_option(MenuID, 1, Option1 + string(global.WindowSize) + "X");
		menu_update_option(MenuID, 2, Option2 + string(round(global.SoundVolume * 100)));
		menu_update_option(MenuID, 3, Option3 + string(round(global.MusicVolume * 100)));
	}
	#endregion