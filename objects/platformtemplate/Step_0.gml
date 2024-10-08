/// @description Main
// You can write your code in this editor
	
	switch State
	{
		case 0:
		{
			var PosX = OriginX;
			var PosY = OriginY;
			
			// Lower the platform
			if object_check_player(ColSolidU)
			{
				if MovementType == "Falls When Stood On"
				{
					FallFlag = true;
				}
				Weight += 0.25;
			}
			else
			{
				Weight -= 0.25;
			}
			Weight = clamp(Weight, 0, 4);
			
			if (!allowWeight) Weight = 0;
			
			// Update platform movement
			if MovementType == "Falls When Stood On"
			{
				if FallFlag and (++Timer) == 30
				{
					State  += 1;
					Timer   = 31;
					OriginY = OriginY + Weight;
					
					// Platform should reset itself once it goes off-screen
					object_set_unload(FlagReset);
					
					return;
				}
			}
			else 
			{
				var Angle = Stage.OscillateAngle * Stage.Time / 2;
				
				switch MovementType
				{
					case "Left -> Right":
						PosX += dcos(Angle + 180) * 64;
					break;
					case "Right -> Left":
						PosX += dcos(Angle) * 64;
					break;
					case "Up -> Down":
						PosY += dcos(Angle + 180) * 64;
					break;
					case "Down -> Up":
						PosY += dcos(Angle) * 64;
					break;
					case "Rectangle":
						if (pathState == 0) {
							x = OriginX;
							y += 2;
							if (pathProgress >= 32) {
								pathState = 1;
								pathProgress = 0;
							} else {
								pathProgress++;
							}
						}
						if (pathState == 1) {
							x += 2;
							y = OriginY + 64;
							
							if (pathProgress >= 64) {
								pathState = 2;
								pathProgress = 0;
							} else {
								pathProgress++;
							}
						}
						if (pathState == 2) {
							x = OriginX + 128;
							y -= 2;
							if (pathProgress >= 32) {
								pathState = 3;
								pathProgress = 0;
							} else {
								pathProgress++;
							}
						}
						if (pathState == 3) {
							x -= 2;
							y = OriginY;
							
							if (pathProgress >= 64) {
								pathState = 0;
								pathProgress = 0;
							} else {
								pathProgress++;
							}
						} 
					break;
				}
			}
			
			switch MovementType
			{
				case "Left -> Right":
				case "Right -> Left":
				case "Up -> Down":
				case "Down -> Up":
					// Update position
					x = round(PosX);
					y = round(PosY + Weight);
				break;
			}
			
			if (isFullySolid) object_act_solid(true, true, true, false);
			else {
				// Do collision
				object_act_solid(false, true, false, false);
			}
		}
		break;
		case 1:
		{
			if y > Stage.BottomBoundary
			{
				State++;
			}
			
			// Move and update position
			FallSpeed += 0.21875;
			OriginY   += FallSpeed;
			y		   = floor(OriginY);
		
			// Make player lose the platform after 32 frames
			if (--Timer) == 0
			{
				if object_check_player(ColSolidU)
				{
					Player.Ysp		= FallSpeed;
					Player.OnObject = false;
					Player.Grounded = false;
				}
			}
			else
			{
				if (isFullySolid) object_act_solid(true, true, true, false);
				else {
					// Do collision
					object_act_solid(false, true, false, false);
				}
			}
		}
		break;
	}