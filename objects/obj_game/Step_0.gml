/// @description Timer countdown

if room = rm_lvl_one
{
	timer = timerone --;
}

if room = rm_lvl_two
{
	timer = timertwo --;
}

if room = rm_lvl_three
{
	timer = timerthree --;
}


seconds = floor(timer/60) mod 60;

minutes = floor(timer/3600);

if seconds >= 0 && seconds < 10
{
	global.time = string(minutes) + ":0" + string(seconds);
}
else
{
	global.time = string(minutes) + ":" + string(seconds);
}

if timer == 0
{
	game_restart();
}
