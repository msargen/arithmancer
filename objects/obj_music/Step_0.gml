/// @description Music

if (room = rm_menu && (!audio_is_playing(snd_menu_ending)))
{
	audio_play_sound(snd_menu_ending, 100, true);
}

if (room = rm_ending && (!audio_is_playing(snd_menu_ending)))
{
	audio_stop_all();
	audio_play_sound(snd_menu_ending, 100, true);
}

if (room = rm_lvl_one && (!audio_is_playing(snd_music_lvl_one))) 
{
	audio_stop_all();
	audio_play_sound(snd_music_lvl_one, 1001, true);
}

if (room = rm_lvl_two && (!audio_is_playing(snd_music_lvl_two)))
{
	audio_stop_all();
	audio_play_sound(snd_music_lvl_two, 1001, true);
}

if (room = rm_lvl_three && (!audio_is_playing(snd_music_lvl_three))) 
{
	audio_stop_all();
	audio_play_sound(snd_music_lvl_three, 1001, true);
}