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
	EASY_BUTTON = 7,
	ADDITION_DIFFICULTY = 8,
	SUBTRACTION_DIFFICULTY = 9,
	MULTIPLICATION_DIFFICULTY = 10,
	DIVISION_DIFFICULTY = 11,
	EMPTY_3 = 12,
	CONTROLLER = 13,
	EMPTY_4 = 14,
	EXIT_SETTINGS = 15
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
	SIMPLE = 0,
	ADDITION = 1,
	SUBTRACTION = 2,
	MULTIPLICATION = 3,
	DIVISION = 4,
}

// Enum for equation difficulty.
enum EQUATION_DIFFICULTY
{
	OFF = 0,
	EASY = 1,
	MEDUIM = 2,
	HARD = 3
}

// Enum for navigating the main menu
enum MAIN_MENU
{
	QUIT = 0,
	SETTINGS = 1,
	WORLD_SELECT = 2,
	QUICK_PLAY = 3,
	LEVEL_LIST = 4
}

// Enum for cardinal directions
enum CARDINAL
{
	NEUTRAL = 0,
	NORTH = 1,
	EAST = 2,
	SOUTH = 3,
	WEST = 4
}