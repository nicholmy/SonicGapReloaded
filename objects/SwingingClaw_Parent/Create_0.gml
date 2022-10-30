/// @description Initialize the base, chain, and claw
object_set_depth(Player, false);

// When inheriting this event, just change the objects used
// The array is what makes this have to be overwritten
beginObj = instance_create(x, y, SwingingClaw_Base);
object_set_depth(beginObj, false);

chainArr = array_create(chainNum);

// It's best if the chain object has its x/y in the dead middle
for (var i = 0; i < chainNum; i++) {
	chainArr[i] = instance_create(x, y, SwingingClaw_Chain);
	chainArr[i].depth = depth - (i+1);
}

endX = x + endXOffset
endY = y + endYOffset
endObj = instance_create(endX, endY, SwingingClaw_Claw);

// Claw specific params
endObj.baseX = x
endObj.baseY = y
endObj.chainLength = endYOffset
endObj.depth = depth - (chainNum+1);

show_debug_message("Depths:");
show_debug_message(depth);
show_debug_message(endObj.depth);
show_debug_message(Player.depth);