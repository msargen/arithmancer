/// @description To ensure the player does not get "stuck" in a wall

// If the player is not within a wall, or currently pinched, exit
if (!place_meeting(x, y, obj_wall) || player_pinched)
{
	return;
}

// Used to determine the shortest distance to get the player out of the wall
var _move_left = 0;
var _move_right = 0;
var _move_up = 0;
var _move_down = 0;

// If the player is stuck on the left side of a wall, move them left until they are no longer stuck
while (place_meeting(x + 1 + _move_left, y, obj_wall))
{
	_move_left -= 1;
}

// If the player is stuck on the right side of a wall, move them right until they are no longer stuck
while (place_meeting(x - 1 + _move_right, y, obj_wall))
{
	_move_right += 1;
}

// If the player is stuck on the top side of a wall, move them up until they are no longer stuck
while (place_meeting(x, y + 1 + _move_up, obj_wall))
{
	_move_up -= 1;
}

// If the player is stuck on the bottom side of a wall, move them down until they are no longer stuck
while (place_meeting(x, y - 1 + _move_down, obj_wall))
{
	_move_down += 1;
}


var _move_horizontal = 0;
var _move_vertical = 0;

// Find the shortest horizontal difference. Special care has to be taken for values of 0
if (_move_left == 0)
{
	_move_horizontal = _move_right;
}
else if (_move_right == 0)
{
	_move_horizontal = _move_left;
}
else
{
	_move_horizontal = abs(_move_left) < abs(_move_right) ? _move_left : _move_right;
}

// Find the shortest vertical distance
if (_move_up == 0)
{
	_move_vertical = _move_down;
}
else if (_move_down == 0)
{
	_move_vertical = _move_up;
}
else
{
	_move_vertical = abs(_move_up) < abs(_move_down) ? _move_up : _move_down;
}

// Find the shortest overall distance to get out of the wall and move the player that way
if (_move_horizontal == 0)
{
	y += _move_vertical;
}
else if (_move_vertical == 0)
{
	x +=_move_horizontal;
}
else
{
	if (abs(_move_horizontal) < abs(_move_vertical))
	{
		x += _move_horizontal;
	}
	else 
	{
		y += _move_vertical;
	}
}
