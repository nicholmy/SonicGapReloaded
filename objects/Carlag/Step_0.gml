/// @description Insert description here
// You can write your code in this editor

// Act as badnik and exit if it was destroyed
if object_act_enemy(EnemyBadnik)
{
	instance_destroy(spikeHitbox);
	return;
}

// Check for floor
var FindFloor = tile_find_v(PosX, PosY + 24, true, LayerA)[0];
if  FindFloor < 0
{
	//PosY += FindFloor;
	animation_play(spr_obj_carlag_moving, 4, 0);
} else {
	animation_play(spr_obj_carlag_still, 4, 0);
}

if (object_is_onscreen(id)) State = 1;

PosX += Xsp;
PosY += Ysp;

// Update position
x = floor(PosX);
y = floor(PosY);
spikeHitbox.x = x-28
spikeHitbox.y = y