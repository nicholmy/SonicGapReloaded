/// @description  scr_draw_background_tiled_horizontal(back,x,y)
/// @param back
/// @param x
/// @param y
function scr_draw_background_tiled_horizontal(argument0, argument1, argument2) {
  
	 var Back, Width, XX, YY, Left, Right, I;
 
	 Back  = argument0;
	 Width = sprite_get_width(Back);
	 XX    = argument1;
	 YY    = argument2;
	 Left  = -1;
	 Right = Camera.ViewX/Width+global.Width/Width+1;
	 for(i=Left; i<Right; i++){
	     draw_sprite(Back, -1, XX mod Width+Width*i, YY);
	 }



}
