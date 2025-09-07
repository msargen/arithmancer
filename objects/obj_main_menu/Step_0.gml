/// @description Control Menu
//Item ease in
main_menu_x += (main_menu_x_target - main_menu_x) / main_menu_speed;

//Keyboard Controls
if (main_menu_control && !obj_settings_menu.in_settings_menu)
{
	if (global.key_up)
	{
		++main_menu_cursor;
		// Loop to the bottom option
		if (main_menu_cursor > main_menu_items) main_menu_cursor = 0;
	}
	
	if (global.key_down)
	{
		main_menu_cursor--;
		if (main_menu_cursor < 0) main_menu_cursor = main_menu_items;
	}
	
	if (main_menu_cursor == MAIN_MENU.LEVEL_LIST)
	{
		if (global.key_left && (main_menu_lvl_list_selector > 0))
		{
			main_menu_lvl_list_selector--;
			main_menu_options[MAIN_MENU.LEVEL_LIST] = main_menu_lvl_list_names[main_menu_lvl_list_selector]
		}
		if (global.key_right && (main_menu_lvl_list_selector < array_length(main_menu_tmp_lvl_list) - 1))
		{
			main_menu_lvl_list_selector++;
			main_menu_options[MAIN_MENU.LEVEL_LIST] = main_menu_lvl_list_names[main_menu_lvl_list_selector]
		}
	}
	
	if (global.key_select)
	{
		if (main_menu_cursor == MAIN_MENU.SETTINGS)
		{
			obj_settings_menu.settings_menu_cursor_position = 0;
			obj_settings_menu.in_settings_menu = true;
		}
		else
		{
			main_menu_x_target = main_menu_gui_width + main_menu_offscreen_slide_in;
			main_menu_committed = main_menu_cursor;
			scr_screen_shake(6, 60);
			main_menu_control = false;
			audio_play_sound(snd_death, 10, false, 0.69);
		}
	}
}

if (main_menu_x > main_menu_gui_width + 50) && (main_menu_committed != -1)
{
	switch (main_menu_committed)
	{
		case MAIN_MENU.LEVEL_LIST: scr_slide_transition(TRANS_MODE.GOTO, main_menu_tmp_lvl_list[main_menu_lvl_list_selector]); break;
		case MAIN_MENU.LEVEL_THREE: scr_slide_transition(TRANS_MODE.GOTO, rm_lvl_three); break;
		case MAIN_MENU.LEVEL_TWO: scr_slide_transition(TRANS_MODE.GOTO, rm_lvl_two); break;
		case MAIN_MENU.LEVEL_ONE: scr_slide_transition(TRANS_MODE.GOTO, rm_lvl_one); break;
		case MAIN_MENU.CONTINUE:
		{
			ini_open("settings.ini");
			var _last_level = ini_read_string("Level", "Last Completed", "new_game");
			ini_close();
			scr_level_mapping(_last_level);
		}
		break;
		case MAIN_MENU.QUIT: game_end(); break;
	}
}