/// @description scr_stun_player() Stun the player object. 
/// @arg _id The instance to be launched away from.
function scr_stun_player(_id = other.id) {
	// Other position at start time
	var _other_x = _id.x;
	var _other_y = _id.y;
	// Player position at stun time
	var _player_x = obj_player.x;
	var _player_y = obj_player.y;
	
	var _player_spawn_x = obj_player.player_x_spawn;
	var _player_spawn_y = obj_player.player_y_spawn;
	
	instance_destroy(obj_player.id);

	// Substitute in the stunned object and set its initial launch values
	with (instance_create_layer(_player_x, _player_y, "Player", obj_stunned))
	{
		stunned_player_spawn_x = _player_spawn_x;
		stunned_player_spawn_y = _player_spawn_y;
		direction = point_direction(_other_x, _other_y, x, y);
		stunned_horizontal_speed = lengthdir_x(4, direction);
		stunned_vertical_speed = lengthdir_y(2, direction) - 2;
		if (sign(stunned_horizontal_speed) != 0) image_xscale = sign(stunned_horizontal_speed);
	}
}
