/// @description Close the door
with Door {
	if (doorID == other.doorID) alarm[1] = 1;
}
