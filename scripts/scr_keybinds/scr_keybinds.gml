//Sets Keybindings and global varibles

function keybind()
{
	global.key_left = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
	global.key_right = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
	global.key_jump = keyboard_check_pressed(vk_space);
	global.key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	global.key_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	global.key_select = keyboard_check_pressed(vk_enter);
	global.key_pause = keyboard_check_pressed(vk_pause) || keyboard_check_pressed(vk_escape);
	global.key_hold_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	global.key_hold_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
}