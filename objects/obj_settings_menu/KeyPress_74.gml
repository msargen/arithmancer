/// @description Press J to toggle Settings Menu

global.settings_menu_cursor_position = 0;
global.in_settings_menu = !global.in_settings_menu;



// for now since this is the only way to access the settings menu in levels
//   player control is flipped when this happens
var _room = room_get_name(room);
if ((_room != "rm_menu") && (_room != "rm_ending"))
{
	global.player_has_control = !global.player_has_control;
}