/// @description Reset the state of the slicer
// Don't reset if the slicer is in panic
if (state != 3) {
	instance_destroy(leftClaw)
	instance_destroy(rightClaw)

	image_speed = 1
	state = 0

	leftClaw = instance_create(x-8, y+8, Slicer_Claw)
	leftClaw.depth = depth + 1
	leftClaw.image_speed = 0
	rightClaw = instance_create(x+8, y+8, Slicer_Claw)
	rightClaw.depth = depth - 1
	rightClaw.image_speed = 0
}