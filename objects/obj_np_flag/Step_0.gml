/// @description Equation text


//Proximity
if ((instance_exists(obj_player)) && (point_in_circle(obj_player.x, obj_player.y, x, y, global.interact_distance)) && (!instance_exists(obj_np_equation)))
{
	np_flag_player_nearby = true;
	if (global.key_up)
	{
		// Generate a new equation
		var _equation_results = scr_generate_equation(np_flag_operation);
		np_flag_equation_solution = _equation_results[0];
		np_flag_text = _equation_results[1];
		np_flag_id = instance_nearest(obj_player.x, obj_player.y, obj_np_flag)
		with (instance_create_layer(x, y - np_flag_equation_offset, layer, obj_np_equation))
		{
			np_equation_np_flag_id = other.np_flag_id;
			np_equation_equation_solution = other.np_flag_equation_solution;
			np_equation_text_base = other.np_flag_text;
			np_equation_base_length = string_length(np_equation_text_base);
		}
	}
}
else np_flag_player_nearby = false;

if (np_flag_eq_solved > 0 && !instance_exists(obj_np_equation))
{
	// Generate a new equation
	var _equation_results = scr_generate_equation(np_flag_operation);
	np_flag_equation_solution = _equation_results[0];
	np_flag_text = _equation_results[1];
	with (instance_create_layer(x, y - 32, layer, obj_np_equation))
	{
		np_equation_np_flag_id = other.np_flag_id;
		np_equation_equation_solution = other.np_flag_equation_solution;
		np_equation_text_base = other.np_flag_text;
		np_equation_base_length = string_length(np_equation_text_base);
	}
}

