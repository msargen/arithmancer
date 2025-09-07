/// @description
stunned_horizontal_speed = 0;
stunned_vertical_speed = 0;
stunned_gravity = 0.2;
stunned_done = 0;

image_speed = 0;
image_index = 0;
scr_screen_shake(8, 90)
audio_play_sound(snd_death, 10, false);
with (obj_camera) camera_tracking = other.id;

// 1.5 seconds
stunned_timer = 90;

stunned_player_spawn_x = 0;
stunned_player_spawn_y = 0;