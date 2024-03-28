/// @description Insert description here
// You can write your code in this editor

// 0 - Spikes fully retracted
// 1 - Expanding spikes
// 2 - Spikes fully out
// 3 - Spikes retracting
state = 0;

spikeHitbox = instance_create(x, y - 32 * image_yscale, Spiker_SpikeHitbox);
spikeHitbox.active = false;

// Set object properties
object_set_unload(FlagReset);
object_set_depth(Player, 0);
object_set_hitbox(16, 16);