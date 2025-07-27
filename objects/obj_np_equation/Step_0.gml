/// @description Progress text

if (np_equation_num_shown_letters < np_equation_shown_letters_cap)
{
	np_equation_num_shown_letters += np_equation_reveal_speed;
}


// We can also probably clean up all the text variables and code
np_equation_all_text = string_insert(string(np_equation_input), np_equation_text_base, np_equation_base_length);

np_equation_text_current = string_copy(np_equation_all_text, 1, floor(np_equation_num_shown_letters));

// Destroy the equation text bubble when the correct answer has been entered
if ((np_equation_num_shown_letters >= np_equation_base_length) && np_equation_botton_enter && string_length(np_equation_input) > 0)
{
	np_equation_botton_enter = false;
	if (np_equation_equation_solution == real(np_equation_input))
	{
		instance_destroy();
		np_equation_np_flag_id.np_flag_eq_solved += 1;
		if (np_equation_np_flag_id.np_flag_eq_solved == np_equation_np_flag_id.np_flag_tot_eq)
		{
			instance_destroy(np_equation_np_flag_id);
		}
		// Always increment the number of equastions solved, even if the flag is not destroyed yet
		global.equations_solved++ ;
	}
	else
	{
		// Launch the player away from the enter button
		scr_stun_player(obj_player.player_enter_button);
	}
}

if (np_equation_botton_backspace)
{
	np_equation_input = string_delete(np_equation_input, string_length(np_equation_input), 1);
	np_equation_botton_backspace = false;
}
