/// @description A persistent object throughout the game

game_timer = 0;

game_timer_seconds = 0;
game_timer_minutes = 0;

// Height for the level time and flags text
game_text_height = 5;

game_flags_text_x_location = floor(RES_W * 0.99);

game_time_text_x_location = floor(RES_W * 0.01);

game_text_scale = 0.5;

// Load audio groups
audio_group_load(audiogroup_music);
audio_group_load(audiogroup_sfx);

// Set the game fps
game_set_speed(global.framerate, gamespeed_fps);