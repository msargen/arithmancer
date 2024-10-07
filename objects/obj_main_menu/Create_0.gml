/// @description GUI/Vars/Menu setup

main_menu_gui_width = display_get_gui_width();
main_menu_gui_height = display_get_gui_height();
main_menu_gui_margin = global.margin_buffer;

// Determines from where offscreen the menu items start/end
main_menu_offscreen_slide_in = main_menu_gui_width / 5;

main_menu_x = main_menu_gui_width + main_menu_offscreen_slide_in;
main_menu_y = main_menu_gui_height - main_menu_gui_margin;
main_menu_x_target = main_menu_gui_width - main_menu_gui_margin;
main_menu_speed = 25; //lower is faster
main_menu_item_height = font_get_size(fnt_menu);
main_menu_committed = -1;

main_menu_control = true;

main_menu_options[5] = "Settings";
main_menu_options[4] = "Level 3";
main_menu_options[3] = "Level 2";
main_menu_options[2] = "Level 1";
main_menu_options[1] = "Continue";
main_menu_options[0] = "Quit";

main_menu_items = array_length(main_menu_options);
main_menu_cursor = 2;
