//Disable alpha blending (Drawing just RGB)
//gpu_set_blendenable(false);

if (pause_is_paused)  //draw frozen image to screen while paused
{
	surface_set_target(application_surface);
		if (surface_exists(pause_surface)) draw_surface(pause_surface, 0,0);
		else //restore from buffer if the surface is lost
		{
			pause_surface = surface_create(RES_W,RES_H);
			buffer_set_surface(pause_surface_buffer,pause_surface,0);
		}
	surface_reset_target();
}

if (keyboard_check_pressed(vk_pause) || keyboard_check_pressed(vk_escape)) //Toggle Pause
{
	if (!pause_is_paused) //pause now
	{
		pause_is_paused = true;
		
		//deactivate anything other than this instance
		instance_deactivate_all(true);
		instance_activate_object(obj_settings_menu);
		
		//capture game moment
		pause_surface = surface_create(RES_W,RES_H);
		surface_set_target(pause_surface);
			draw_surface(application_surface,0,0);
		surface_reset_target();
		
		//Back up surface to buffer in case we lose it (screen focus, ect)
		if (buffer_exists(pause_surface_buffer)) buffer_delete(pause_surface_buffer);
		pause_surface_buffer = buffer_create(RES_W * RES_H * 4, buffer_fixed, 1);
		buffer_get_surface(pause_surface_buffer,pause_surface,0);
	}
	else //unpause now
	{
		pause_is_paused = false;
		instance_activate_all();
		if (surface_exists(pause_surface)) surface_free(pause_surface);
		if (buffer_exists(pause_surface_buffer)) buffer_delete(pause_surface_buffer);
	}
}

//Enable alpha blending
//gpu_set_blendenable(true);
		