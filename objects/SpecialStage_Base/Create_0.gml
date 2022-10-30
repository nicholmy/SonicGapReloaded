/// @description Startup
// You can call your scripts in this editor
	
	SpStageSetup();

	// Put the special stage music in Setup

	#region Startup
	{
		RightBoundary  =  room_width;
		LeftBoundary   =  0;
		TopBoundary	   =  0;
		RestartTimer   =  0;
		RestartEvent   =  0;
		WaterOffset	   =  0;
		IsFinished	   =  0;
		IsPaused	   =  0;
		Time		   =  MaxTime;
		TimeEnabled	   =  0;
		IsBossfight    = -1;
		GapLevel       = false;
		OscillateAngle = -2.8125;
		UpdateObjects  =  false;
		CurrentGapID   = -1;
		CurrentGapName = "";
		CurrentGapType = -1; // 0 - Ramp, 1 - Transfer, 2- Loop/Ceiling
		CurrentGapState = -1;
		CurrentTriggerID = -1;
		GapChainCount	= 0;
		GapComboTotal	= 0;
		GapStaleList	= [];
		CurrentSONICID = -1;
		PlayRingSpawnSound = false;
		
		RingSpawnState	= 0; // 0 = Ring hasn't spawned, 1 = Ring has spawned, 2 = All Rings have spawned
		RingSpawnTimer	= 0;
		if (SpecialStageType == 1) {
			RingsLeft = instance_number(BonusRing);
		}
		if (SpecialStageType == 2) {
			EnemiesLeft = instance_number(Enemy);
		}
		if (SpecialStageType == 0 or SpecialStageType == 1 or SpecialStageType == 3) {
			EnemiesLeft = 0;
		}
		if (SpecialStageType == 0 or SpecialStageType == 2) {
			RingsLeft = 0;
		}
	
		// Remember current room index
		//global.ReturnRoom = room;
	
		// Set bubble wobble data (could be done with sinwave, but that's a method straight from the original games)
		if WaterEnabled
		{
			WobbleData =
			[ 
			  0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2,
			  2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
			  3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2,
			  2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0,
			  0,-1,-1,-1,-1,-1,-2,-2,-2,-2,-2,-3,-3,-3,-3,-3,
			 -3,-3,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,
			 -4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-4,-3,
			 -3,-3,-3,-3,-3,-3,-2,-2,-2,-2,-2,-1,-1,-1,-1,-1
			]
		}
	
		// Set stage boundaries
		TargetLeftBoundary   = LeftBoundary;
		TargetRightBoundary  = RightBoundary;
		TargetTopBoundary    = TopBoundary;
		TargetBottomBoundary = BottomBoundary;
		DeathBoundary        = BottomBoundary;
	
		// Play stage music
		fade_perform(ModeFrom, BlendWhite, 1);
		audio_bgm_play(AudioPrimary, StageMusic);
	}
	#endregion