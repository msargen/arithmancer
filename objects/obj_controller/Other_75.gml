/// @description Handle Controller Connect/Disconnect

// add controller to list when a new one is connected
if (ds_map_find_value(async_load, "event_type") == "gamepad discovered")
{
	controller_total_number++;
	array_push(controller_port_list, ds_map_find_value(async_load, "pad_index"));
	controller_selected = controller_total_number;
	scr_settings_menu_controller_update(controller_port_list[controller_selected]);
	controller_text_message = "controller connected";
	controller_text_opacity = 1;
}
// remove controller from list when one is disconnected
else if (ds_map_find_value(async_load, "event_type") == "gamepad lost")
{
	for (var _i = 1; _i <= controller_total_number; _i++)
	{
		if (controller_port_list[_i] == ds_map_find_value(async_load, "pad_index"))
		{
			array_delete(controller_port_list, _i, 1)
			controller_total_number--;
		}
	}
	controller_selected = controller_total_number;
	if (controller_total_number == 0)
	{
		obj_settings_menu.settings_menu_value[SETTINGS_MENU.CONTROLLER] = "none";
	}
	else
	{
		scr_settings_menu_controller_update(controller_port_list[controller_selected]);
	}
	controller_text_message = "controller disconnected";
	controller_text_opacity = 1;
}