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
			main_menu_x_target = main_menu_gui_width + 200;
			main_menu_committed = main_menu_cursor;
			scr_screen_shake(6, 60);
			main_menu_control = false;
			audio_play_sound(snd_death, 10, false, 0.69);
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
			if (!file_exists(SAVEFILE))
			{
				scr_slide_transition(TRANS_MODE.NEXT);	
			}
			else
			{
				var _file = file_text_open_read(SAVEFILE);
				var _target = file_text_read_string(_file);
				var _room = rm_menu;
				
				if (_target == room_get_name(rm_lvl_one))
				{
					_room = rm_lvl_one;
				}
				else if (_target == room_get_name(rm_lvl_two))
				{
					_room = rm_lvl_two;
				}
				else if (_target == room_get_name(rm_lvl_three))
				{
					_room = rm_lvl_three;
				}
				
				file_text_close(_file);
				scr_slide_transition(TRANS_MODE.GOTO,_room);
			}
		}
		break;
		case 0: game_end(); break;
	}
}