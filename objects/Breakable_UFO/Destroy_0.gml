/// @description Break into pieces when destroyed
// You can write your code in this editor

var p1 = instance_create(x-32, y-32, Breakable_UFO_Piece);
p1.XSpeed = -3
var p2 = instance_create(x+32, y-32, Breakable_UFO_Piece);
p2.XSpeed = 3

var p3 = instance_create(x-32, y+32, Breakable_UFO_Piece);
p3.XSpeed = -3
var p4 = instance_create(x+32, y+32, Breakable_UFO_Piece);
p4.XSpeed = 3






