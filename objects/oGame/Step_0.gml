/// @description Timer countdown

if room = rOne
{
	timer = timerone --;
}

if room = rTwo
{
	timer = timertwo --;
}

if room = rThree
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
