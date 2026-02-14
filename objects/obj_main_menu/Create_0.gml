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

main_menu_options[MAIN_MENU.LEVEL_LIST] = "Level List (Dev)";
main_menu_options[MAIN_MENU.QUICK_PLAY] = "Quick Play";
main_menu_options[MAIN_MENU.WORLD_SELECT] = "World Select";
main_menu_options[MAIN_MENU.SETTINGS] = "Settings";
main_menu_options[MAIN_MENU.QUIT] = "Quit";

main_menu_items = 3;
main_menu_cursor = MAIN_MENU.QUICK_PLAY;

if (global.dev_build) {main_menu_items = 4;}