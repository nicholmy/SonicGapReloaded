/// @description Startup / Setup
// You can write your code in this editor
	ScoreTarget = 0;
	
	// Setup Script
	StageSetup();
	MapSetup();
	
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
		Time		   =  0;
		TimeEnabled	   =  0;
		IsBossfight    = -1;
		OscillateAngle = -2.8125;
		AngleTimer     =  0;
		UpdateObjects  =  false;
		EventMessage = "HEAD TO THE EXIT!";
		EventTimer = 0;
		NextActFlag = false;
		NextAct = false;
		ActID = global.CurrentAct;
		BossHealth = 0;
		StageType = 0; // 0 - Map Stage, 1 - Normal Level, 2 - Gap Level, 3 - Special Stage
		
		CurrentGapID   = -1;
		CurrentGapName = "";
		CurrentGapType = -1; // 0 - Ramp, 1 - Transfer
		CurrentGapState = -1;
		CurrentTriggerID = -1;
		CurrentGapTimer = 0;
		HighestChain = 0;
		GapChainCount = 0;
		GapComboTotal = 0;
		MaxComboTime = 60;
		ComboTimeLeft = 0;
		CurrentSONICID = -1;
		HighSpeedBonusStart = false;
		HighSpeedTimer = 0;
		SONICComboList = [false, false, false, false, false];
		if (GapLevel) {
			GapStaleList = array_create(array_length(GapNameList))
			TempStaleList = array_create(array_length(GapNameList))
		}
	
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
	
		// Load saved data if loading into the stage from Bonus or Special Stage
		if array_length(global.StarPostData)
		{
			Time		   = global.StarPostData[2];
			BottomBoundary = global.StarPostData[3];
		}
		/*
		if array_length(global.SpecialRingData)
		{
			Time		   = global.SpecialRingData[4];
			BottomBoundary = global.SpecialRingData[5];		
		}
		*/
	
		// Set stage boundaries
		TargetLeftBoundary   = LeftBoundary;
		TargetRightBoundary  = RightBoundary;
		TargetTopBoundary    = TopBoundary;
		TargetBottomBoundary = BottomBoundary;
		DeathBoundary        = BottomBoundary;
	
		// Play stage music
		if (global.CurrentAct == 1 and StageMusic2) {
			audio_bgm_play(AudioPrimary, StageMusic2);
		} else {
			audio_bgm_play(AudioPrimary, StageMusic);
		}
	}
	#endregion