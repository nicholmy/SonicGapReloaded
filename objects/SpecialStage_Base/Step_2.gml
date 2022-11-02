/// @description Process Stage / Objects
// You can write your code in this editor
	
#region Process Gameplay
{
	// Process stage timer
	if TimeEnabled
	{
		if (--Time) <= 0
		{
			Time = 0;
			player_damage(false, false, true);
		}	
	}
	
	// Process animated graphics
	if AnimatedGraphics != noone
	{	
		var Update = Renderer.UpdateAnimations; 
		var Length = array_length(AnimatedGraphics);
		
		for (var i = 0; i < Length; i += 2)
		{
			if Update
			{
				var AnimSpeed = 1 / AnimatedGraphics[i + 1];
			}
			else
			{
				var AnimSpeed = 0;
			}
			sprite_set_speed(AnimatedGraphics[i], AnimSpeed, spritespeed_framespergameframe);
		}
	}

	// Process player's death event
	if Player.Death
	{
		Camera.Enabled = false;
		UpdateObjects  = false;
		TimeEnabled    = false;
		global.InSpecialStage = false;
		
		if !global.S3DeathRestart and floor(Player.PosY) >= Stage.BottomBoundary + 32
		or  global.S3DeathRestart and floor(Player.PosY) >= Camera.ViewY + global.Height + 32
		{
			RestartTimer++;
			
			// Wait for 1 (or 12 if the event was triggered) seconds
			if RestartTimer == RestartEvent * 660 + 60
			{
				fade_perform(ModeInto, BlendBlack, 1);
				
				audio_bgm_stop(AudioPrimary,   0.5);
				audio_bgm_stop(AudioSecondary, 0.5);
			
				// Stop animations and background autoscrolling
				Renderer.UpdateAnimations = false;
			}
		
			// Wait until we fade out
			if fade_check(StateMax)
			{	
				room_goto(global.ReturnRoom);
			}
		}
	}
}
#endregion
	
#region Process Boundaries
{
	if UpdateObjects
	{
		// Update left boundary
		if LeftBoundary < TargetLeftBoundary
		{
			if Camera.ViewX >= TargetLeftBoundary
			{
				LeftBoundary = TargetLeftBoundary
			}
			else
			{
				if Camera.ViewX >= LeftBoundary
				{
					LeftBoundary = Camera.ViewX
				}
				LeftBoundary = min(LeftBoundary + 2, TargetLeftBoundary);
			}
		}
		else if LeftBoundary > TargetLeftBoundary
		{
			LeftBoundary = max(TargetLeftBoundary, LeftBoundary - 2);
		}
	
		// Update right boundary
		if RightBoundary < TargetRightBoundary
		{
			RightBoundary = min(RightBoundary + 2, TargetRightBoundary)
		}
		else if RightBoundary > TargetRightBoundary
		{
			if Camera.ViewX + global.Width >= TargetRightBoundary
			{
				RightBoundary = Camera.ViewX + global.Width;
				RightBoundary = max(TargetRightBoundary, RightBoundary - 2);
			}
			else if Camera.ViewX + global.Width <= TargetRightBoundary
			{
				RightBoundary = TargetRightBoundary
			}
		}
	
		// Update top boundary
		if TopBoundary < TargetTopBoundary
		{
			if Camera.ViewY >= TargetTopBoundary
			{
				TopBoundary = TargetTopBoundary
			}
			else
			{
				if Camera.ViewY > TopBoundary
				{
					TopBoundary = Camera.ViewY;
				}
				TopBoundary = min(TopBoundary + 2, TargetTopBoundary);
			}
		}
		else if TopBoundary > TargetTopBoundary
		{
			TopBoundary = max(TargetTopBoundary, TargetTopBoundary - 2);
		}
	
		// Update bottom boundary
		if BottomBoundary < TargetBottomBoundary
		{
			BottomBoundary = min(BottomBoundary + 2, TargetBottomBoundary);
			DeathBoundary  = TargetBottomBoundary;
		}
		else if BottomBoundary > TargetBottomBoundary
		{
			if Camera.ViewY + global.Height >= TargetBottomBoundary
			{
				BottomBoundary = Camera.ViewY + global.Height
				BottomBoundary = max(TargetBottomBoundary, BottomBoundary - 2);
			}
			else if Camera.ViewY + global.Height <= TargetBottomBoundary
			{
				BottomBoundary = TargetBottomBoundary;
			}
			DeathBoundary = BottomBoundary;
		}
	
		// Keep boundaries within the room size
		TopBoundary    = max(0,			  TopBoundary);
		LeftBoundary   = max(0,			  LeftBoundary);
		RightBoundary  = min(room_width,  RightBoundary);
		BottomBoundary = min(room_height, BottomBoundary);
		DeathBoundary  = min(room_height, DeathBoundary);
	}
}
#endregion
	
