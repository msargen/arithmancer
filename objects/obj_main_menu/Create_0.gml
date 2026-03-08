/// @description GUI/Vars/Menu setup

// Determines from where offscreen the menu items start/end
main_menu_offscreen_slide_in = RES_W / 5;
main_menu_gui_margin = 8;

main_menu_x = RES_W + main_menu_offscreen_slide_in;
main_menu_y = RES_H - main_menu_gui_margin;
main_menu_x_target = RES_W - main_menu_gui_margin;
main_menu_speed = 25; //lower is faster
main_menu_item_height = font_get_size(fnt_menu);

if (global.dev_build)
{
	main_menu_options[MAIN_MENU.LEVEL_LIST] = "Level List (Dev)";
}
main_menu_options[MAIN_MENU.QUICK_PLAY] = "Quick Play";
// TODO change name of quick play to be start/continue based on progression
main_menu_options[MAIN_MENU.WORLD_SELECT] = "World Select";
main_menu_options[MAIN_MENU.SETTINGS] = "Settings";
main_menu_options[MAIN_MENU.QUIT] = "Quit";

main_menu_items = array_length(main_menu_options) - 1;
main_menu_cursor = MAIN_MENU.QUICK_PLAY;