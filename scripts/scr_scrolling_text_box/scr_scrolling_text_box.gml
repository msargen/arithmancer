/// @description displays a scrollable list of text in a bounded box
/// @arg _array input array to be drawn
/// @arg _selected which element of the array is currently selected
/// @arg _x1 the left boundary in which to draw
/// @arg _y1 the top boundary in which to draw
/// @arg _x2 the right boundary in which to draw
/// @arg _y2 the bottom boundary in which to draw
/// @arg _h_align (optional) the horizontal alignment of the text
/// @arg _v_align (optional) the vertical alignment of the text
/// @arg _font (optional) the font to use for drawn text
/// @arg _color (optional) the color of the drawn text
/// @arg _opacity (optional) the opacity of the drawn text between 0 and1
function scr_scrolling_text_box(_array, _selected, _x1, _y1, _x2, _y2, _h_align = fa_left, _v_align = fa_top, _font = global.menu_font, _color = c_white, _opacity = 1)
{
	/*
	if (!surface_exists(surf)) {
   surf = surface_create(actual_width,actual_height); // Create the surface if it doesn't exist
	}
	surface_set_target(surf);
	surface_reset_target();
	draw_surface_part()
	*/
}