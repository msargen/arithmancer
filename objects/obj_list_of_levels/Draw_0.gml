/// @description Opacity carousel

scr_draw_set_text(c_white, global.monotype_font, fa_center, fa_middle)

for (var _i = 0; _i < lol_list_count; _i++)
{
	// Draw selected element in white
	if (_i == lol_cursor)
	{
		draw_text(lol_text_horizontal, lol_text_vertical, room_get_name(lol_list[_i]));
	}
	else // Draw all other elements in grey, fading in opacity the further they are from the selected element
	{
		var _height = lol_text_vertical + (_i - lol_cursor) * lol_line_height
		var _scaling = 1 - abs(_i - lol_cursor) * 0.2 // 20% opacity scale for each line away from the selected element
		draw_text_colour(lol_text_horizontal, _height, room_get_name(lol_list[_i]), c_grey, c_grey, c_grey, c_grey, _scaling);
	}
}