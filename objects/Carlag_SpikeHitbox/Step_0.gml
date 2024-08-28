/// @description Insert description here
// You can write your code in this editor

if Player.DoubleSpinAttack or Player.Animation == AnimHammerRush
{
	return;
}

if (object_check_player(ColHitbox)) {
	player_damage_spiky();
}