/// @description Act solid or break
// You can write your code in this editor

// Check if player is on top?
var charCheck = isGlobalBreakable or (isAmyBreakable and global.Character == CharAmy) or (isKnuxBreakable and global.Character == CharKnuckles) or (isMightyBreakable and global.Character == CharMighty)
var globalActionCheck = Player.DoubleSpinAttack or Player.Spinning or global.Character == CharKnuckles or Player.Animation == AnimHammerRush or Player.Animation == AnimHammerSpring or Player.IsAmyHammerJumping or object_check_object(HammerDrop_Hitbox)
var hammerCheck = (!isHammerSpringBreakable and globalActionCheck) or (isHammerSpringBreakable and Player.Animation == AnimHammerSpring)
var hitboxCheck = object_check_player(ColHitbox2) or object_check_object(HammerDrop_Hitbox);
//var Check = Player.DoubleSpinAttack;

/*
// If so, destroy
if (Check and actionCheck and Player.OnObject != id and charCheck)  
{
	if object_check_player(ColHitbox2) or object_check_object(HammerDrop_Hitbox)
	{
		if !Player.Grounded and !Player.HammerState and !object_check_object(HammerDrop_Hitbox)
		{
			Player.Ysp = -Player.Ysp;
		}
					
		// Break into pieces here
		audio_sfx_play(sfxObjectDestroy, false);
				
		// Update object
		object_set_unload(false);
		object_set_hitbox(0, 0);
		
		instance_destroy();
	}
				
	// Clear solidbox
	object_set_solidbox(0, 0, false);
	
}
*/
// (object_check_player(ColHitbox2) or object_check_object(HammerDrop_Hitbox)) and (Check and hammerCheck and Player.OnObject != id and charCheck)

if hitboxCheck and (globalActionCheck and charCheck and hammerCheck)
{

	if !Player.Grounded and !Player.HammerState and !object_check_object(HammerDrop_Hitbox) and Player.Ysp >= 0
	{
		Player.Ysp = -Player.Ysp;
	}
					
	// Break into pieces here
	audio_sfx_play(sfxObjectDestroy, false);
				
	// Update object
	object_set_unload(false);
	object_set_hitbox(0, 0);
		
	// Clear solidbox
	object_set_solidbox(0, 0, false);
	
	instance_destroy();			
}
			
// Else act as solid
else
{	
	if floor(Player.PosY) >= floor(y + 32)
	{
		if object_check_player(ColHitbox)
		{
			Ysp        = -1.5;
			Player.Ysp = -Player.Ysp;
		}
	}
				
	// Set solidbox
	object_set_solidbox(sprite_width/2, sprite_height/2, false);
}
object_act_solid(true, true, true, false);