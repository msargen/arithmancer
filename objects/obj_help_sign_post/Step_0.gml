/// @description Show help tip whenever the player is nearby

// Note: (to be changed later probably) Currently will loop through the list of text and symbols each time
//       the player leaves then enters the check radius.

// Proximity check
var _player_nearby = point_in_circle(obj_player.x, obj_player.y, x, y, global.interact_distance);

if (instance_exists(obj_player) && _player_nearby && !instance_exists(obj_help_text_box))
{
	help_sp_player_nearby = true;
	
	with (instance_create_layer(x, y - help_sp_text_offset, layer, obj_help_text_box))
	{
		other.help_sp_text_id = id;
		help_tb_text = other.help_sp_text_list[other.help_sp_list_index];
		help_tb_symbol = other.help_sp_symbol_list[other.help_sp_list_index];
	}
	
	help_sp_list_index++;
	if (help_sp_list_index >= array_length(help_sp_text_list))
	{
		help_sp_list_index = 0;
	}
}
else if (_player_nearby)
{
	// Do nothing
}
else 
{
	help_sp_player_nearby = false;
	if (instance_exists(help_sp_text_id))
	{
		instance_destroy(help_sp_text_id);
		help_sp_text_id = noone
	}
}