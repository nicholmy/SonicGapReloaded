/// @description  Update X/Y Position:
   if(Direction != -1){
      x += lengthdir_x(Speed, Direction);
      y += lengthdir_y(Speed, Direction);
   }

// Destroy on animation end or underwater
	if image_index >= 9 or (Stage.WaterEnabled and y > Stage.WaterLevel)
	{
		instance_destroy();
	}
