/// @description Music

if room = rMenu && (!audio_is_playing(mMenu_Ending))
{
	audio_play_sound(mMenu_Ending,100,true);
}

if room = rEnding && (!audio_is_playing(mMenu_Ending))
{
	audio_stop_all();
	audio_play_sound(mMenu_Ending,100,true);
}

if room = rOne && (!audio_is_playing(mRoom1)) 
{
	audio_stop_all();
	audio_play_sound(mRoom1,1001,true);
}

if room = rTwo && (!audio_is_playing(mRoom2)) 
{
	audio_stop_all();
	audio_play_sound(mRoom2,1001,true);
}

if room = rThree && (!audio_is_playing(mRoom3)) 
{
	audio_stop_all();
	audio_play_sound(mRoom3,1001,true);
}