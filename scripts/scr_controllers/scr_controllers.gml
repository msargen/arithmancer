/// @description Update the displayed controller for the settings menu
/// @arg _controller_slot Controller slot of selected controller
function scr_settings_menu_controller_update(_controller_slot)
{
	if (_controller_slot == -1)
	{
		obj_settings_menu.settings_menu_value[SETTINGS_MENU.CONTROLLER] = "none"
	}
	else
	{
		obj_settings_menu.settings_menu_value[SETTINGS_MENU.CONTROLLER] = "port " + string(_controller_slot) + ": " + gamepad_get_description(_controller_slot);
	}
}
