// Is the player touching the platform in any way
fob_player_contact = place_meeting(x, y - 1, obj_player) || place_meeting(x, y + 1, obj_player) || place_meeting(x + 1, y, obj_player) || place_meeting(x - 1, y, obj_player);

// Determine which side of the platform the player is in contact with
var _left = place_meeting(x - 1, y, obj_player);
var _right = place_meeting(x + 1, y, obj_player);
var _top = place_meeting(x, y - 1, obj_player);
var _bottom = place_meeting(x, y + 1, obj_player);

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
	
	// Calculate vertical movement. Sine is used to allow for circular movement (aka shift the phase 90 degrees or pi/2)
	// when both sinusoidal movements are set
	if (fob_sin_move_y)
	{
		var _amp_y = (fob_max_y - fob_min_y) / 2;
		var _y_start = _amp_y + fob_min_y;
		var _old_y = y;
		var _y_move = fob_circle_direction * _amp_y*sin(_time/fob_sin_frequency);
		fob_vertical_speed = round((_y_start + _y_move) - _old_y);
	}
	
	// Calculate horizontal movement
	if (fob_cos_move_x)
	{
		var _amp_x = (fob_max_x - fob_min_x) / 2;
		var _x_start = _amp_x + fob_min_x;
		var _old_x = x;
		var _x_move =  _amp_x*cos(_time/fob_sin_frequency);
		fob_horizontal_speed = round((_x_start + _x_move) - _old_x);
	}
}
else
{
	// Calculate horizontal movement
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
		
		fob_horizontal_speed = _distance_to_change;
		fob_change_direction_x = true;
	}

	// Calculate vertical movement
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

		fob_vertical_speed = _distance_to_change;
		fob_change_direction_y = true;
	}

}

// If the player is in contact with the platform, determine if the player should be moved with the platform, left alone,
// or would enter the "pinched" condition
if (fob_player_contact) 
{
	if (_top && !obj_player.player_pinched)
	{
		// If the player is on top of the platform, always move the player in the platform direction except in the case
		// where the player is hanging slightly off the side and would thus be moved into the wall
		with (obj_player)
		{
			if(!place_meeting(x + other.fob_horizontal_speed, y, obj_wall))
			{
				x += other.fob_horizontal_speed;
			}
		}
	}
	else if (_right && sign(fob_horizontal_speed > 0) || _left && sign(fob_horizontal_speed < 0))
	{
		// If the player is being pushed to the right or left by the platform, check for if the player would be pinched before moving
		with (obj_player)
		{
			if(place_meeting(x + other.fob_horizontal_speed, y, obj_wall))
			{
				// The player would be pinched and thus should not be moved
				player_pinched = true;
			}
			else
			{
				x += other.fob_horizontal_speed;
				player_pinched = false;
			}
		}
	}
}

// Move the platform horizontally
x += fob_horizontal_speed;
// If the platform should change directions for linear momement
if (fob_change_direction_x) 
{
	fob_horizontal_speed_base *= -1;
	fob_horizontal_speed = fob_horizontal_speed_base;
	fob_change_direction_x = false;
}

if (fob_player_contact) 
{
	if ((_right || _left || (_top && sign(fob_vertical_speed > 0))) && !obj_player.player_pinched)
	{
		// If the player is on the left/right side of the platform, or on top and the platform is moving downward,
		// the player should be moved normally in relation with the platform
		obj_player.y += fob_vertical_speed;
	}
	else if ((_top && sign(fob_vertical_speed < 0)) || (_bottom && sign(fob_vertical_speed > 0)))
	{
		// If the player is on top and the platform is moving up, or the player is beneath and the platform is moving down,
		// check for if the player will be pinched
		with (obj_player)
		{
			if(place_meeting(x, y + other.fob_vertical_speed, obj_wall))
			{
				// The player iw pinched above or below the platform
				player_pinched = true;
			}
			else
			{
				y += other.fob_vertical_speed;
				player_pinched = false;
			}
		}
	}
}

// Move the platform vertically
y += fob_vertical_speed;
// If the platform should change directions for linear momement
if (fob_change_direction_y) 
{
	fob_vertical_speed_base *= -1;
	fob_vertical_speed = fob_vertical_speed_base;
	fob_change_direction_y = false;
}

// Ensure that the player doesn't get left in the pinched state when no longer in contact with the platform
if (!fob_player_contact)
{
	if (instance_exists(obj_player)) obj_player.player_pinched = false;	
}
