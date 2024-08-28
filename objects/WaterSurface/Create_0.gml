/// @description Insert description here
// REMEMBER put a WaterSurface_Hitbox so bubbles don't float randomly in air

spdThreshold = 5;
waterSurfaceY = y - yRadius

//Solidbox is for water running
object_set_solidbox(xRadius, yRadius, false);

// Triggerbox is for determining if underwater
object_set_triggerbox(-xRadius, xRadius, -yRadius - 16, yRadius);

// Hitbox is for bubbles
//object_set_hitbox(xRadius, 1)