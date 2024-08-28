/// @description State Management
// You can write your code in this editor

// Act as badnik and exit if it was destroyed
if object_act_enemy(EnemyBadnik)
{
	return;
}

// 0 - Spikes fully retracted
// 1 - Expanding spikes
// 2 - Spikes fully out
// 3 - Spikes retracting
switch state
{
	case 0:
		spikeHitbox.active = false;
		animation_play(spr_obj_spiker_idle, 8, 0);
		if (!Player.Grounded) state = 1;
	break;
	case 1:
		spikeHitbox.active = true;
		animation_play(spr_obj_spiker_extend, 4, 4);
		if (Player.Grounded) state = 3;
	break;
	case 2:
		spikeHitbox.active = true;
		animation_play(spr_obj_spiker_extend, 4, 4);
		if (Player.Grounded) state = 3;
	break;
	case 3:
		spikeHitbox.active = false;
		animation_play(spr_obj_spiker_retract, 8, 6);
		if (!Player.Grounded) state = 1;
		if image_index == 7 state = 0;
	break;
}