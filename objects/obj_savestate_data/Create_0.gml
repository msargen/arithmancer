// savestate object for dev testing
// check if there's a way to exclude an object from builds for players

// need to add the timer and flag count

savestate_load_number = 0;

// savestate[0] is the default level data

// savestate[1] saved by [F1] and loaded by [F4]
savestate[1] = 
{
	level : -1,
	camera : 
	{
		x_position : 0,
		y_position : 0
	},
	door : 0,
	equation_text : 0,
	flag : 0,
	pause : 0,
	player : 
	{
		x_position : 0,
		y_position : 0
	},
	ram : 0,
	stunned : 0
}

// savestate[2] saved by [F2] and loaded by [F5]
savestate[2] = 
{
	level : 0,
	camera : 0,
	player : 0
}

// savestate[3] saved by [F3] and loaded by [F6]
savestate[3] = 
{
	level : 0,
	camera : 0,
	player : 0
}