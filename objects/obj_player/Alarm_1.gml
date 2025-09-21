/// @description Restart the room

// Get the viewbox for the camera
var _left = camera_get_view_x(view_camera[0]);
var _top = camera_get_view_y(view_camera[0]);
var _right = _left + camera_get_view_width(view_camera[0]);
var _bottom = _top + camera_get_view_height(view_camera[0]);

// Check if the player is still outside the view
if(point_in_rectangle(x, y, _left, _top, _right, _bottom))
{
	player_on_screen = true;
	return;
}

// TODO: Will probabaly want to have a different mech than just restarting the room
call_cancel(global.level_time_source);
room_restart();