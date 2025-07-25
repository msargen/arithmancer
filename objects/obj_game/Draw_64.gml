/// @description Live Timer and Equations Completed Counter
if (room != rm_menu && room != rm_title_screen && !obj_settings_menu.in_settings_menu)
{
	{
		scr_draw_set_text(c_black, fnt_menu, fa_right, fa_top);
		scr_draw_text_shadow(game_flags_text_x_location, game_text_height, c_white, c_black, global.text_offset, string(global.equations_solved) + " Equations solved", game_text_scale);
	}
	{
		scr_draw_set_text(c_black, fnt_menu, fa_left, fa_top);
		scr_draw_text_shadow(game_time_text_x_location, game_text_height, c_white, c_black, global.text_offset, "Time Elapsed " + global.time, game_text_scale);
	}
}


// temp code to display connected controller info
var _controller_status = "none"
var _controller_height = game_text_height

scr_draw_set_text(c_black, fnt_menu, fa_left, fa_top);

for (var _i = 0; _i < 13; _i++)
{
	if (gamepad_get_description(_i) != "")
	{
		_controller_status = gamepad_get_description(_i);
	}
	else
	{
		_controller_status = "no controller detected";
	}
	_controller_height = _controller_height + 2 * game_text_height;
	scr_draw_text_shadow(game_time_text_x_location, _controller_height, c_white, c_black, global.text_offset, "controller " + string(_i) + ": " + _controller_status, game_text_scale);
}
