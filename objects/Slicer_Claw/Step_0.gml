/// @description Handle collision with player
// You can write your code in this editor

if object_check_player(ColHitbox)
{
	var BasicCheck = Player.BarrierType > BarrierNormal;
	var TailsCheck = Player.FlightState	and floor(Player.PosY) > y;
	var KnuxCheck  = Player.GlideState == GlideAir and sign(x - floor(Player.PosX)) == sign(Player.Facing);
	var MightyCheck = global.Character == CharMighty and (Player.Animation == AnimSpin or Player.Animation == AnimCrouch or Player.Animation == AnimHammerDrop)
		
	if BasicCheck or TailsCheck or KnuxCheck or MightyCheck
	{
		// Reflect projectile
		if !State
		{
			var X	  = floor(Player.PosX - x);
			var Y	  = floor(Player.PosY - y);
			var Angle = darctan2(Y, X);
			
			hspeed    = dcos(Angle) * -8;
			vspeed  = dsin(Angle) * -8;
			//Grv    = 0;
			State += 1;
			audio_sfx_play(sfxSpikeTap, false);
			moveState = 2;
		}
	}
	else if !Player.DoubleSpinAttack
	{
		player_damage(false, false, false);
	}
}