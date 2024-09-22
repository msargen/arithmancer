/// @description GUI/Vars/Menu setup
#macro SAVEFILE "Save.sav"

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;

menu_x = gui_width + 200;
menu_y = gui_height - gui_margin;
menu_x_target = gui_width - gui_margin;
menu_speed = 25; //lower is faster
menu_font = fnt_menu;
menu_itemheight = font_get_size(fnt_menu);
menu_committed = -1;
menu_control = true;

menu[4] = "Level 3";
menu[3] = "Level 2";
menu[2] = "Level 1";
menu[1] = "Continue";
menu[0] = "Quit";

menu_items = array_length(menu);
menu_cursor = 2;