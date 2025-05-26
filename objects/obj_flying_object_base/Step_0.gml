// Is the player touching the platform in any way
fob_player_contact = place_meeting(x, y - 1, obj_player) || place_meeting(x, y + 1, obj_player) || place_meeting(x + 1, y, obj_player) || place_meeting(x - 1, y, obj_player);


// TODO: Figure out what we want to happen if the player gets caught between a moving platform and the ground, or a wall
//     - Does the player die? The platform stops? The player get teleported to the other side of the wall and thus maybe off of the map?

// Sinusoidal movement (in either/both x/y directions)
if (fob_cos_move_x || fob_sin_move_y)
{
	// Fps tracker
	fob_sin_time_tracker++;
	
	// Fps to seconds
	var _time = fob_sin_time_tracker / 60.0;
	
	// This prevents fob_sin_time_tracker from growing endlessly
	if (_time > 2 * pi)
	{
		fob_sin_time_tracker = 0;
	}
	
	show_debug_message("time: [" + string(_time) + "] : time_tracker: [" + string(fob_sin_time_tracker) + "]");
	
	// Vertical movement. Sine is used to allow for circular movement (aka shift the phase 90 degrees or pi/2)
	// when both sinusoidal movements are set
	if (fob_sin_move_y)
	{
		var _amp_y = (fob_max_y - fob_min_y) / 2;
		var _y_start = _amp_y + fob_min_y;
		var _old_y = y;
		var _y_move = fob_circle_direction * _amp_y*sin(_time/fob_sin_frequency);
		fob_vertical_speed = round((_y_start + _y_move) - _old_y);
		
		if (fob_player_contact) obj_player.y += fob_vertical_speed;
		y += fob_vertical_speed;
	}
	
	// Horizontal movement
	if (fob_cos_move_x)
	{
		var _amp_x = (fob_max_x - fob_min_x) / 2;
		var _x_start = _amp_x + fob_min_x;
		var _old_x = x;
		var _x_move =  _amp_x*cos(_time/fob_sin_frequency);
		fob_horizontal_speed = round((_x_start + _x_move) - _old_x);
		
		if (fob_player_contact) obj_player.x += fob_horizontal_speed;
		x += fob_horizontal_speed;
	}
}
else
{
	// Horizontal movement
	if (x + fob_horizontal_speed > fob_max_x || x + fob_horizontal_speed < fob_min_x)
	{
		var _distance_to_change = 0;
		if (sign(fob_horizontal_speed > 0))
		{
			_distance_to_change = fob_max_x - x;
		}
		else
		{
			_distance_to_change = fob_min_x - x;
		}	
		
		if (fob_player_contact) obj_player.x += _distance_to_change;
		x += _distance_to_change;
		
		fob_horizontal_speed *= -1;
	}
	else
	{
		if (fob_player_contact) obj_player.x += fob_horizontal_speed;
		x += fob_horizontal_speed;
	}

	// Vertical movement
	if (y + fob_vertical_speed > fob_max_y || y + fob_vertical_speed < fob_min_y)
	{
		var _distance_to_change = 0;
		if (sign(fob_vertical_speed > 0))
		{
			_distance_to_change = fob_max_y - y;
		}
		else
		{
			_distance_to_change = fob_min_y - y;
		}	
		
		if (fob_player_contact) obj_player.y += _distance_to_change;
		y += _distance_to_change;
		
		fob_vertical_speed *= -1;
	}
	else
	{
		if (fob_player_contact) obj_player.y += fob_vertical_speed;
		y += fob_vertical_speed;
	}
}


