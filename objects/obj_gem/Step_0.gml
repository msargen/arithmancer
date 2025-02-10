/// @description Gem Interactions

// skip interactions if player is stunned
if(!instance_exists(obj_player)){return;};

// pick up a gem if not holding one already
if(!obj_player.holding_gem)
{
	// check if nearest gem is within interact distance
	closest_gem = instance_nearest(obj_player.x, obj_player.y, obj_gem)
	if(point_in_circle(obj_player.x, obj_player.y, closest_gem.x, closest_gem.y, global.interact_distance))
	{
		// hold gem when select button is pressed
		if(global.key_select || global.key_up)
		{
			held_gem = closest_gem;
			obj_player.holding_gem = true;
		}
	}
}

// drop a gem if holding one
if(obj_player.holding_gem)
{
	if(global.key_down)
	{
		held_gem = 0;
		obj_player.holding_gem = false;
	}
}

// move the gem to float above the player
if(obj_player.holding_gem)
{
    // set target as above player head
	gem_x_target = obj_player.x;
	gem_y_target = obj_player.y - gem_float_offset;
	
	// update object position
	held_gem.x += (gem_x_target - held_gem.x) / 5;
	held_gem.y += (gem_y_target - held_gem.y) / 5;
}