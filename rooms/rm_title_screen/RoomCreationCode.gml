// Start background music when first loading game
if (obj_game.game_previous_room == rm_loading_screen)
{
	audio_play_sound(snd_menu_ending, 1001, true);
}