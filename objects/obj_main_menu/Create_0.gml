/// @description GUI/Vars/Menu setup
#macro SAVEFILE "Save.sav"

main_menu_gui_width = display_get_gui_width();
main_menu_gui_height = display_get_gui_height();
main_menu_gui_margin = 32;

main_menu_x = main_menu_gui_width + 200;
main_menu_y = main_menu_gui_height - main_menu_gui_margin;
main_menu_x_target = main_menu_gui_width - main_menu_gui_margin;
main_menu_speed = 25; //lower is faster
main_menu_font = fnt_menu;
main_menu_item_height = font_get_size(fnt_menu);
main_menu_committed = -1;
main_menu_control = true;

main_menu_options[4] = "Level 3";
main_menu_options[3] = "Level 2";
main_menu_options[2] = "Level 1";
main_menu_options[1] = "Continue";
main_menu_options[0] = "Quit";

main_menu_items = array_length(main_menu_options);
main_menu_cursor = 2;