/// @description Create and position the claws
// You can write your code in this editor

leftClaw = instance_create(x-8, y+8, Slicer_Claw)
leftClaw.depth = depth + 1
leftClaw.image_speed = 0
rightClaw = instance_create(x+8, y+8, Slicer_Claw)
rightClaw.depth = depth - 1
rightClaw.image_speed = 0

XSpeed = 0;

object_set_hitbox(16, 16);