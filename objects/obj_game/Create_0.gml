/// @description A persisten object throughout the game

game_timer = 0;

game_timer_seconds = 0;
game_timer_minutes = 0;


// Height for the level time and flags text
game_text_height = 10;

game_flags_text_x_location = floor(RES_W * 0.99);

game_time_text_x_location = floor(RES_W * 0.01);

game_text_scale = 1.25;


// Load audio groups
audio_group_load(audiogroup_music);
audio_group_load(audiogroup_sfx);