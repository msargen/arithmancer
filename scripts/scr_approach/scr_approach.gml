/// scr_approach(_object_one, _object_two, amount)
function scr_approach(_object_one, _object_two, _amount) {
	// Moves "_object_one" towards "_object_two" by "amount" and returns the result
	// Nice because it will not overshoot "b", and works in both directions
	// Examples:
	//      speed = scr_approach(speed, max_speed, acceleration);
	//      hp = scr_approach(hp, 0, damage_amount);
	//      hp = scr_approach(hp, max_hp, heal_amount);
	//      x = scr_approach(x, target_x, move_speed);
	//      y = scr_approach(y, target_y, move_speed);
 
	if (_object_one < _object_two)
	{
	    _object_one += _amount;
	    if (_object_one > _object_two)
	        return _object_two;
	}
	else
	{
	    _object_one -= _amount;
	    if (_object_one < _object_two)
	        return _object_two;
	}
	return _object_one;


}
