/// @description Move states
// You can write your code in this editor

if object_check_player(ColHitbox)
{
	player_damage(false, true, false);
}

if (timer <= 0) {
	// MAKE SURE ONE OF THE TIMERS IS AT LEAST 1 DURATION
	while(timer <= 0) {
		// Switch to the next state
		state = (state + 1) % 3;
	
		switch state
		{
			case 0:
				timer = idleTime;
				object_set_hitbox(0, 0);
				break;
			case 1:
				timer = warningTime;
				object_set_hitbox(0, 0);
				break;
			case 2:
				timer = activeTime;
				
				if (image_angle == 90 or image_angle == 270) object_set_hitbox(36, 8);
				else object_set_hitbox(8, 36);
				
				break;
			default:
				timer = idleTime;
		}
	}
}

if (isActive) timer--;

switch state
{
	case 0:
		animation_play(spr_electrictrap_idle, 4, false);
		break;
	case 1:
		animation_play(spr_electrictrap_moving, 4, false);
		break;
	case 2:
		animation_play(spr_electrictrap_active, 2, false);
		break;
	default:
		animation_play(spr_electrictrap_idle, 4, false); 
}






