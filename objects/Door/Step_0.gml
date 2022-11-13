/// @description Move the Door
object_act_solid(true, true, true, false);
if (isMoving) {
	if (isOpen) {
		y -= abs(moveSpeed);
	} else {
		y += abs(moveSpeed);
	}
	moveDistance += abs(moveSpeed);
		
	if (moveDistance >= totalMove) {
		isMoving = false;
	}
}

