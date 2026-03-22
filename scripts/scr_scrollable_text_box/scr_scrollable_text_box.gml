/// @description displays a scrollable list of text in a bounded box
/// @arg _array input array to be drawn
/// @arg _selected which element of the array is currently selected
/// @arg _x1 the left boundary in which to draw
/// @arg _y1 the top boundary in which to draw
/// @arg _x2 the right boundary in which to draw
/// @arg _y2 the bottom boundary in which to draw
/// @arg _h_align (optional) the horizontal alignment of the text, left or right
/// @arg _font (optional) the font to use for drawn text
/// @arg _color (optional) the color of the drawn text
/// @arg _opacity (optional) the opacity of the drawn text between 0 and1
function scr_scrollable_text_box(_array, _selected, _x1, _y1, _x2, _y2, _h_align = fa_left, _font = global.menu_font, _colour = c_white, _opacity = 1)
{
	// Check if the static variables have been created and initialize if not
	static _scrollable_surface = -1;
	static _short_delay = time_source_create(time_source_game, 2, time_source_units_frames, scr_scrollable_text_box);
	static _view_target = 0;
	static _view_top = 0;
	
	// Free the surface to free the memory if the function is called without arguments
	if((_array ?? global.over_9000) == global.over_9000)
	{
		surface_free(_scrollable_surface);
		_view_top = 0;
		exit
	}
	
	// Establish parameters
	scr_draw_set_text(_colour, _font, _h_align, fa_top);
	var _view_width = _x2 - _x1;
	var _view_height = _y2 - _y1;
	var _total_height = array_length(_array) * font_get_size(_font);
	if (_view_height > _total_height) {_view_height = _total_height - 3;};
	var _scrollbar_space = 5;
	var _text_alignment = string_width("> ");
	if (_h_align == fa_right) {_text_alignment = _view_width - string_width(" < ") - _scrollbar_space;};
	
	// Create surface if the surface does not currently exist
	if (!surface_exists(_scrollable_surface))
	{
		_scrollable_surface = surface_create(_view_width, _total_height);
	}
	
	// Target and clear the surface
	surface_set_target(_scrollable_surface);
	draw_clear_alpha(c_black, 0);
	
	// Draw the array of elements
	for (var _i = 0; _i < array_length(_array); _i++)
	{
		// Adjustments for the selected element
		if (_i == _selected)
		{
			// Draw " <" to the right of the element if h_align is right
			if (_h_align == fa_right)
			{
				draw_text_colour(_view_width - _scrollbar_space, _i * font_get_size(_font), _array[_i] + " < ", c_white, c_white, c_white, c_white, 1);
			}
			else
			// Draw "> " to the left of the element otherwise
			{
				draw_text_colour(0, _i * font_get_size(_font), "> " + _array[_i], c_white, c_white, c_white, c_white, 1);
			}
		}
		else
		{
			draw_text(_text_alignment, _i * font_get_size(_font), _array[_i]);
		}
	}
	
	// Shift the view of the surface down when the cursor gets one from the bottom
	if ((_selected * font_get_size(_font)) > (_view_top + _view_height - 2 * font_get_size(_font)))
	{
		_view_target = (2 + _selected) * font_get_size(_font) - _view_height - 3;
	}
	
	// Shift the view of the surface up when the cursor gets one from the top
	if (((_selected - 1) * font_get_size(_font)) < _view_top)
	{
		_view_target = (_selected - 1) * font_get_size(_font);
	}
	
	// Set bounds and slide the view towards the target position
	_view_target = clamp(_view_target, 0, _total_height - _view_height - 3);
	_view_top += (_view_target - _view_top) / 5;
	
	// Stop drawing to the surface and draw part of it to the screen
	surface_reset_target();
	draw_surface_part_ext(_scrollable_surface, 0, _view_top, _view_width, _view_height + 1, _x1, _y1, 1, 1, c_white, _opacity);
	
	// Scrollbar math
	var _scrollbar_spine_x = _x2 - ceil(_scrollbar_space / 2);
	var _scrollbar_spine_top = _y1+ ceil(_scrollbar_space / 2);
	var _scrollbar_spine_height = _y2 - _y1 - ceil(_scrollbar_space * 1.5) - 1;
	var _scrollbar_height = (_view_height / _total_height) * _scrollbar_spine_height;
	var _scrollbar_top = _scrollbar_spine_top + (_scrollbar_spine_height - _scrollbar_height) * _view_top / (_total_height - _view_height - 3);
	
	// Draw scrollbar
	draw_rectangle(_scrollbar_spine_x, _scrollbar_spine_top, _scrollbar_spine_x, _scrollbar_spine_top + _scrollbar_spine_height, false);
	draw_set_colour(c_white);
	draw_rectangle(_scrollbar_spine_x - 1, _scrollbar_top, _scrollbar_spine_x + 1, _scrollbar_top + _scrollbar_height, false);
	
	// _short_delay is a 2 frame delay to call this script without arguments to free the surface when no longer needed
	time_source_reset(_short_delay);
	time_source_start(_short_delay);
}