/// scr_approach(a, b, amount,)
function scr_approach(argument0, argument1, argument2) {
	// Moves "a" towards "b" by "amount" and returns the result
	// Nice because it will not overshoot "b", and works in both directions
	// Examples:
	//      speed = scr_approach(speed, max_speed, acceleration);
	//      hp = scr_approach(hp, 0, damage_amount);
	//      hp = scr_approach(hp, max_hp, heal_amount);
	//      x = scr_approach(x, target_x, move_speed);
	//      y = scr_approach(y, target_y, move_speed);
 
	if (argument0 < argument1)
	{
	    argument0 += argument2;
	    if (argument0 > argument1)
	        return argument1;
	}
	else
	{
	    argument0 -= argument2;
	    if (argument0 < argument1)
	        return argument1;
	}
	return argument0;


}
