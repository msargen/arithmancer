/// @description Function for ensuring all the needed text features are set before drawing
/// @arg _colour The color of the text
/// @arg _font The text font
/// @arg _halign The horizontal axis alignment for the text
/// @arg _valign The vertical axis alignment for the text
function scr_draw_set_text(_colour, _font, _halign, _valign) 
{

	// Allows one line setup of major text drawing vars.

	draw_set_colour(_colour);
	draw_set_font(_font);
	draw_set_halign(_halign);
	draw_set_valign(_valign);
}

/// @description Draws the passed text with an outline
/// @arg _location_x The x location to draw the text
/// @arg _locaction_y The y location to draw the text
/// @arg _text_color The color of the text
/// @arg _outline_color The color of the text outine
/// @arg _offset The thickness of the outline
/// @arg _text The text to draw
function scr_draw_text_outline(_location_x, _locaction_y, _text_color, _outline_color, _offset, _text)
{
	draw_set_color(_outline_color);
	draw_text(_location_x - _offset, _locaction_y, _text);
	draw_text(_location_x + _offset, _locaction_y, _text);
	draw_text(_location_x, _locaction_y + _offset, _text);
	draw_text(_location_x, _locaction_y - _offset, _text);
	draw_set_color(_text_color);
	draw_text(_location_x, _locaction_y, _text);
}

/// @description Draws the passed text with a shadow to the right and down
/// @arg _location_x The x location to draw the text
/// @arg _locaction_y The y location to draw the text
/// @arg _text_color The color of the text
/// @arg _shadow_color The color of the text shadow
/// @arg _offset The thickness of the outline
/// @arg _text The text to draw
/// @arg _size_scale The size scale for the text
function scr_draw_text_shadow(_location_x, _locaction_y, _text_color, _shadow_color, _offset, _text, _size_scale)
{
	draw_set_color(_shadow_color);
	draw_text_transformed(_location_x + _offset, _locaction_y + _offset, _text, _size_scale, _size_scale, 0);
	draw_set_color(_text_color);
	draw_text_transformed(_location_x, _locaction_y, _text, _size_scale, _size_scale, 0);
}