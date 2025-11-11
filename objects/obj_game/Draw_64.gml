/// @description Live Timer and Equations Completed Counter
// only display if the current room is a level, and if the settings menu is inactive
if (scr_room_is_level(room) && !obj_settings_menu.in_settings_menu)
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
