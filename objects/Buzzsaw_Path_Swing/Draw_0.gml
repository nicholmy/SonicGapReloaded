/// @description Insert description here
// You can write your code in this editor
var distance = 0
//radius;
//spr_obj_swing_tsz_chain, spr_obj_swing_tsz_pendulum

draw_sprite(spr_obj_swing_tsz_pendulum, 0, x, y);

var ChainCount = 6;
	
// Draw chain
    for (var i = 1; i < ChainCount + 1; i++)
    {
        var X = round(x + DistanceX * i);
        var Y = round(y + DistanceY * i);
		
        draw_sprite(spr_obj_swing_tsz_chain, 0, X, Y);
    }