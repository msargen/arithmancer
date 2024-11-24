//Sets Keybindings and global varibles

global.key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
global.key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
global.key_jump = keyboard_check(vk_space);
global.key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
global.key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
global.key_select = keyboard_check(vk_enter);
global.key_pause = keyboard_check(vk_pause) || keyboard_check(vk_escape);
