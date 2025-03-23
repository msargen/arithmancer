/// @description displays text in a box with rounded corners and a small arrow towards target position
/// @arg _text the text string to be displayed
/// @arg _direction the side of the object the box will be on (UP, DOWN, LEFT, or RIGHT)
/// @arg _x_coordinate the x coordinate the box will point at
/// @arg _y_coordinate the y coordinate the box will point at
/// @arg {real} _offset (optional) the distance in pixels from the target coordinate to the arrow tip
function scr_text_box(_text, _direction, _x_coordinate, _y_coordinate, _offset=0)
{
	// string_width() doesn't adjust for different fonts, so I'm using the number of characters times the width of my monospace font
	// the 2 is extra padding for the sides so that the bubble looks better around the text
	_text_width = string_length(_text) * 8 + 2;
	// range of 0 to 1, 0 is invisible
	_opacity = 0.8;
	
	switch (_direction)
	{
		// box is above target
		case ORIENTATION.UP:
			// draw the arrow marker
			draw_sprite_ext(spr_even_marker, 0, _x_coordinate, _y_coordinate - _offset, 1, 1, _direction, c_white, _opacity);
			// get center coordinates for the box and text
			_text_x_center = _x_coordinate;
			_text_y_center = _y_coordinate - _offset - sprite_get_height(spr_even_marker) - (sprite_get_height(spr_text_box_middle) / 2);
		break;
		
		// box is below target
		case ORIENTATION.DOWN:
			// draw the arrow marker
			draw_sprite_ext(spr_even_marker, 0, _x_coordinate, _y_coordinate + _offset, 1, 1, _direction, c_white, _opacity);
			// get center coordinates for the box and text
			_text_x_center = _x_coordinate;
			_text_y_center = _y_coordinate + _offset + sprite_get_height(spr_even_marker) + (sprite_get_height(spr_text_box_middle) / 2);
		break;
		
		// box is left of target
		case ORIENTATION.LEFT:
			// draw the arrow marker
			draw_sprite_ext(spr_even_marker, 0, _x_coordinate - _offset, _y_coordinate, 1, 1, _direction, c_white, _opacity);
			// get center coordinates for the box and text
			_text_x_center = _x_coordinate - _offset - sprite_get_height(spr_even_marker) - sprite_get_width(spr_text_box_side) - (_text_width / 2);
			_text_y_center = _y_coordinate;
		break;
		
		// box is right of target
		case ORIENTATION.RIGHT:
			// draw the arrow marker
			draw_sprite_ext(spr_even_marker, 0, _x_coordinate + _offset, _y_coordinate, 1, 1, _direction, c_white, _opacity);
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