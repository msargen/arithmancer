/// @description Update the displayed controller for the settings menu
/// @arg _controller_slot Controller slot of selected controller
function scr_settings_menu_controller_update(_controller_slot)
{
	obj_settings_menu.settings_menu_value[SETTINGS_MENU.CONTROLLER] = string(_controller_slot) + ": " + gamepad_get_description(_controller_slot);
}