/// @description Main 1
// You can call your scripts in this editor

	/* This is called before stage objects are processed */
	
	if PlayerDebugMode()
	{
		return;
	}
	else if PlayerProcess()
	{
		PlayerMovementState();
		//if (MoveState == StateCommon) {
			// Airborne
			if !Grounded
			{
				if !GlideState and !ClimbState
				{
					// Not gliding or climbing
				
					PlayerJump();
					PlayerMovementAir();
					PlayerLevelBound();
					PlayerPosition();
					PlayerSonicDropdash();
					PlayerTailsFlight();
					PlayerRayFlight();
					PlayerMightyHammerDrop();
					PlayerAirLevelCollision();
				}
				else
				{
					// Gliding or climbing
					PlayerMovementAir();
					PlayerKnuxGlideControl();
					PlayerLevelBound();
					PlayerPosition();
					PlayerKnuxGlide();
					PlayerKnuxClimb();
				}
				PlayerAmyHammerState();
				PlayerResetOnFloor();
				PlayerHitboxUpdate();
			}
		
			// Grounded
			else
			{
				if !Spinning
				{
					// Not rolling
					if PlayerSpindash()  return;
					if PlayerPeelout()   return;
					if PlayerJumpStart() return;
					PlayerSlopeResist();
					PlayerMovementGround();
					PlayerBalance();
					PlayerGroundWallCollision();	
					PlayerRollStart();	
				}
				else
				{
					// Rolling
					if PlayerJumpStart() return;
					PlayerSlopeResistRoll();	
					PlayerMovementRoll();
					PlayerGroundWallCollision();
				}
				
				PlayerAmyHammerState();
				PlayerGapComboCheck();
				PlayerLevelBound();
				PlayerPosition();
				PlayerGroundFloorCollision();
				PlayerSlopeRepel();
				PlayerHitboxUpdate();
			}
		/*} else {
			PlayerGroundWallCollision();
			PlayerGapComboCheck();
			PlayerLevelBound();
			PlayerPosition();
			
			PlayerGroundFloorCollision();
			PlayerHitboxUpdate();
		}*/
	}	