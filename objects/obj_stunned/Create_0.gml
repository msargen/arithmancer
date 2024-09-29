/// @description
stunned_horizontal_speed = 0;
stunned_vertical_speed = 0;
stunned_gravity = 0.2;
stunned_done = 0;

image_speed = 0;
image_index = 0;
scr_screen_shake(8, 90)
audio_play_sound(snd_death, 10, false);
game_set_speed(60, gamespeed_fps);
with (obj_camera) camera_tracking = other.id;

stunned_timer = 180;