/// @description Gem Socket Interactions

// skip interactions if player is stunned
if(!instance_exists(obj_player)){return;};

// establish closest socket
closest_socket = instance_nearest(obj_player.x, obj_player.y, obj_gem_socket)
near_socket = point_in_circle(obj_player.x, obj_player.y, closest_socket.x, closest_socket.y, global.interact_distance);

// check if the right gem is at the right socket
if(obj_player.holding_gem && near_socket && (global.key_up || global.key_select))
{
	if(closest_socket.sum == obj_gem.closest_gem.answer)
	{
		// destroy carried gem
		var _temp = obj_gem.held_gem
		obj_gem.held_gem = 0;
		instance_destroy(_temp);
		obj_player.holding_gem = false;
		
		// activate socket
		closest_socket.sum = 0;
		closest_socket.image_index = 1;
		global.flags_collected++
	}
	else
	{
		// stun player for incorrect attempt
		with(obj_player) {scr_stun_player();};
	}
}