function PlayerAmyHammerState()
{
	IsAmyHammerJumping = (Animation == AnimHammerJump) or (global.Character == CharAmy and Animation == AnimDropdash)
}