// Is the player touching the platform in any way
fob_player_contact = place_meeting(x, y - 1, obj_player) || place_meeting(x, y + 1, obj_player) || place_meeting(x + 1, y, obj_player) || place_meeting(x - 1, y, obj_player);

// TODO: Smooth out movement (look at the fraction handling in player movement)
//     - Frac movements help a lot, but they make the extremes of the movement path jumpy. Need to fix that
//     - Rounding seems to work pretty well
//     - Talk with the guys about it
// TODO: Player insteraction
if (fob_sin_move_x || fob_cos_move_y)
{
	// TODO: remove
	// Milliseconds to seconds
	//var _time = current_time / 1000;
	
	fob_sin_time_tracker++;
	// Fps to seconds
	var _time = fob_sin_time_tracker / 60.0;
	
	if (fob_cos_move_y)
	{
		var _amp_y = (fob_max_y - fob_min_y) / 2;
		var _y_start = _amp_y + fob_min_y;
		var _old_y = y;
		var _y_move = fob_circle_direction * _amp_y*cos(_time/fob_sin_frequency);
		//var _dist_y = (_y_start + _y_move) - _old_y;
		//if (fob_player_contact) obj_player.y += _dist_y
		//y += _dist_y;
		
		// TODO: mirror movement frac
		//fob_vertical_speed = (_y_start + _y_move) - _old_y;
		//fob_vertical_speed += fob_vertical_speed_frac;;
		//fob_vertical_speed_frac = frac(fob_vertical_speed);
		//fob_vertical_speed -= fob_vertical_speed_frac;
		
		// TODO: attempting simple rounding
		fob_vertical_speed = round((_y_start + _y_move) - _old_y);
		
		if (fob_player_contact) obj_player.y += fob_vertical_speed;
		y += fob_vertical_speed;
		
		//if (fob_player_contact) obj_player.y += (_y_start + _y_move) - _old_y;
		//y = round((_y_start + _y_move));

	}
	
	if (fob_sin_move_x)
	{
		var _amp_x = (fob_max_x - fob_min_x) / 2;
		var _x_start = _amp_x + fob_min_x;
		var _old_x = x;
		var _x_move =  _amp_x*sin(_time/fob_sin_frequency);
		//var _dist_x = (_x_start + _x_move) - _old_x;
		//if (fob_player_contact) obj_player.x += _dist_x;
		//x += _dist_x;
		
		// TODO: a little bit better, but still pretty bad at the ends
		//fob_horizontal_speed = (_x_start + _x_move) - _old_x;
		//fob_horizontal_speed += fob_horizontal_speed_frac;
		//fob_horizontal_speed_frac = frac(fob_horizontal_speed);
		//fob_horizontal_speed -= fob_horizontal_speed_frac;
		
		// TODO: rounded
		fob_horizontal_speed = round((_x_start + _x_move) - _old_x);
		
		if (fob_player_contact) obj_player.x += fob_horizontal_speed;
		x += fob_horizontal_speed;
		
		//if (fob_player_contact) obj_player.x += (_x_start + _x_move) - _old_x;
		//x = round(_x_start + _x_move);
	}
}
else
{
	// Horizontal movement
	if (x + fob_horizontal_speed > fob_max_x || x + fob_horizontal_speed < fob_min_x)
	{
		var _distance_to_change = sign(fob_horizontal_speed);
		while (x + _distance_to_change <= fob_max_x && x + _distance_to_change >= fob_min_x)
		{
			// Find the actual distance too the max/min x pixel
			_distance_to_change += sign(fob_horizontal_speed);
		}
	
		if (fob_change_direction)
		{
			// Change the platform to the base speed, but in the other direction of current movement
			fob_at_change = false;
			fob_change_direction = false;
			fob_horizontal_speed = -fob_horizontal_speed_base * sign(fob_horizontal_speed);
		}
		else
		{
			// Check if the moving platform is already where it should change direction and thus should not move any further
			if (abs(_distance_to_change) == 1)
			{
				fob_at_change = true;
			}
			else
			{
				// Offsetting by one from the determined distance prevents the platform from going one pixel past where it should
				_distance_to_change -= sign(fob_horizontal_speed);
			}
		
			fob_change_direction = true;
			fob_horizontal_speed = _distance_to_change;
		}
	}

	if (!fob_at_change)
	{
		if (fob_player_contact) obj_player.x += fob_horizontal_speed;
		x += fob_horizontal_speed;
	}

	// Vertical movement
	if (y + fob_vertical_speed > fob_max_y || y + fob_vertical_speed < fob_min_y)
	{
		var _distance_to_change = sign(fob_vertical_speed);
		while (y + _distance_to_change <= fob_max_y && y + _distance_to_change >= fob_min_y)
		{
			// Find the actual distance too the min/max y pixel
			_distance_to_change += sign(fob_vertical_speed);
		}
	
		if (fob_change_direction)
		{
			// Change the platform to the base speed, but in the other direction of current movement
			fob_at_change = false;
			fob_change_direction = false;
			fob_vertical_speed = -fob_vertical_speed_base * sign(fob_vertical_speed);
		}
		else
		{
			// Check if the moving platform is already where it should change direction and thus should not move any further
			if (abs(_distance_to_change) == 1)
			{
				fob_at_change = true;
			}
			else
			{
				// Offsetting by one from the determined distance prevents the platform from going one pixel past where it should
				_distance_to_change -= sign(fob_vertical_speed);
			}
		
			fob_change_direction = true;
			fob_vertical_speed = _distance_to_change;
		}
	}

	if (!fob_at_change)
	{
		if (fob_player_contact) obj_player.y += fob_vertical_speed;
		y += fob_vertical_speed;
	}
}


