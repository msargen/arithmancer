/// @description
hsp = 0;
vsp = 0;
grv = 0.2;
done = 0;

image_speed = 0;
image_index = 0;
scr_screen_shake(8,90)
audio_play_sound(snd_death,10,false);
game_set_speed(60,gamespeed_fps);
with (obj_camera) follow = other.id;


timer = 180;