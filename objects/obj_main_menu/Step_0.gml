/// @description Control Menu

//Item ease in
main_menu_x += (main_menu_x_target - main_menu_x) / main_menu_speed;

//Keyboard Controls
if (main_menu_control && !obj_settings_menu.in_settings_menu)
{
	if (keyboard_check_pressed(vk_up)) || keyboard_check_pressed(ord("W"))
	{
		main_menu_cursor++;
		if (main_menu_cursor >= main_menu_items) main_menu_cursor = 0;
	}
	
	if (keyboard_check_pressed(vk_down)) || keyboard_check_pressed(ord("S"))
	{
		main_menu_cursor--;
		if (main_menu_cursor < 0) main_menu_cursor = main_menu_items - 1;
	}
	
	if (keyboard_check_pressed(vk_enter))
	{
		if (main_menu_cursor == 5)
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
			audio_play_sound(snd_death, 10, false);
		}
	}
}

if (main_menu_x > main_menu_gui_width + 150) && (main_menu_committed != -1)
{
	switch (main_menu_committed)
	{
		case 4: scr_slide_transition(TRANS_MODE.GOTO, rm_lvl_three); break;
		case 3: scr_slide_transition(TRANS_MODE.GOTO, rm_lvl_two); break;
		case 2: scr_slide_transition(TRANS_MODE.GOTO, rm_lvl_one); break;
		case 1:
		{
			ini_open("settings.ini");
			var _last_level = ini_read_string("Level", "Last Completed", "new_game");
			ini_close();
			scr_level_mapping(_last_level);
		}
		break;
		case 0: game_end(); break;
	}
}