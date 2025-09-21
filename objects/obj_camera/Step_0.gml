/// @description Update Camera

//Update Destination
if (instance_exists(camera_tracking))
{
	camera_x_move_to = camera_tracking.x;
	camera_y_move_to = camera_tracking.y;
	
	if ((camera_tracking).object_index == obj_stunned)
	{
		x = camera_x_move_to;
		y = camera_y_move_to;
	}
}

//Update object position
x += (camera_x_move_to - x) / 5;
y += (camera_y_move_to - y) / 5;

//Keep camera center inside room
x = clamp(x, camera_view_width_half + global.camera_buffer, room_width - camera_view_width_half - global.camera_buffer);
y = clamp(y, camera_view_height_half + global.camera_buffer, room_height - camera_view_height_half - global.camera_buffer);

//Screen shake
x += random_range(-camera_shake_remain, camera_shake_remain);
y += random_range(-camera_shake_remain, camera_shake_remain);
camera_shake_remain = max(0, camera_shake_remain - ((1/camera_shake_length) * camera_shake_magnitude));

//Update camera view
camera_set_view_pos(camera_view, x - camera_view_width_half, y - camera_view_height_half);

if (room != rm_menu) && (room != rm_ending)
{
	if (layer_exists("Mountains"))
	{
		layer_x("Mountains", x/2);	
	}
	if (layer_exists("Trees"))
	{
		layer_x("Trees", x/4);	
	}
	if (layer_exists("Buildings"))
	{
		layer_x("Buildings", x/4);	
	}
}