#region Process Objects
{
	if UpdateObjects
	{
		/* Set active object bounds, accurate to the originals (if Width is set to 320px obviously, else adjusted). 
		If you decide to change that, also update instance_activate_range() */
		var LeftBound   = (Camera.ViewX & -128) - 128;
		var RightBound  = (Camera.ViewX & -128) + global.Width + 320;
	
		with all 
		{	
			switch Obj_UnloadType
			{
				// Destroy object
				case FlagDelete:
				{
					if x < LeftBound or x > RightBound or y > Stage.BottomBoundary or y < Stage.TopBoundary
					{
						instance_destroy();
					}
				}
				break;
					
				// Deactivate object
				case FlagPause:
				{
					if x < LeftBound or x > RightBound
					{
						if Obj_UnloadData[0] < LeftBound or Obj_UnloadData[0] > RightBound
						{
							instance_deactivate_object(id);
						}
					}
				}
				break;
					
				// Reset object
				case FlagReset:
				{
					if x < LeftBound or x > RightBound
					{
						if Obj_UnloadData[0] < LeftBound or Obj_UnloadData[0] > RightBound
						{
							// Reset data
							x			 = Obj_UnloadData[0];
							y			 = Obj_UnloadData[1];
							image_xscale = Obj_UnloadData[2];
							image_yscale = Obj_UnloadData[3];
							image_index  = Obj_UnloadData[4];
							sprite_index = Obj_UnloadData[5];
							visible      = Obj_UnloadData[6];
							
							// Reset animation data
							Obj_AnimDuration = 0;
							Obj_AnimTimer    = 0;
									
							// Perform create event to re-initialise variables and then deactivate object
							event_perform(ev_create, 0);
							instance_deactivate_object(id);
						}
						else
						{
							// Make object "disappear" until its initial position goes off-screen
							x = -128;
							y = -128;
								
							// Call Create event in case object is using its own variables for positioning
							event_perform(ev_create, 0);
						}
					}
				}
				break;
			}
		}
	}
	
	// Load objects (objects that were deactivated on this frame won't be activated!)
	instance_activate_range(Camera.ViewX);
}
#endregion
	
#region Process Stage Success
{
	if (IsFinished) {
		Stage.TimeEnabled = false;
		
		// Take control away from the player
		if !Player.DebugMode
		{
			if !Input.IgnoreInput
			{
				Input.IgnoreInput = true;
			}
			
			Player.Xsp = 0;
			Player.Ysp = 0;
		}
		
		// Return back to SS Screen to display results
		if fade_check(StateMax)
		{
			room_goto(Screen_SStage);
		}
	}
	
	// Check if the player passed by the right boundary
	if floor(Player.PosX) > Stage.RightBoundary - 24
	{
		if Stage.IsFinished < 2
		{
			// Increment stage state
			Stage.IsFinished  = 2;
					
			//audio_bgm_play(AudioPrimary, ActClear);
		}	
	}
}
#endregion

if (instance_exists(BonusRing_Spawner) and RingSpawnState == 0 and RingSpawnTimer <= 0 and RingsLeft > 0) {
	var totalSpawners = instance_number(BonusRing_Spawner);
		
	var spawners = array_create(totalSpawners);
		
	var i = totalSpawners - 1;
	with (BonusRing_Spawner) {
		spawners[i] = id;
		i--;
	}
		
	var pickedI = irandom(totalSpawners-1);
	show_debug_message(string(pickedI)+" out of " + string(totalSpawners));
	instance_create(spawners[pickedI].x, spawners[pickedI].y, BonusRing_Decay);
	if (PlayRingSpawnSound) {
		audio_sfx_play(sfxSwitch, false)
	} else {
		PlayRingSpawnSound = true;
	}
	if (RingsLeft <= 0) {
		RingSpawnState = 2;
	} else {
		RingSpawnState = 1;
	}
} else if (RingSpawnState == 1 and !instance_exists(BonusRing) and RingSpawnTimer <= 0) {
	RingSpawnState = 0;
	RingSpawnTimer = 45;
}

if (RingSpawnTimer > 0) {
	RingSpawnTimer--;
}

if (EventTimer > 0) EventTimer--;