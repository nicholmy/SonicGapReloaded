/// @description Main
// States:
// 0 - Untouched, showing eggman
// 1 - Flying through the air
// 2 - Landed on the ground
// 3 - Tell the stage to finish
// 4 - Spun, unspinnable again
	
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
				Stage.NextActFlag = nextAct;
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
				
				
				// Make the goal point the checkpoint
				global.StarPostData[0] = x;
				global.StarPostData[1] = y + sprite_get_height(sprite_index) div 2 - Player.DefaultRadiusY - 1;
				global.StarPostData[2] = Stage.Time;
				global.StarPostData[3] = room_height;
				global.StarPostData[4] = CheckpointID;
				
				//global.Score		   = Player.Score;
				
				
				// Increment state
				State++;
			}
		}
		break;
		case 1:
		{
			animation_play(SpriteData[0], 1, 0);
			
			if (place_meeting(x, y-1, Player) and YSpeed > 0 and Player.Ysp < 0){
				YSpeed = Player.Ysp;
				XSpeed = (x - Player.PosX)/6;
				audio_sfx_play(sfxBumper, false);
				instance_create(x, y, ScoreObject);
			}
			
			if (x < Camera.ViewX + sprite_width/2) {
				 XSpeed = 2;
	        }  
	        if (x > Camera.ViewX+global.Width - sprite_width/2){
	            XSpeed = -2;
	        }   
			
			YSpeed += FallGrav 
		    if(YSpeed > 4){
		        YSpeed = 4;
		    }
			x += XSpeed;
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
				Player.InvincibleBonus = 0;
				Player.HighspeedBonus = 0;	
				audio_bgm_play(AudioPrimary, ActClear);
				State = 4;
			}	
		}
		//Activated but won't trigger again
		case 4:
		{
		}
		break;
	}
	
	// If the sign comes into view, update stage boundaries
	if State <= 3 and Camera.ViewX > x - global.Width - 16 and Camera.ViewX < x + global.Width/2 - 16
	{
		/*if State
		{
			Stage.TargetLeftBoundary = x - (global.Width / 2);
			Stage.TargetRightBoundary = x + (global.Width / 2);
		}
		else
		{
			Stage.TargetLeftBoundary  = x - global.Width / 2;
			Stage.TargetRightBoundary = x + global.Width / 2;
			Stage.TargetBottomBoundary = y + 64;
		}*/
		
		if !State {
			Stage.TargetLeftBoundary  = x - global.Width / 2;
			Stage.TargetRightBoundary = x + global.Width / 2;
			Stage.TargetBottomBoundary = y + 64;
		}
		
	}