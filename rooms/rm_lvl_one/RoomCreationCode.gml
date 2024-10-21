// level one bacground music
audio_stop_all();
audio_play_sound(snd_music_lvl_one, 1001, true);

// room creation script passing the savestate load number in case we load from savestate
scr_room_creation(obj_savestate_data.savestate_load_number);