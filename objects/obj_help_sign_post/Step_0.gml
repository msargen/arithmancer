/// @description Showing tip

// Proximity
// TODO: make new tip text bubble
var _nearby = point_in_circle(obj_player.x, obj_player.y, x, y, global.interact_distance);
if (instance_exists(obj_player) && _nearby && !instance_exists(obj_help_text_box))
{
	help_sp_player_nearby = true;
	// TODO:
	with (instance_create_layer(x, y - help_sp_text_offset, layer, obj_help_text_box))
	{
		other.help_sp_text_id = id
		help_tb_text = other.help_sp_text_list[other.help_sp_list_index];
		help_tb_symbol = other.help_sp_symbol_list[other.help_sp_list_index];
	}
	help_sp_list_index++;
	if (help_sp_list_index >= array_length(help_sp_text_list))
	{
		help_sp_list_index = 0;
	}
}
else if (_nearby)
{
	// Do nothing (basically)
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