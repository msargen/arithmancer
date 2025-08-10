/// @description Handle Controller Connect/Disconnect

// controller connected event
if (ds_map_find_value(async_load, "event_type") == "gamepad discovered")
{
	// add controller to list
	controller_total_number++;
	array_push(controller_port_list, ds_map_find_value(async_load, "pad_index"));
	// if going from 0 to 1 controllers, start using the controller
	if (controller_selected == 0) {controller_selected = controller_total_number;}
	// visual indication of controller connection
	scr_settings_menu_controller_update(controller_port_list[controller_selected]);
	controller_text_message = "controller connected";
	controller_text_opacity = 1;
}

// controller disconnected event
else if (ds_map_find_value(async_load, "event_type") == "gamepad lost")
{
	// find disconnected controller and remove from list
	for (var _i = 1; _i <= controller_total_number; _i++)
	{
		if (controller_port_list[_i] == ds_map_find_value(async_load, "pad_index"))
		{
			// remove controller from list
			array_delete(controller_port_list, _i, 1)
			controller_total_number--;
			// if controller not in use was removed, stay on current controller
			// if controller in use was removed, switch to next controller
			// if last controller was removed, switch to no controller
			if ((controller_selected > _i) || (controller_total_number == 0)) {controller_selected--;}
		}
	}
	// visual indication of controller disconnection
	scr_settings_menu_controller_update(controller_port_list[controller_selected]);
	controller_text_message = "controller disconnected";
	controller_text_opacity = 1;
}

