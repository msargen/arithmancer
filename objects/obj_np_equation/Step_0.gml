/// @description Progress text

if (np_equation_letters < np_equation_letters_cap)
{
	np_equation_letters += np_equation_speed;
}
//np_equation_input = string_digits(keyboard_string);
np_equation_all_text = np_equation_text + np_equation_input;
np_equation_text_current = string_copy(np_equation_all_text, 1, floor(np_equation_letters));

draw_set_font(fnt_sign);
if (np_equation_display_height == 0) np_equation_display_height = string_height(np_equation_all_text);
np_equation_display_width = string_width(np_equation_text_current);

//Destroy when done
if (np_equation_letters >= np_equation_length) && global.key_select && string_length(np_equation_input) > 0 && np_equation_equation_solution == real(np_equation_input)
{
	//keyboard_string = "";
	instance_destroy();
	np_equation_np_flag_id.np_flag_eq_solved += 1;
	if (np_equation_np_flag_id.np_flag_eq_solved == np_equation_np_flag_id.np_flag_tot_eq)
	{
		instance_destroy(np_equation_np_flag_id);
		global.flags_collected++ ;
	}
}

if (global.key_backspace)
{
	np_equation_input = string_delete(np_equation_input, string_length(np_equation_input), 1);
}
