/// @description  scr_draw_sprite_tiled_horizontal(sprite, image, x, y);
/// @param sprite
/// @param  image
/// @param  x
/// @param  y
function scr_draw_sprite_tiled_horizontal(argument0, argument1, argument2, argument3) {
	 // Draw a sprite horizontally tiled. 

	    var SpriteStart, SpriteEnd, SpriteCurrent, SpriteStep;

	    // Retrieve sprite properties        
	       SpriteStep  = sprite_get_width(argument0);
	       SpriteStart = Camera.ViewX+((argument2-Camera.ViewX) mod SpriteStep)-SpriteStep;
	       SpriteEnd   = Camera.ViewX+__view_get( e__VW.WView, view_current )+SpriteStep;
        
	       for (SpriteCurrent = SpriteStart; SpriteCurrent <= SpriteEnd; SpriteCurrent += SpriteStep)
	            draw_sprite(argument0, argument1, SpriteCurrent, argument3);



}
