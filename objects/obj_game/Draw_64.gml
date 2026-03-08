/// @description Live Timer and Equations Completed Counter

// Only display if the current room is a level
if (scr_room_is_level(room))
{
	// Timer in the top left
	scr_draw_set_text(c_white, global.menu_font, fa_left, fa_top);
	draw_text(game_text_padding_h, game_text_padding_v, "Time Elapsed " + global.time)
	
	// Number of equations solved in the top right
	draw_set_halign(fa_right);
	draw_text(RES_W - game_text_padding_h, game_text_padding_v, string(global.equations_solved) + " Equations solved")
}