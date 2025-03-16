/// @description Live Timer and Equations Completed Counter
if (room != rm_menu && room != rm_title_screen && !obj_settings_menu.in_settings_menu)
{
	{
		scr_draw_set_text(c_black, fnt_menu, fa_right, fa_top);
		scr_draw_text_shadow(game_flags_text_x_location, game_text_height, c_white, c_black, global.text_offset, string(global.flags_collected) + " Flags Collected", game_text_scale);
	}
	{
		scr_draw_set_text(c_black, fnt_menu, fa_left, fa_top);
		scr_draw_text_shadow(game_time_text_x_location, game_text_height, c_white, c_black, global.text_offset, "Time Elapsed " + global.time, game_text_scale);
	}
}
