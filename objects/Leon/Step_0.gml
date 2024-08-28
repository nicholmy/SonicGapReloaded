/// @description Insert description here
// You can write your code in this editor

	// Act as badnik and exit if it was destroyed
	if object_act_enemy(EnemyBadnik)
	{
		return;
	}
	/*
	States
	0 = Hiding
	1 = Appearing
	2 = Shooting
	3 = Disappearing
	*/
	switch state
	{
		case 0:
		{
			visible = false;
			if (point_distance(x, y, Player.PosX, Player.PosY) < appearDistance and image_xscale * (x - Player.PosX) > 0) { 
				state = 1;
				alarm[0] = 10;
			}
			break;
		}
		case 1:
		{
			visible = true;
			animation_play(spr_npc_sth2_leon_appear, 8, 1);
			break;
		}
		case 2:
		{
			if (++shootTimer <= 30) {
				animation_play(spr_npc_sth2_leon_taunt, 4, 0);
			} else {
				animation_play(spr_npc_sth2_leon_shoot, 8, 0);
			}
			if (shootTimer >= 60) {
				state = 3;
				shootTimer = 0;
			}
			break;
		}
		case 3:
		{
			visible = true;
			animation_play(spr_npc_sth2_leon_shoot, 8, 0);
			
			if (shootTimer == 0 or shootTimer == shootInterval or shootTimer == shootInterval*2) {
				var _projectile = instance_create(x - image_xscale*14, y - 5, Projectile_Leon);
				_projectile.Xsp = image_xscale * -4;
				_projectile.Grv = 0;
				// TODO: Play projectile sound here
				audio_sfx_play(sfxProjectile, false);
			}
			if (shootTimer > 50) {
				if ((point_distance(x, y, Player.PosX, Player.PosY) >= appearDistance and image_xscale * (x - Player.PosX) > 0) or image_xscale * (x - Player.PosX) < 0) {
					state = 4;
					alarm[1] = 15;
					shootTimer = 0;
				} else {
					state = 2;
					shootTimer = 0;
				}
			}
			
			shootTimer++;
			break;
		}
		case 4:
		{
			visible = true;
			animation_play(spr_npc_sth2_leon_disappear, 8, 1);
			break;
		}
	}



