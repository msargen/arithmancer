/// @description displays text in a box with rounded corners and a small arrow towards target position
/// @arg _text the text string to be displayed
/// @arg _direction the side of the object the box will be on (UP, DOWN, LEFT, or RIGHT)
/// @arg _x_coordinate the x coordinate the box will point at
/// @arg _y_coordinate the y coordinate the box will point at
/// @arg {real} _offset (optional) the distance in pixels from the target coordinate to the arrow tip
/// @arg {bool} _arrow (optional) whether the arrow is displayed or not
function scr_equation_text_box(_text, _direction, _x_coordinate, _y_coordinate, _offset=0, _arrow=true)
{
	draw_set_font(global.monotype_font);
	// + 2 for padding near edges of the box
	var _text_width = string_width(_text) + 2;
	// range of 0 to 1, 0 is invisible
	var _opacity = 0.8;
	
	var _text_x_center = 0;
	var _text_y_center = 0;
	
	switch (_direction)
	{
		// box is above target
		case ORIENTATION.UP:
			// draw the arrow marker
			if(_arrow){draw_sprite_ext(spr_even_marker, 0, _x_coordinate, _y_coordinate - _offset, 1, 1, _direction, c_white, _opacity);}
			// get center coordinates for the box and text
			_text_x_center = _x_coordinate;
			_text_y_center = _y_coordinate - _offset - sprite_get_height(spr_even_marker) - (sprite_get_height(spr_text_box_middle) / 2);
		break;
		
		// box is below target
		case ORIENTATION.DOWN:
			// draw the arrow marker
			if(_arrow){draw_sprite_ext(spr_even_marker, 0, _x_coordinate, _y_coordinate + _offset, 1, 1, _direction, c_white, _opacity);}
			// get center coordinates for the box and text
			_text_x_center = _x_coordinate;
			_text_y_center = _y_coordinate + _offset + sprite_get_height(spr_even_marker) + (sprite_get_height(spr_text_box_middle) / 2);
		break;
		
		// box is left of target
		case ORIENTATION.LEFT:
			// draw the arrow marker
			if(_arrow){draw_sprite_ext(spr_even_marker, 0, _x_coordinate - _offset, _y_coordinate, 1, 1, _direction, c_white, _opacity);}
			// get center coordinates for the box and text
			_text_x_center = _x_coordinate - _offset - sprite_get_height(spr_even_marker) - sprite_get_width(spr_text_box_side) - (_text_width / 2);
			_text_y_center = _y_coordinate;
		break;
		
		// box is right of target
		case ORIENTATION.RIGHT:
			// draw the arrow marker
			if(_arrow){draw_sprite_ext(spr_even_marker, 0, _x_coordinate + _offset, _y_coordinate, 1, 1, _direction, c_white, _opacity);}
			// get center coordinates for the box and text
			_text_x_center = _x_coordinate + _offset + sprite_get_height(spr_even_marker) + sprite_get_width(spr_text_box_side) + (_text_width / 2);
			_text_y_center = _y_coordinate;
		break;
	}
	
	// draw the box
	draw_sprite_ext(spr_text_box_side, 0, _text_x_center - (_text_width / 2), _text_y_center, 1, 1, 0, c_white, _opacity);
	draw_sprite_ext(spr_text_box_middle, 0, _text_x_center, _text_y_center, _text_width / 2, 1, 0, c_white, _opacity);
	draw_sprite_ext(spr_text_box_side, 0,  _text_x_center + (_text_width / 2), _text_y_center, -1, 1, 0, c_white, _opacity);
	
	// draw text
	scr_draw_set_text(c_white, global.monotype_font, fa_center, fa_middle);
	draw_text(_text_x_center, _text_y_center, _text); 
}

/// @description Displays simple help text in a box with rounded corners and a small arrow towards target position
/// @arg _sym_text Array of text and symbols to display. Each index must be either a string or a sprite
/// @arg _x_coordinate the x coordinate the box will point at
/// @arg _y_coordinate the y coordinate the box will point at
/// @arg {real} _offset (optional) the distance in pixels from the target coordinate to the arrow tip
/// @arg {bool} _arrow (optional) whether the arrow is displayed or not
function scr_help_text_box(_sym_text, _x_coordinate, _y_coordinate, _offset=0, _arrow=true)
{
	draw_set_font(global.menu_font);
	
	// range of 0 to 1, 0 is invisible
	var _opacity = 0.8;
	// draw the arrow marker
	if(_arrow){draw_sprite_ext(spr_even_marker, 0, _x_coordinate, _y_coordinate - _offset, 1, 1, 0, c_white, _opacity);}
	// get center coordinates for the box and text
	var _box_y_center = _y_coordinate - _offset - sprite_get_height(spr_even_marker) - (sprite_get_height(spr_text_box_middle) / 2);
	
	// Need to find to total length of the passed text and symbols to be able to draw each index in the correct location
	var _total_width = 0;
	for (var _x = 0; _x < array_length(_sym_text); ++_x)
	{
		if (is_string(_sym_text[_x]))
		{
			_total_width += string_width(_sym_text[_x]);
		}
		else
		{
			_total_width += sprite_get_width(_sym_text[_x]);
		}
	}
	
	// draw the box (+ 2 for text box padding)
	draw_sprite_ext(spr_text_box_side, 0, _x_coordinate - ceil((_total_width + 2) / 2), _box_y_center, 1, 1, 0, c_white, _opacity);
	draw_sprite_ext(spr_text_box_middle, 0, _x_coordinate, _box_y_center, ceil((_total_width + 2) / 2), 1, 0, c_white, _opacity);
	draw_sprite_ext(spr_text_box_side, 0,  _x_coordinate + ceil((_total_width + 2) / 2), _box_y_center, -1, 1, 0, c_white, _opacity);
	
	// draw text and symbol
	scr_draw_set_text(c_white, global.menu_font, fa_center, fa_middle);
	var _previous_width = 0;
	var _new_width = 0;
	
	// The draw is odd because we are drawing from the middle and incrementally
	// Shift to the left of the text box, then shift to the right of everything that has been previously drawn, 
	// then shift to the right halway for the new thing that will be drawn
	for (var _x = 0; _x < array_length(_sym_text); ++_x)
	{
		if (is_string(_sym_text[_x]))
		{
			_new_width = string_width(_sym_text[_x]);
			draw_text(_x_coordinate - ceil(_total_width / 2) + _previous_width + ceil(_new_width / 2), _box_y_center, _sym_text[_x]);
			_previous_width += _new_width;
		}
		else
		{
			_new_width = sprite_get_width(_sym_text[_x]);
			draw_sprite(_sym_text[_x], 0, _x_coordinate - ceil(_total_width / 2) + _previous_width + ceil(_new_width / 2), _box_y_center);
			_previous_width += _new_width;
		}
	}
	
}
