/// @description Gem Interactions

// pick up a gem if not holding one already
if(!held && !obj_player.holding_gem)
{
	// check if nearest gem is within interact distance
	gem_id = instance_nearest(obj_player.x, obj_player.y, obj_gem)
	if(point_in_circle(obj_player.x, obj_player.y, gem_id.x, gem_id.y, global.interact_distance))
	{
		// hold gem when select button is pressed
		if(global.key_select || global.key_up)
		{
			gem_id.held = true;
			obj_player.holding_gem = true;
		}
	}
}

// drop a gem if holding one
if(obj_player.holding_gem)
{
	if(global.key_down)
	{
		held = false;
		obj_player.holding_gem = false;
	}
}

// move the gem to float above the player
if(held)
{
    // set target as above player head
	gem_x_target = obj_player.x;
	gem_y_target = obj_player.y - gem_float_offset;
	
	// update object position
	x += (gem_x_target - x) / 5;
	y += (gem_y_target - y) / 5;
}