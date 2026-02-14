// Stop other music and start background music if arriving here not from the title screen
if (obj_game.previous_room != rm_title_screen)
{
	audio_stop_all();
	audio_play_sound(snd_menu_ending, 1001, true);
}