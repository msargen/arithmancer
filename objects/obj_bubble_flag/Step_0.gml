/// @description Equation text


//Proximity
if ((instance_exists(obj_player)) && (point_in_circle(obj_player.x, obj_player.y, x, y, global.interact_distance)) && (!bubble_flag_equation_display))
{
	bubble_flag_player_nearby = true;
	if (global.key_up)
	{
		// Generate equation
		var _equation_results = scr_generate_equation(bubble_flag_operation);

		//Equation Variables
		bubble_flag_equation_solution = _equation_results[0];
		bubble_flag_text = _equation_results[1];
		bubble_flag_equation_display = true;
	
		
		// Call Script to generate Bubble Answers
		bubble_object_ids = scr_text_box_bubbles(bubble_flag_equation_solution, x, y, bubble_flag_id);
		
	}
}
else 
{
	bubble_flag_player_nearby = false;
}

