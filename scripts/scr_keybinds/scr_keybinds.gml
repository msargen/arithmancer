//Sets Keybindings and global varibles

function keybind()
{
	gamepad_set_axis_deadzone(0, 0.1);
	global.key_left = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")) || gamepad_button_check_pressed(0, gp_padl);
	global.key_right = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")) || gamepad_button_check_pressed(0, gp_padr);
	global.key_jump = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face3) || gamepad_button_check_pressed(0, gp_face4);
	global.key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(0, gp_padu);
	global.key_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) || gamepad_button_check_pressed(0, gp_padd);
	global.key_select = keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_face1);
	global.key_backspace = keyboard_check_pressed(vk_backspace) || gamepad_button_check_pressed(0, gp_face2);
	global.key_pause = keyboard_check_pressed(vk_pause) || keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0, gp_start) || gamepad_button_check_pressed(0, gp_select);
	global.key_hold_left = keyboard_check(vk_left) || keyboard_check(ord("A")) || gamepad_button_check(0, gp_padl) || (gamepad_axis_value(0, gp_axislh) < 0);
	global.key_hold_right = keyboard_check(vk_right) || keyboard_check(ord("D")) || gamepad_button_check(0, gp_padr) || (gamepad_axis_value(0, gp_axislh) > 0);
}