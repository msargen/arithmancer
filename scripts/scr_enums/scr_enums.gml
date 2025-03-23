// enum for obj_settings_menu
enum SETTINGS_MENU
{
	MAIN_VOLUME = 0,
	MUSIC_VOLUME = 1,
	SFX_VOLUME = 2,
	EMPTY_1 = 3,
	FULLSCREEN = 4,
	RESOLUTION = 5,
	EMPTY_2 = 6,
	EXIT_SETTINGS = 7
}

// Enum for orientation. The values are the angles of the object within the room.
enum ORIENTATION
{
	UP = 0,
	DOWN = 180,
	LEFT = 90,
	RIGHT = -90
}

// Enum for equation generation.
enum EQUATION_TYPE
{
	RANDOM = 0,
	ADDITION = 1,
	SUBTRACTION = 2,
	MULTIPLICATION = 3,
	DIVISION = 4,
}