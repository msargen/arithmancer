/// @description Button code

np_button_can_input = !np_button_pressed;

switch (image_angle)
{
	case ORIENTATION.DOWN:
		np_button_pressed = place_meeting(x, y + 3, obj_player);
	break;
	
	case ORIENTATION.LEFT:
		// TODO: there is an issue with the left and right facing buttons where if the player is standing
		// on the buttons top and walks off, the button will be pressed
		np_button_pressed = place_meeting(x - 3, y, obj_player);
	break;
	
	case ORIENTATION.RIGHT:
		np_button_pressed = place_meeting(x + 3, y, obj_player);
	break;
	
	default:
		np_button_pressed = place_meeting(x, y - 3, obj_player);
}

if (np_button_pressed && !np_button_sprite_button_pressed)
{
	np_button_timer = get_timer();
	sprite_index = spr_np_button_pressed;
	np_button_sprite_button_pressed = true;
}
else if (!np_button_pressed && get_timer() - np_button_timer > np_button_time_diff)
{
	np_button_sprite_button_pressed = false;
	sprite_index = spr_np_button;
}


if (np_button_can_input && np_button_pressed && instance_exists(obj_np_equation))
{
	if (string(np_button_key_value) == "B")
	{
		obj_np_equation.np_equation_botton_backspace = true;
	}
	else if (string(np_button_key_value) == "E")
	{
		// Indicate which button the player just hit
		obj_player.player_enter_button = id;
		obj_np_equation.np_equation_botton_enter = true;
	}
	else 
	{
		with (obj_np_equation)
		{
			// Prevents the diplayed text from being cut off due too there being more player input
			// than what can be displayed
			if (string_length(np_equation_text_current) < np_equation_shown_letters_cap)
			{
				np_equation_input += string_digits(other.np_button_key_value);
			}
		}
	}
	np_button_can_input = false;

}

