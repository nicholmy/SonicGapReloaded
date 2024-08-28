/// @description Move
// MoveState 0 = Not moving
// MoveState 1 = Moving
// MoveState 2 = Reflected

if (moveState == 1) {
	x = centerX + flyDirection * 48 * dcos(rotAngle)
	y = centerY - 48 * dsin(rotAngle)
	rotAngle = (rotAngle + rotSpeed) % 360
	image_speed = 1
} else if (moveState == 0) {
	image_speed = 0
}