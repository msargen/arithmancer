/// @description Progress text

equation_text_letters += equation_text_speed;
equation_text_input = string_digits(keyboard_string);
equation_text_all_text = equation_text_text + equation_text_input;
equation_text_text_current = string_copy(equation_text_all_text, 1, floor(equation_text_letters));

draw_set_font(fnt_sign);
if (equation_text_display_height == 0) equation_text_display_height = string_height(equation_text_all_text);
equation_text_display_width = string_width(equation_text_text_current);

//Destroy when done
if (equation_text_letters >= equation_text_length) && (keyboard_check_pressed(vk_enter)) && equation_text_equation_solution == real(equation_text_input)
{
	keyboard_string = "";
	instance_destroy();
	with (obj_camera) camera_tracking = obj_player;
	instance_destroy(equation_text_flag_id);
	global.flags_collected++ ;
}