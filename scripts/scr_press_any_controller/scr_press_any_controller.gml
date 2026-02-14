/// @description Check for any controller button presses the same way keyboard_check_pressed(vk_anykey) works
function  scr_press_any_controller()
{
	var _controller = obj_controller.controller_port_list[obj_controller.controller_selected];
	var _pressed = false
	
	// If a controller is being used, check all buttons
	if (obj_controller.controller_selected != 0)
	{	
		_pressed = gamepad_button_check_pressed(_controller, gp_face1)
		|| gamepad_button_check_pressed(_controller, gp_face2)
		|| gamepad_button_check_pressed(_controller, gp_face3)
		|| gamepad_button_check_pressed(_controller, gp_face4)
		|| gamepad_button_check_pressed(_controller, gp_shoulderl)
		|| gamepad_button_check_pressed(_controller, gp_shoulderlb)
		|| gamepad_button_check_pressed(_controller, gp_shoulderr)
		|| gamepad_button_check_pressed(_controller, gp_shoulderrb)
		|| gamepad_button_check_pressed(_controller, gp_select)
		|| gamepad_button_check_pressed(_controller, gp_start)
		|| gamepad_button_check_pressed(_controller, gp_stickl)
		|| gamepad_button_check_pressed(_controller, gp_stickr)
		|| gamepad_button_check_pressed(_controller, gp_padu)
		|| gamepad_button_check_pressed(_controller, gp_padd)
		|| gamepad_button_check_pressed(_controller, gp_padl)
		|| gamepad_button_check_pressed(_controller, gp_padr);
	}
	
	return _pressed
}