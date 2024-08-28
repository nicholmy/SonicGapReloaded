/// @description Main
// You can write your code in this editor
	
	if object_check_player(ColHitbox)
	{
		if !State and !Player.Hurt
		{
			// Set player speeds based on collision angle
			var Angle = point_direction(x, y, floor(Player.PosX), floor(Player.PosY));
			
			if Player.Grounded {
				Player.Gsp = 7 * dcos(Angle);
			}
			else with Player {
				Xsp = 7 * dcos(Angle);
				Ysp     = 7 * -dsin(Angle);
				
				if (Input.ABC and y < other.y) {
					Ysp = 9 * -dsin(Angle);
					player_reset_air(true);
				} else {
					player_reset_air(false);
				}
				
				if GlideState {
					player_reset_air(true);
				}
				//Jumping = false;
				//AirLock = false;
				
			}
			
			// Add points to the score
			if ScoreLimit {
				var  ThisObject = id;
				var  Object     = instance_create(x, y, ScoreObject);
				with Object
				{
					object_set_depth(ThisObject, 1);
				}
			}
			ScoreLimit--;
			
			audio_sfx_play(sfxMushroomBounce, false);
			animation_reset(1);
			
			// Increment state
			State++;
			AnimState = 1;
			alarm[0] = 20;
		}
	}
	else if State
	{
		// Decrement state
		State--;
	}
	
	if AnimState animation_play(spr_tube_blink, 4, 0);
	else animation_play(spr_tube, 4, 0)