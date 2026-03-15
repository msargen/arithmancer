/// @description A persistent object throughout the game

game_timer = 0;

game_timer_seconds = 0;
game_timer_minutes = 0;

// Horizontal and vertical padding for the level time and flags text
game_text_padding_h = 5;
game_text_padding_v = 5;

// Load audio groups
audio_group_load(audiogroup_music);
audio_group_load(audiogroup_sfx);

// Set the game fps
game_set_speed(global.framerate, gamespeed_fps);

// Track what the previous room was
game_previous_room = rm_loading_screen;