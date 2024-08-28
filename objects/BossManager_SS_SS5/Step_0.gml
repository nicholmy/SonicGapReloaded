/// @description Insert description here
// You can write your code in this editor

if (!defeated) {
	SpecialStage_Base.BossHealth = boss.Health
	
	/*
	Eggy Face States
	0 - Idle
	1 - Moving
	2 - Ouch
	3 - Happy
	4 - Dying
	5 - Dead
	6 - Panic
	*/
	switch state {
		// Eggy is moving to the left target point
		case 0:
			switchTimer = 0;
			with Eggmobile {
				if (point_distance(x, y, other.leftTargetX, other.leftTargetY) > 4){
					if (hittable) face.state = 0;
					move_towards_point(other.leftTargetX, other.leftTargetY, 4);
					// Face the target
					image_xscale = sign(other.leftTargetX - x);
				} else {
					speed = 0;
					x = other.leftTargetX;
					y = other.leftTargetY;
					other.alarm[0] = 30;
					other.state = 1;
				}
			}
			break;
		// Eggy is committing to laughing at you
		case 1:
			switchTimer = 0;
			with Eggmobile {
				if (hittable) face.state = 3;
				// Face the player
				image_xscale = sign(Player.x - x);
			}
			break;
		// Eggy on left side
		case 2:
			// If the player is underneath eggy, count how long
			if (Player.x < x) {
				with Eggmobile {
					if (hittable) face.state = 0;
					image_xscale = 1;
				}
				switchTimer++;
				if (switchTimer >= switchTimerMax) state = 3;
			} else {
				with Eggmobile {
					if (hittable) face.state = 3;
				}
				switchTimer = 0;
			}
			break;
		// Eggy is moving to the right target point
		case 3:
			switchTimer = 0;
			with Eggmobile {
				if (point_distance(x, y, other.rightTargetX, other.rightTargetY) > 4){
					if (hittable) face.state = 0;
					move_towards_point(other.rightTargetX, other.rightTargetY, 4);
					// Face the target
					image_xscale = sign(other.rightTargetX - x);
				} else {
					speed = 0;
					x = other.rightTargetX;
					y = other.rightTargetY;
					other.alarm[1] = 30;
					other.state = 1;
				}
			}
			break;
		// Eggy on the right side
		case 4:
			// If the player is underneath eggy, count how long
			if (Player.x > x) {
				with Eggmobile {
					if (hittable) face.state = 0;
					image_xscale = -1;
				}
				switchTimer++;
				if (switchTimer >= switchTimerMax) state = 0;
			} else {
				with Eggmobile {
					if (hittable) face.state = 3;
				}
				switchTimer = 0;
			}
			break;
		// Move to the pinch target
		case 5:
			with Eggmobile {
				var targetX = other.circleCenterTarget[0] + other.circleRadius * dcos(90);
				var targetY = other.circleCenterTarget[1] - other.circleRadius * dsin(90);
				if (point_distance(x, y, targetX, targetY) > 4){
					if (hittable) face.state = 6;
					move_towards_point(targetX, targetY, 4);
					// Face the target
					image_xscale = sign(targetX - x);
				} else {
					speed = 0;
					x = targetX;
					y = targetY;
					//other.alarm[0] = 30;
					other.state = 6;
				}
			}
			break;
		// Move in a circle at the pinch target
		case 6:
			with Eggmobile {
				other.circleAngle += other.circleSpeed;
				if (other.circleAngle > 359) other.circleAngle -= 360;
				x = floor( other.circleCenterTarget[0] + other.circleRadius * dcos(other.circleAngle))
				y = floor(other.circleCenterTarget[1] - other.circleRadius * dsin(other.circleAngle));
				image_xscale = y < other.circleCenterTarget[1] ? -1 : 1;
				if (hittable) face.state = 6;
				flame.state = 1;
				
			}
			break;
	}
	with Eggmobile {
		// Move to pinch state
		if (other.state < 5 and Health <= other.pinchHealthStart) {
			other.state = 5;
		}
	}
}

// TODO: Figure out the best way to get rid of eggman when he hits the edge of the screen
