/// @description Update the displayed controller for the settings menu
/// @arg _controller_slot Controller slot of selected controller
function scr_settings_menu_controller_update(_controller_slot)
{
	with (obj_settings_menu)
	{
		// If no controllers left, set values to defaults for keyboard
		if (_controller_slot == -1)
		{
			settings_menu_value[SETTINGS_MENU.CONTROLLER] = "none";
			sm_symbols = SYMBOLS.KEYBOARD;
		}
		else
		{
			// Get name of controller
			var _controller_name = string_split(gamepad_get_description(_controller_slot), " ");
			
			// Update settings menu values
			settings_menu_value[SETTINGS_MENU.CONTROLLER] = "port " + string(_controller_slot) + ": " + _controller_name[0];
			
			// Look for PS or PLAYSTATION in the controller name
			if (string_starts_with(_controller_name[0], "PS") || string_starts_with(_controller_name[0], "PLAYSTATION"))
			{
				sm_symbols = SYMBOLS.PLAYSTATION;
			}
			else // Generic controllers use xinput, therefore using the same symbols as Xbox
			{
				sm_symbols = SYMBOLS.XBOX;
			}
		}
		
		// Update symbols value in settings menu
		scr_settings_symbol_value_update(sm_symbols);
	}
}



/// @description Update the symbols value for the settings menu
/// @arg _symbols Chosen symbols for display
function scr_settings_symbol_value_update(_symbols)
{
	switch (_symbols)
	{
		case SYMBOLS.KEYBOARD:
			obj_settings_menu.settings_menu_value[SETTINGS_MENU.SYMBOLS] = "Keyboard";
			break;
		
		case SYMBOLS.PLAYSTATION:
			obj_settings_menu.settings_menu_value[SETTINGS_MENU.SYMBOLS] = "PlayStation";
			break;
		
		case SYMBOLS.XBOX:
			obj_settings_menu.settings_menu_value[SETTINGS_MENU.SYMBOLS] = "Xbox";
			break;
	}
}