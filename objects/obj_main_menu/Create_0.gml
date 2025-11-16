/// @description GUI/Vars/Menu setup

main_menu_gui_width = display_get_gui_width();
main_menu_gui_height = display_get_gui_height();
main_menu_gui_margin = 8;

// Determines from where offscreen the menu items start/end
main_menu_offscreen_slide_in = main_menu_gui_width / 5;

main_menu_x = main_menu_gui_width + main_menu_offscreen_slide_in;
main_menu_y = main_menu_gui_height - main_menu_gui_margin;
main_menu_x_target = main_menu_gui_width - main_menu_gui_margin;
main_menu_speed = 25; //lower is faster
main_menu_item_height = font_get_size(fnt_menu);
main_menu_committed = -1;

main_menu_control = true;

// Temporary values for an easier way to add rooms for testing
main_menu_lvl_list_selector = 3;
main_menu_lvl_list_names[3] = "vertical_scroll";
main_menu_lvl_list_names[2] = "lvl_three";
main_menu_lvl_list_names[1] = "lvl_two";
main_menu_lvl_list_names[0] = "lvl_one";
main_menu_tmp_lvl_list[3] = rm_vertical_scroll;
main_menu_tmp_lvl_list[2] = rm_lvl_three;
main_menu_tmp_lvl_list[1] = rm_lvl_two;
main_menu_tmp_lvl_list[0] = rm_lvl_one;
main_menu_options[MAIN_MENU.LEVEL_LIST] = main_menu_lvl_list_names[main_menu_lvl_list_selector];

main_menu_options[MAIN_MENU.SETTINGS] = "Settings";
main_menu_options[MAIN_MENU.LEVEL_THREE] = "Level 3";
main_menu_options[MAIN_MENU.LEVEL_TWO] = "Level 2";
main_menu_options[MAIN_MENU.LEVEL_ONE] = "Level 1";
main_menu_options[MAIN_MENU.CONTINUE] = "Continue";
main_menu_options[MAIN_MENU.QUIT] = "Quit";

main_menu_items = array_length(main_menu_options) - 1;
main_menu_cursor = MAIN_MENU.LEVEL_ONE;
