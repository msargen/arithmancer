/// @description Update Camera

//Update Destination
if (instance_exists(follow))
{
	x_move_to = follow.x;
	y_move_to = follow.y;
	
	if ((follow).object_index == obj_player_dead)
	{
		x = x_move_to;
		y = y_move_to;
	}
}

//Update object position
x += (x_move_to - x) / 25;
y += (y_move_to - y) / 25;

//Keep camera center inside room
x = clamp(x,view_w_half+buff,room_width-view_w_half-buff);
y = clamp(y,view_h_half+buff,room_height-view_h_half-buff);

//Screen shake
x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));


//Update camera view
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);

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