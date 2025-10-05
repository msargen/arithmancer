/// @description Restart the room

// Get the viewbox for the camera
var _left = camera_get_view_x(view_camera[0]);
var _top = camera_get_view_y(view_camera[0]);
var _right = _left + camera_get_view_width(view_camera[0]);
var _bottom = _top + camera_get_view_height(view_camera[0]);

// Check if the player is still outside the view
if(point_in_rectangle(x, y, _left, _top, _right, _bottom))
{
	player_should_check_position = true;
	return;
}

// If the player is too high, that is probably ok (for now) and shouldn't result in a failure state
if(y < _top)
{
	player_should_check_position = true;
	show_debug_message("Player is above the screen");
	return;
}

// TODO: Will probabaly want to have a different mech than just restarting the room
call_cancel(global.level_time_source);
room_restart();