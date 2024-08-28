/// @description Insert description here
// You can write your code in this editor


// if (!state and Player.x >= x - 22 and Player.x <= x + 28) {
if (!state and Player.Grounded and object_check_player(ColTrigger) and !Player.Hurt and !Player.Death) {
	state = 1;
	timer = 4;
	object_set_solidbox(28, 8, Heightmap2);
}

if (state) {
	if (timer == 0) {
		Player.Animation =  AnimSpring;
		Player.ClimbState = false;
		
		if (Player.x < x) LaunchForce = 6
		else LaunchForce = 10
		Player.Ysp = -LaunchForce * image_yscale;
		
		animation_reset(1);
		audio_sfx_play(sfxSpring, false);
		
		// Player should be airborne now
		Player.Grounded = false;
		Player.OnObject = false;
		state = 0;
		object_set_solidbox(28, 8, Heightmap);
	}
	
	//if (Player.x < x - 22 or Player.x > x + 28) {
	if (!object_check_player(ColTrigger) or Player.Hurt or Player.Death) {
		state = 0;
		timer = 0;
		object_set_solidbox(28, 8, Heightmap);
	} 
}

if (timer > 0) timer--;
object_act_solid(true, true, true, false);