/// @description Startup / Setup
// You can write your code in this editor
	ScoreTarget = 0;
	
	// Setup Script
	StageSetup();
	
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
		UpdateObjects  =  false;
		EventMessage = "HEAD TO THE EXIT!";
		EventTimer = 0;
		
		CurrentGapID   = -1;
		CurrentGapName = "";
		CurrentGapType = -1; // 0 - Ramp, 1 - Transfer
		CurrentGapState = -1;
		CurrentTriggerID = -1;
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
	
		// Load saved data if loading into the stage from Bonus or Special Stage
		if array_length(global.StarPostData)
		{
			Time		   = global.StarPostData[2];
			BottomBoundary = global.StarPostData[3];
		}
		if array_length(global.SpecialRingData)
		{
			Time		   = global.SpecialRingData[4];
			BottomBoundary = global.SpecialRingData[5];		
		}
	
		// Set stage boundaries
		TargetLeftBoundary   = LeftBoundary;
		TargetRightBoundary  = RightBoundary;
		TargetTopBoundary    = TopBoundary;
		TargetBottomBoundary = BottomBoundary;
		DeathBoundary        = BottomBoundary;
	
		// Play stage music
		audio_bgm_play(AudioPrimary, StageMusic);
	}
	#endregion