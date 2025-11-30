/// @description Control Settings Menu

// get closest node
dp_closest_node = instance_nearest(x, y + (sprite_get_height(spr_player) / 2), obj_map_node);

if (dp_direction == CARDINAL.NEUTRAL) // waiting at node
{
	// regular sprite while standing still
	sprite_index = spr_player;
	
	// set a direction based on player input
	if (global.key_up)
	{
		dp_direction = CARDINAL.NORTH;
	}
	else if (global.key_right)
	{
		dp_direction = CARDINAL.EAST
	}
	else if (global.key_down)
	{
		dp_direction = CARDINAL.SOUTH;
	}
	else if (global.key_left)
	{
		dp_direction = CARDINAL.WEST;
	}
	else if (global.key_select) // select level at current position
	{
		scr_slide_transition(TRANS_MODE.GOTO, dp_closest_node.mn_room);
	}
	
	// check node for permission to leave
	dp_direction = dp_closest_node.mn_routing[dp_direction];
}
else // moving between nodes
{
	// running sprite while moving
	sprite_index = spr_player_running;
	
	// move in the direction designated
	switch (dp_direction)
	{
		// move north
		case CARDINAL.NORTH:
			y -= dp_speed;
			break;
		// move east
		case CARDINAL.EAST:
			x += dp_speed;
			// face sprite east
			image_xscale = 1;
			break;
		// move south
		case CARDINAL.SOUTH:
			y += dp_speed;
			break;
		// move west
		case CARDINAL.WEST:
			x -= dp_speed;
			// face sprite west
			image_xscale = -1;
			break;
	}
	
	// interactions when the dummy player arrives at a node
	dp_on_node = ((x == dp_closest_node.x) && ((y + (sprite_get_height(spr_player) / 2)) == dp_closest_node.y));
	if (dp_on_node)
	{
		// stop if arriving at a stop node
		if (dp_closest_node.mn_stop == true)
		{
			dp_direction = CARDINAL.NEUTRAL;
		}
		else // passthrough
		{
			// pull routing direction from node
			dp_direction = dp_closest_node.mn_routing[dp_direction];
		}
	}
}

