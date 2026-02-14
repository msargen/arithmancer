/// @description Build list of levels

lol_list = array_create(0);
lol_room = room_first;

lol_cursor = 0;
lol_text_horizontal = RES_W / 2;
lol_text_vertical = RES_H / 2;
lol_line_height = font_get_size(global.monotype_font) * 1.5;

// Check all rooms
while (lol_room != room_last)
{
	// Advance to the next room, the first room is the loading screen, and the last room needs to be checked
	lol_room = room_next(lol_room);
	
	// Check if the room is a level
	if (scr_room_is_level(lol_room))
	{
		// Add level to list
		array_push(lol_list, lol_room);
	}
}

lol_list_count = array_length(lol_list);