function PlayerAnimate()
{	
	static AnimSpringTime  = 0;
	static AnimBreatheTime = 0;
	static AnimStandTime   = 0;
	static AnimSkidTime    = 0;
	static AnimHammerTime  = 0;
	
	// Update statics
	if Animation != AnimBreathe
	{
		AnimBreatheTime = 24;
	}
	if Animation != AnimSpring and Animation != AnimHammerSpring
	{
		AnimSpringTime = 60;
	}
	if Animation != AnimDropStand and Animation != AnimGlideStand
	{
		AnimStandTime = 16;
	}
	if Grounded and Gsp > 0 and Input.Left or Gsp < 0 and Input.Right
	{
		AnimSkidTime = global.Character == CharSonic ? 24 : 16;
	}
	if (Animation != AnimHammerRush) {
		AnimHammerTime = 48;
	}
	
	// Animate character
	switch global.Character
	{	
		#region Sonic
		case CharSonic:
		{	
		if !SuperState then switch Animation
		{
			case AnimIdle:
			{
				animation_play(spr_sonic_idle, [288, 24, 48, 24, 24], 3);
			}
			break;
			case AnimMove:	
			{
				if abs(Gsp) < 6
				{
					animation_play(spr_sonic_walk, floor(max(1, 9 - abs(Gsp))), 0);
				}
				else
				{
					if global.PeeloutEnabled
					{
						var Sprite = abs(Gsp) < 10 ? spr_sonic_run : spr_sonic_peelout;
					}
					else
					{
						var Sprite = spr_sonic_run;
					}
					animation_play(Sprite, floor(max(1, 9 - abs(Gsp))), 0);
				}
			}
			break;
			case AnimPeelout:
			{
				if abs(PeeloutRev) < 6
				{
					var Sprite = spr_sonic_walk;
				}
				else if abs(PeeloutRev) < 10
				{
					var Sprite = spr_sonic_run;
				}
				else
				{
					var Sprite = spr_sonic_peelout;
				}	
				animation_play(Sprite, floor(max(1, 8 - abs(PeeloutRev))), 0);
			}
			break;
			case AnimSpin:
			{
				if abs(Gsp) < 6
				{
					var Sprite = spr_sonic_spin;
				}
				else
				{
					var Sprite = spr_sonic_spin_fast;
				}
				animation_play(Sprite, floor(max(1, 5 - abs(Gsp))), 0);
			}
			break;
			case AnimSpindash:
				animation_play(spr_sonic_spindash, 1, 0);
			break;
			case AnimCrouch:
				animation_play(spr_sonic_crouch, 4, 1);
			break;
			case AnimLookup:
				animation_play(spr_sonic_lookup, 4, 1);
			break;
			case AnimSkid:
			{
				if !(--AnimSkidTime)
				{
					Animation = AnimMove;
				}
				else
				{
					animation_play(spr_sonic_skid, 6, 2);
				}
			}
			break;
			case AnimPush:
				animation_play(spr_sonic_push, floor(max(1, 8 - abs(Gsp)) * 4), 0);
			break;
			case AnimHurt:
				animation_set(spr_sonic_hurt, 0);
			break;
			case AnimDeath:
				animation_set(spr_sonic_death, 0);
			break;	
			case AnimDrown:
				animation_set(spr_sonic_drown, 0);
			break;
			case AnimBalance:
				animation_play(spr_sonic_balance, 16, 0);
			break;
			case AnimBalanceFlip:
				animation_play(spr_sonic_balance_flip, 16, 0);
			break;
			case AnimBalancePanic:
				animation_play(spr_sonic_balance_panic, 4, 0);
			break;
			case AnimBalanceTurn:
				animation_set(spr_sonic_balance_turn, 0);
			break;
			case AnimSpring:
			{
				/*if !(--AnimSpringTime)
				{
					Animation = AnimMove;
				}*/
				if (Ysp > 0)
				{
					Animation = AnimMove;
				}
				else
				{
					animation_set(spr_sonic_spring, 0);
				}
			}
			break;
			case AnimBreathe:
			{
				if !(--AnimBreatheTime)
				{
					Animation = AnimMove;
				}
				else
				{
					animation_set(spr_sonic_breathe, 0);
				}
			}
			break;
			case AnimDropdash:
				animation_play(spr_sonic_dropdash, 1, 0);
			break;
			case AnimHang:
				animation_play(spr_sonic_hang, 32, 0);
			break;
			case AnimSwing:
				// Manually set the image_index with the object
				sprite_index = spr_sonic_swing;
			break;
		}
		#endregion
		
		#region Super Sonic
		else switch Animation
		{
			case AnimTransform:
				animation_play(spr_supersonic_transform, [6, 6, 3, 3, 3], 3);
			break;
			case AnimIdle:
				animation_play(spr_supersonic_idle, 8, 0);
			break;
			case AnimMove:	
			{
				if abs(Gsp) < (IsUnderwater ? 6 : 8)
				{
					var Sprite = spr_supersonic_walk;
				}
				else
				{
					var Sprite = spr_supersonic_fly;
				}
				animation_play(Sprite, floor(max(1, 9 - abs(Gsp))), 0);
			}
			break;
			case AnimPeelout:
			{
				if abs(PeeloutRev) < 8
				{
					var Sprite = spr_supersonic_walk;
				}
				else
				{
					var Sprite = spr_supersonic_fly
				}
				animation_play(Sprite, floor(max(1, 8 - abs(PeeloutRev))), 0);
			}
			break;
			case AnimSpin:
			{
				if abs(Gsp) < 6
				{
					var Sprite = spr_sonic_spin;
				}
				else
				{
					var Sprite = spr_sonic_spin_fast;
				}
				animation_play(Sprite, floor(max(1, 5 - abs(Gsp))), 0);
			}
			break;
			case AnimSpindash:
				animation_play(spr_sonic_spindash, 1, 0); 
			break;
			case AnimCrouch:
				animation_play(spr_supersonic_crouch, [4, 8, 8, 8, 8], 1);
			break;
			case AnimLookup:
				animation_play(spr_supersonic_lookup, [4, 8, 8, 8, 8], 1);
			break;
			case AnimSkid:
			{
				if !(--AnimSkidTime)
				{
					Animation = AnimMove;
				}
				else
				{
					animation_play(spr_supersonic_skid, 3, 4);
				}
			}
			break;
			case AnimPush:
				animation_play(spr_supersonic_push, floor(max(1, 8 - abs(Gsp)) * 4), 0);
			break;
			case AnimHurt:
				animation_set(spr_supersonic_hurt, 0);
			break;
			case AnimDeath:
				animation_set(spr_supersonic_death, 0);
			break;	
			case AnimDrown:
				animation_set(spr_supersonic_drown, 0);
			break;
			case AnimBalance:
				animation_play(spr_supersonic_balance, 10, 0);
			break;
			case AnimBalanceFlip:
				animation_play(spr_supersonic_balance_flip, 10, 0);
			break;
			case AnimSpring:
			{
				if !(--AnimSpringTime)
				{
					Animation = AnimMove;
				}
				else
				{
					animation_play(spr_supersonic_spring, 4, 0);
				}
			}
			break;
			case AnimBreathe:
			{	
				if !(--AnimBreatheTime)
				{
					Animation = AnimMove;
				}
				else
				{
					animation_set(spr_supersonic_breathe, 0);
				}
			}
			break;
			case AnimDropdash:
				animation_play(spr_sonic_dropdash, 1, 0);
			break;
		}
		}
		break;
		#endregion
		
		#region Tails
		case CharTails:
		{
			switch Animation
			{
				case AnimIdle: 
				{
					var FrameData = 
					[
						128, 8, 8, 64, 8, 8, 72, 128, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8
					];
					animation_play(spr_tails_idle, FrameData, 7);
				} 
				break;
				case AnimMove:	
				{
					if abs(Gsp) < 6
					{
						var Sprite = spr_tails_walk;
					}
					else if abs(Gsp) < 8
					{
						var Sprite = spr_tails_run;
					}
					else
					{
						var Sprite = spr_tails_dash;
					}
					animation_play(Sprite, floor(max(1, 9 - abs(Gsp))), 0);
				}
				break;
				case AnimSpin:
					animation_play(spr_tails_roll, 2, 0);
				break;
				case AnimSpindash:
					animation_play(spr_tails_spindash, 1, 0); 
				break;
				case AnimCrouch:
					animation_set(spr_tails_crouch, 0);
				break;
				case AnimLookup:
					animation_set(spr_tails_lookup, 0);
				break;
				case AnimSkid:
				{
					if !(--AnimSkidTime)
					{
						Animation = AnimMove;
					}
					else
					{
						animation_play(spr_tails_skid, 8, 0);
					}
				}
				break;
				case AnimFly:
					animation_play(spr_tails_fly, 2, 0);
				break;
				case AnimFlyTired:
					animation_play(spr_tails_fly_tired, 4, 0);
				break;
				case AnimSwim:
					animation_play(spr_tails_swim, Ysp < 0 ? 4 : 8, 0);
				break;
				case AnimSwimTired:
					animation_play(spr_tails_swim_tired, 8, 0)
				break;
				case AnimHurt:
					animation_set(spr_tails_hurt, 0);
				break;
				case AnimDeath:
				case AnimDrown:
					animation_set(spr_tails_death, 0);
				break;
				case AnimSpring:
				{
					if !(--AnimSpringTime)
					{
						Animation = AnimMove;
					}
					else
					{
						animation_play(spr_tails_spring, 4, 0);
					}
				}
				break;
				case AnimPush:
					animation_play(spr_tails_push, floor(max(1, 8 - abs(Gsp)) * 4), 0);
				break;
				case AnimBalance:
					animation_play(spr_tails_balance, 20, 0);
				break;
				case AnimBalanceFlip:
					animation_play(spr_tails_balance_flip, 20, 0);
				break;
				case AnimTransform:
					animation_play(spr_tails_transform, [6, 3, 3], 1);
				break;
				case AnimBreathe:
				{
					if !(--AnimBreatheTime)
					{
						Animation = AnimMove;
					}
					else
					{
						animation_set(spr_tails_breathe, 0);
					}
				}
				break;
				case AnimHang:
					animation_play(spr_tails_hang, 8, 0);
				break;
				case AnimSwing:
					// Manually set the image_index with the object
					sprite_index = spr_tails_swing;
				break;
			}	
		}
		break;
		#endregion
		
		#region Knuckles
		case CharKnuckles:
		{
			switch Animation
			{
				case AnimIdle:
				{
					var FrameData = 
					[
						300, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 
						30, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,  6, 6, 6, 6, 6, 
						6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 12, 6, 6
					];
					animation_play(spr_knuckles_idle, FrameData, 0);	
				}
				break;
				case AnimMove:	
				{
					if abs(Gsp) < 6
					{
						var Sprite = spr_knuckles_walk;
					}
					else
					{
						var Sprite = spr_knuckles_run;
					}
					animation_play(Sprite, floor(max(1, 9 - abs(Gsp))), 0);
				}
				break;
				case AnimSpin:
					animation_play(spr_knuckles_roll, floor(max(1, 5 - abs(Gsp))), 0);
				break;
				case AnimSpindash:
					animation_play(spr_knuckles_spindash, 1, 0); 
				break;
				case AnimCrouch:
					animation_play(spr_knuckles_crouch, 6, 1);
				break;
				case AnimLookup:
					animation_play(spr_knuckles_lookup, 6, 1);
				break;
				case AnimSkid:
				{
					if !(--AnimSkidTime)
					{
						Animation = AnimMove;
					}
					else
					{
						animation_play(spr_knuckles_skid, 4, 3);
					}
				}
				break;
				case AnimHurt:
					animation_set(spr_knuckles_hurt, 0);
				break;
				case AnimDeath:
					animation_set(spr_knuckles_death, 0);
				break;
				case AnimDrown:
					animation_set(spr_knuckles_drown, 0);
				break;
				case AnimGlide:
					animation_set(spr_knuckles_glide, GlideFrame);
				break;
				case AnimGlideFall:
					animation_play(spr_knuckles_drop, 6, 1);
				break;			
				case AnimSlide:
					animation_set(spr_knuckles_glideground, 0);
				break;
				case AnimDropStand:
				{
					if !(--AnimStandTime)
					{
						Animation = AnimIdle;
					}
					else if Input.Down
					{
						Animation = AnimCrouch;
					}
					else
					{
						animation_set(spr_knuckles_crouch, 1);
					}
				}
				break;
				case AnimGlideStand:
				{
					if !(--AnimStandTime)
					{
						Animation = AnimIdle;
					}
					else
					{
						animation_set(spr_knuckles_glidestand, 0);
					}
				}
				break;
				case AnimClimb:
				{
					if Input.Down
					{
						var Speed = -4;
					}
					else if Input.Up
					{
						var Speed = 4;
					}
					else
					{
						var Speed = 0;
					}
					animation_play(spr_knuckles_climb, Speed, 0);
				}
				break;
				case AnimClamber:
					animation_play(spr_knuckles_clamber, 6, 3);
				break;
				case AnimDrop:
					animation_set(spr_knuckles_drop, 1);
				break;
				case AnimPush:
					animation_play(spr_knuckles_push, floor(max(1, 8 - abs(Gsp))), 0);
				break;
				case AnimSpring:
				{
					if !(--AnimSpringTime)
					{
						Animation = AnimMove;
					}
					else
					{
						animation_set(spr_knuckles_spring, 0);
					}
				}
				break;
				case AnimBalance:
					animation_play(spr_knuckles_balance, [8, 8, 8, 8, 8, 8, 60, 12, 12, 8, 8, 8], 9);
				break;
				case AnimBalanceFlip:
					animation_play(spr_knuckles_balance_flip, [8, 8, 8, 8, 60, 12, 12, 8, 8, 8], 7);
				break;
				case AnimTransform:
					animation_play(spr_knuckles_transform, [6, 3, 3], 1);
				break;
				case AnimBreathe:
				{
					if !(--AnimBreatheTime)
					{
						Animation = AnimMove;
					}
					else
					{
						animation_set(spr_knuckles_breathe, 0);
					}
				}
				break;
			}
		}
		break;
		#endregion
		
		#region Mighty
		case CharMighty:
		{
			switch Animation
			{
				case AnimIdle:
				{
					animation_play(spr_mighty_idle, [288, 12, 96, 12, 24], 4);
				}
				break;
				case AnimMove:	
				{
					if abs(Gsp) < 6
					{
						animation_play(spr_mighty_walk, floor(max(1, 9 - abs(Gsp))), 0);
					}
					else
					{
						if global.PeeloutEnabled
						{
							var Sprite = abs(Gsp) < 10 ? spr_mighty_run : spr_mighty_peelout;
						}
						else
						{
							var Sprite = spr_mighty_run;
						}
						animation_play(Sprite, floor(max(1, 9 - abs(Gsp))), 0);
					}
				}
				break;
				case AnimSpin:
				{
					animation_play(spr_mighty_roll, floor(max(1, 5 - abs(Gsp))), 0);
				}
				break;
				case AnimSpindash:
					animation_play(spr_mighty_spindash, 1, 0);
				break;
				case AnimCrouch:
					animation_play(spr_mighty_crouch, 4, 3);
				break;
				case AnimLookup:
					animation_play(spr_mighty_lookup, 4, 4);
				break;
				case AnimSkid:
				{
					if !(--AnimSkidTime)
					{
						Animation = AnimMove;
					}
					else
					{
						animation_play(spr_mighty_skid_simple, 4, 0);
					}
				}
				break;
				case AnimPush:
					animation_play(spr_mighty_push, floor(max(1, 8 - abs(Gsp)) * 4), 0);
				break;
				case AnimHurt:
					animation_set(spr_mighty_hurt, 4);
				break;
				case AnimDeath:
					animation_set(spr_mighty_die, 0);
				break;	
				case AnimDrown:
					animation_set(spr_mighty_die, 1);
				break;
				case AnimBalance:
					animation_play(spr_mighty_edge_balance, 16, 0);
				break;
				case AnimBalanceFlip:
					animation_play(spr_mighty_edge_balance2, 16, 0);
				break;
				case AnimBalancePanic:
					animation_play(spr_sonic_balance_panic, 4, 0);
				break;
				case AnimBalanceTurn:
					animation_set(spr_sonic_balance_turn, 0);
				break;
				case AnimSpring:
				{
					/*if !(--AnimSpringTime)
					{
						Animation = AnimMove;
					}*/
					if (Ysp > 0)
					{
						Animation = AnimMove;
					}
					else
					{
						animation_play(spr_mighty_spring, 4, 0);
					}
				}
				break;
				case AnimBreathe:
				{
					if !(--AnimBreatheTime)
					{
						Animation = AnimMove;
					}
					else
					{
						animation_play(spr_mighty_breath, 4, 0);
					}
				}
				break;
				case AnimHammerDrop:
					animation_play(spr_mighty_hammer_drop, [1,1,1,1,1,1,1,1], 4);
				break;
				case AnimUncurl:
					animation_play(spr_mighty_uncurl, 4, 4);
				break;
			}
		}
		break;
		#endregion
		
		#region Ray
		case CharRay:
		{
			switch Animation
			{
				case AnimIdle:
				{
					animation_play(spr_ray_idle, [8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 16, 
											8, 8, 64, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8], 16);
				}
				break;
				case AnimMove:	
				{
					if abs(Gsp) < 6
					{
						animation_play(spr_ray_walk, floor(max(1, 9 - abs(Gsp))), 0);
					}
					else
					{
						if global.PeeloutEnabled
						{
							var Sprite = abs(Gsp) < 10 ? spr_ray_run : spr_ray_peelout;
						}
						else
						{
							var Sprite = spr_ray_run;
						}
						animation_play(Sprite, floor(max(1, 9 - abs(Gsp))), 0);
					}
				}
				break;
				case AnimSpin:
				{
					animation_play(spr_ray_roll, floor(max(1, 5 - abs(Gsp))), 0);
				}
				break;
				case AnimSpindash:
					animation_play(spr_ray_spindash, 1, 0);
				break;
				case AnimCrouch:
					animation_play(spr_ray_crouch, 4, 3);
				break;
				case AnimLookup:
					animation_play(spr_ray_lookup, 4, 5);
				break;
				case AnimSkid:
				{
					if !(--AnimSkidTime)
					{
						Animation = AnimMove;
					}
					else
					{
						animation_play(spr_ray_skid, 2, 7);
					}
				}
				break;
				case AnimPush:
					animation_play(spr_ray_push, floor(max(1, 8 - abs(Gsp)) * 4), 0);
				break;
				case AnimHurt:
					animation_set(spr_ray_hurt, 4);
				break;
				case AnimDeath:
					animation_set(spr_ray_die, 0);
				break;	
				case AnimDrown:
					animation_set(spr_ray_die, 1);
				break;
				case AnimBalance:
					animation_play(spr_ray_edge_balance, 16, 0);
				break;
				case AnimBalanceFlip:
					animation_play(spr_ray_edge_balance, 16, 0);
				break;
				case AnimBalancePanic:
					animation_play(spr_sonic_balance_panic, 4, 0);
				break;
				case AnimBalanceTurn:
					animation_set(spr_sonic_balance_turn, 0);
				break;
				case AnimSpring:
				{
					/*if !(--AnimSpringTime)
					{
						Animation = AnimMove;
					}*/
					if (Ysp > 0)
					{
						Animation = AnimMove;
					}
					else
					{
						animation_play(spr_ray_spring, 4, 0);
					}
				}
				break;
				case AnimBreathe:
				{
					if !(--AnimBreatheTime)
					{
						Animation = AnimMove;
					}
					else
					{
						animation_play(spr_ray_breath, 4, 0);
					}
				}
				break;
				case AnimRayGlideUp:
				{
					animation_play(spr_ray_squirrel_glideup, 4, 0);
				}
				break;
				case AnimRayGlideTurn:
				{
					animation_set(spr_ray_squirrel_glide, floor(4 - 4 * dsin(2 * RayGlideAngle)));
				}
				break;
				case AnimRayGlideDown:
				{
					animation_play(spr_ray_squirrel_glidedown, 4, 0);
				}
				break;
			}
		}
		#endregion
		
		#region Amy
		case CharAmy:
		{	
			switch Animation
			{
				case AnimIdle:
				{
					animation_play(spr_amy_idle, [288, 8, 8, 8, 8], 1);
				}
				break;
				case AnimMove:	
				{
					if abs(Gsp) < 6
					{
						animation_play(spr_amy_walk, floor(max(1, 9 - abs(Gsp))), 0);
					}
					else
					{
						if global.PeeloutEnabled
						{
							var Sprite = abs(Gsp) < 10 ? spr_amy_run : spr_amy_dash;
						}
						else
						{
							var Sprite = spr_amy_run;
						}
						animation_play(Sprite, floor(max(1, 9 - abs(Gsp))), 0);
					}
				}
				break;
				case AnimPeelout:
				{
					if abs(PeeloutRev) < 6
					{
						var Sprite = spr_sonic_walk;
					}
					else if abs(PeeloutRev) < 10
					{
						var Sprite = spr_sonic_run;
					}
					else
					{
						var Sprite = spr_sonic_peelout;
					}	
					animation_play(Sprite, floor(max(1, 8 - abs(PeeloutRev))), 0);
				}
				break;
				case AnimSpin:
				{
					if abs(Gsp) < 6
					{
						var Sprite = spr_amy_spin;
					}
					else
					{
						var Sprite = spr_amy_spin;
					}
					animation_play(Sprite, floor(max(1, 5 - abs(Gsp))), 0);
				}
				break;
				case AnimSpindash:
					animation_play(spr_amy_spindash, 1, 0);
				break;
				case AnimCrouch:
					animation_play(spr_amy_crouch, 4, 1);
				break;
				case AnimLookup:
					animation_play(spr_amy_lookup, 4, 1);
				break;
				case AnimSkid:
				{
					if !(--AnimSkidTime)
					{
						Animation = AnimMove;
					}
					else
					{
						animation_play(spr_amy_skid, 4, 3);
					}
				}
				break;
				case AnimPush:
					animation_play(spr_amy_push, floor(max(1, 8 - abs(Gsp)) * 4), 0);
				break;
				case AnimHurt:
					animation_set(spr_amy_hurt, 0);
				break;
				case AnimDeath:
					animation_set(spr_amy_death, 0);
				break;	
				case AnimDrown:
					animation_set(spr_amy_death, 0);
				break;
				case AnimBalance:
					animation_play(spr_amy_balance, 16, 0);
				break;
				case AnimBalanceFlip:
					animation_play(spr_amy_balance_flip, 16, 0);
				break;
				case AnimBalancePanic:
					animation_play(spr_amy_balance, 8, 0);
				break;
				case AnimSpring:
				{
					if !(--AnimSpringTime)
					{
						Animation = AnimMove;
					}
					/*if (Ysp > 0)
					{
						Animation = AnimMove;
					}*/
					else
					{
						animation_set(spr_amy_spring, 0);
					}
				}
				break;
				case AnimBreathe:
				{
					if !(--AnimBreatheTime)
					{
						Animation = AnimMove;
					}
					else
					{
						animation_set(spr_sonic_breathe, 0);
					}
				}
				break;
				case AnimDropdash:
					animation_play(spr_amy_hammerdropdash, 2, 0);
				break;
				case AnimHammerJump:
					animation_play(spr_amy_hammerjump, floor(max(1, 5 - abs(Gsp))), 0);
				break;
				case AnimHammerRush:
					if !(--AnimHammerTime)
					{
						Animation = AnimMove;
						AnimHammerTime = 48;
					}
					else
					{
						animation_play(spr_amy_hammerrush, 2, 0);
					}
				break;
				case AnimHammerSpring:
					if !(--AnimSpringTime)
					{
						Animation = AnimMove;
					}
					else
					{
						animation_play(spr_amy_hammerjump, floor(max(1, 5 - abs(8))), 0);
					}
				break;
				case AnimHang:
					animation_play(spr_amy_hang, 32, 0);
				break;
				case AnimSwing:
					// Manually set the image_index with the object
					sprite_index = spr_sonic_swing;
				break;
			}
		}
		#endregion
	}
}