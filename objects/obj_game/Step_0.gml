/// @description Timer countdown

if (room = rm_lvl_one)
{
	game_timer = game_timer_one--;
}

if (room = rm_lvl_two)
{
	game_timer = game_timer_two--;
}

if (room = rm_lvl_three)
{
	game_timer = game_timer_three--;
}


game_timer_seconds = floor(game_timer / 60) mod 60;

game_timer_minutes = floor(game_timer / 3600);

if (game_timer_seconds >= 0 && game_timer_seconds < 10)
{
	global.time = string(game_timer_minutes) + ":0" + string(game_timer_seconds);
}
else
{
	global.time = string(game_timer_minutes) + ":" + string(game_timer_seconds);
}

if (game_timer == 0)
{
	game_restart();
}
