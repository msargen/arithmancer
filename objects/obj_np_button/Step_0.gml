/// @description Button code

// Run once, set collision mask for sprite orientation
if (!np_button_angle_set)
{
	if (np_button_orientation == 1)
	{
		image_angle = 180;
	}
	else if (np_button_orientation == 2)
	{
		image_angle = 90;
	}
	else if (np_button_orientation == 3)
	{
		image_angle = 270;
	}
	np_button_angle_set = true;
}


np_button_can_input = !np_button_player_on_top;

// Checking three pixels higher to account for the button not pressed sprite being two pixes higher than the pressed version
if (np_button_orientation == 0)
{
	np_button_player_on_top = place_meeting(x, y - 3, obj_player);
}
else if (np_button_orientation == 1)
{
	np_button_player_on_top = place_meeting(x, y + 3, obj_player);
}
else if (np_button_orientation == 2)
{
	// TODO: there is an issue with the left and right facing buttons where if the player is standing
	// on the buttons top and walks off, the button will be pressed
	np_button_player_on_top = place_meeting(x - 3, y, obj_player);
}
else if (np_button_orientation == 3)
{
	np_button_player_on_top = place_meeting(x + 3, y, obj_player);
}

if (np_button_player_on_top && !np_button_pressed)
{
	np_button_timer = get_timer();
	sprite_index = spr_np_button_pressed;
	np_button_pressed = true;
}
else if (!np_button_player_on_top && get_timer() - np_button_timer > np_button_time_diff)
{
	np_button_pressed = false;
	sprite_index = spr_np_button;
}


if (np_button_can_input && np_button_player_on_top && instance_exists(obj_np_equation))
{
	if (string(np_button_key_value) == "B")
	{
		global.key_backspace = true;
	}
	else if (string(np_button_key_value) == "E")
	{
		global.key_select = true;
	}
	else 
	{
		with (obj_np_equation)
		{
			np_equation_input += string_digits(other.np_button_key_value);
		}
	}
	np_button_can_input = false;

}

