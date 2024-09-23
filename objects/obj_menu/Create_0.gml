/// @description GUI/Vars/Menu setup
#macro SAVEFILE "Save.sav"

menu_gui_width = display_get_gui_width();
menu_gui_height = display_get_gui_height();
menu_gui_margin = 32;

menu_x = menu_gui_width + 200;
menu_y = menu_gui_height - menu_gui_margin;
menu_x_target = menu_gui_width - menu_gui_margin;
menu_speed = 25; //lower is faster
menu_font = fnt_menu;
menu_itemheight = font_get_size(fnt_menu);
menu_committed = -1;
menu_control = true;

menu_menu[4] = "Level 3";
menu_menu[3] = "Level 2";
menu_menu[2] = "Level 1";
menu_menu[1] = "Continue";
menu_menu[0] = "Quit";

menu_items = array_length(menu_menu);
menu_cursor = 2;