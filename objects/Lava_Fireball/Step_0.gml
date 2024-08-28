/// @description Move the fireball, damage player
// You can write your code in this editor
// Play the flying animation
animation_play(sprite_index, 2, 1);

// Move object
PosX += Xsp;
PosY += Ysp;
Ysp  += Grv;
	
x = floor(PosX);
y = floor(PosY);

if (object_check_player(ColHitbox)) {
	player_damage(true, false, false);
}