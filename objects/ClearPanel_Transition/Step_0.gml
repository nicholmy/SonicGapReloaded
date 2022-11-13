/// @description Main
// You can call your scripts in this editor
	
	if PlayerType == "Sonic & Tails" and global.Character == CharKnuckles
	or PlayerType == "Knuckles"		 and global.Character != CharKnuckles
	{
		visible = false;
		return;
	}
	
	switch State
	{
		// Idle
		case 0:
		{
			if object_check_player(ColTrigger)
			{
				// Make player exit their super form
				if Player.SuperState
				{
					Player.SuperState = false;
					audio_bgm_play(AudioPrimary, Stage.StageMusic);	
				}
				Stage.TimeEnabled = false;
				Stage.IsFinished  = 1;

				audio_sfx_play(sfxClearPanel, false);
				animation_play(SpriteData[0], 1, 0);
				
				// Launch the sign
				YSpeed = max(-abs(Player.Xsp) / 1.5, -8);
				
				// Increment state
				State++;
			}
		}
		break;
		case 1:
		{
			animation_play(SpriteData[0], 1, 0);
			
			YSpeed += FallGrav 
		    if(YSpeed > 4){
		        YSpeed = 4;
		    }
		    y  += YSpeed;
			
			// If the sign detects the ground underneath...
			if(tile_check(x, y + 23 + YSpeed, false, LayerA) && YSpeed > 0){ 
				// Scoot it down until it actually hits the ground
			    while(!tile_check(x, y + 23 + sign(YSpeed), false, LayerA)){ 
			        y += sign(YSpeed);
			    } 
			    XSpeed = 0;
			    YSpeed = 0;
			    State++;
	       }
		}
		break;
		case 2:
		{
			if (++StateTimer) == 62
			{
				// Switch to second animation
				animation_play(SpriteData[1], 1, 0);
			}
			else if StateTimer == 123
			{		
				animation_set(sprite_index, 0);
				
				// Increment state
				State++;
			}
		
			// Create as sparkle every 12th frame
			if StateTimer mod 12 == 0 and SparkleID < 8
			{
				instance_create(x + SparkleX[SparkleID], y + SparkleY[SparkleID], RingSparkle);
				SparkleID++;
			}
		}
		break;
		case 3:
		{
			if Stage.IsFinished < 2
			{
				// Increment stage state
				Stage.IsFinished  = 2;
					
				audio_bgm_play(AudioPrimary, ActClear);
			}	
		}
	}
	
	// Update stage boundaries
	if Camera.ViewX > x - global.Width * 1.5 + 64
	{
		if State
		{
			Stage.TargetLeftBoundary = x - (global.Width / 2);
			Stage.TargetRightBoundary = x + (global.Width / 2);
		}
		else
		{
			Stage.TargetLeftBoundary  = x - global.Width * 1.5 + 64;
			Stage.TargetRightBoundary = x + global.Width / 2;
			Stage.TargetBottomBoundary = y + 64;
		}

	}