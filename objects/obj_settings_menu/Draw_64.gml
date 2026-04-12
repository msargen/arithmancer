/// @description Draw Settings Menu

if (in_settings_menu)
{
	// Draw blue background, gamemaker uses a weird origin offset for draw_roundrect that it doesn't for anything else
	draw_roundrect_colour(settings_menu_box_x_offset - 1, settings_menu_box_y_offset - 1, RES_W - settings_menu_box_x_offset -1, RES_H - settings_menu_box_y_offset - 1, c_blue, c_blue, false)
	
	// Draw settings menu
	scr_scrollable_text_box(settings_menu_option, settings_menu_cursor_position, settings_menu_text_x_offset, settings_menu_text_y_offset, RES_W - settings_menu_text_x_offset, RES_H - settings_menu_text_y_offset, fa_left, global.menu_font, c_grey, 1);
	scr_scrollable_text_box(settings_menu_value, settings_menu_cursor_position, settings_menu_text_x_offset, settings_menu_text_y_offset, RES_W - settings_menu_text_x_offset, RES_H - settings_menu_text_y_offset, fa_right, global.menu_font, c_grey, 1);
}