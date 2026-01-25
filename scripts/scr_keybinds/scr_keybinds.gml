//Sets Keybindings and global varibles

function keybind()
{
	// if a controller is being used, keybind for keyboard and controller
	if (obj_controller.controller_selected != 0)
	{
		var _controller = obj_controller.controller_port_list[obj_controller.controller_selected];
		gamepad_set_axis_deadzone(_controller, 0.1);
		global.key_left = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")) || gamepad_button_check_pressed(_controller, gp_padl);
		global.key_right = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")) || gamepad_button_check_pressed(_controller, gp_padr);
		global.key_jump = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(_controller, gp_face1);
		global.key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(_controller, gp_padu);
		global.key_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) || gamepad_button_check_pressed(_controller, gp_padd);
		global.key_select = keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(_controller, gp_face1);
		global.key_back = keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(_controller, gp_face2);
		global.key_pause = keyboard_check_pressed(vk_pause) || keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(_controller, gp_start) || gamepad_button_check_pressed(_controller, gp_select);
		global.key_hold_left = keyboard_check(vk_left) || keyboard_check(ord("A")) || gamepad_button_check(_controller, gp_padl) || (gamepad_axis_value(_controller, gp_axislh) < 0);
		global.key_hold_right = keyboard_check(vk_right) || keyboard_check(ord("D")) || gamepad_button_check(_controller, gp_padr) || (gamepad_axis_value(_controller, gp_axislh) > 0);
		global.key_interact = 	keyboard_check_pressed(ord("E")) || gamepad_button_check_pressed(_controller, gp_face3);
	}
	// if no controller is being used, only keybind for keyboard
	else
	{
		global.key_left = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
		global.key_right = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
		global.key_jump = keyboard_check_pressed(vk_space);
		global.key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
		global.key_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
		global.key_select = keyboard_check_pressed(vk_enter);
		global.key_back = keyboard_check_pressed(vk_escape);
		global.key_backspace = keyboard_check_pressed(vk_backspace);
		global.key_pause = keyboard_check_pressed(vk_pause) || keyboard_check_pressed(vk_escape);
		global.key_hold_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
		global.key_hold_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
		global.key_interact = keyboard_check_pressed(ord("E"));
	}
}