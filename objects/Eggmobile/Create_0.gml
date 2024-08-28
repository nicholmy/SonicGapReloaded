/// @description Init
// You can write your code in this editor

body = instance_create(x-8, y+8, Eggmobile_Body)
face = instance_create(x-4, y-20, Eggmobile_Face)
flame = instance_create(x-38, y+4, Eggmobile_Flame)

state = 0;
hittable = true;
defeatable = true;
Health = 8;

Xsp = 0;
Ysp = 0;

// Original game is 32 I'm a meanie
hitInvincTime = 40;

object_set_hitbox(24, 24);