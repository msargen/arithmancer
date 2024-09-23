/// @description Control Menu

//Item ease in
menu_x += (menu_x_target - menu_x) / menu_speed;

//Keyboard Controls
if (menu_control)
{
	if (keyboard_check_pressed(vk_up)) || keyboard_check_pressed(ord("W"))
	{
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	
	if (keyboard_check_pressed(vk_down)) || keyboard_check_pressed(ord("S"))
	{
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items - 1;
	}
	
	if (keyboard_check_pressed(vk_enter))
	{
		menu_x_target = menu_gui_width + 200;
		menu_committed = menu_cursor;
		scr_screen_shake(6, 60);
		menu_control = false;
		audio_play_sound(snd_death, 10, false);
	}
}

if (menu_x > menu_gui_width + 150) && (menu_committed != -1)
{
	switch (menu_committed)
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