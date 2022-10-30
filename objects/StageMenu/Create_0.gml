/// @description Startup
// You can write your code in this editor

	#region Controller Functions
	{
		/// @function menu_add_option(listid,optionid,optionname,redirect)
		function menu_add_option(listid,optionid,optionname,redirect)
		{
			MenuSize[listid]++;
			MenuOption[listid][optionid]   = optionname;
			MenuOption2[listid][optionid]  = optionname;
			MenuRedirect[listid][optionid] = redirect;
		}
	
		/// @function menu_update_option(listid,optionid,newname)
		function menu_update_option(listid,optionid,newname)
		{
			MenuOption[listid][optionid] = newname;
		}
	
		/// @function menu_get_initial_string(listid,optionid)
		function menu_get_initial_string(listid,optionid)
		{
			return MenuOption2[listid][optionid];
		}
	
		/// @function menu_add_header(listid,header)
		function menu_add_header(listid,header)
		{
			MenuHeader[listid] = header;	
		}
	
		/// @function menu_get_boolean(variable)
		function menu_get_boolean(variable)
		{
			if variable
			{
				return "TRUE";
			}
			else
			{
				return "FALSE";
			}
		}
	}
	#endregion
	
	#region Startup
	{
		// Initialise MenuIDs. 20 by default
		for (var i = 0; i < 20; i++)
		{
			MenuHeader[i]	  = "TEMPLATE HEADER";
			MenuSize[i]	      = 0;
			PreviousMenuID[i] = 0;
		}
		MenuID   = 0;
		OptionID = 0;
		StartStage = 0;
	
		// Set font and its align
		draw_set_font(Font.FontMenu);
		draw_set_halign(fa_center);
	}
	#endregion
	
	#region Data Read
	{
		
	}
	#endregion
