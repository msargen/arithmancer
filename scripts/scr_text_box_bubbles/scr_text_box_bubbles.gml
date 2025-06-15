// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_text_box_bubbles(_equation_solution, _x_coordinate, _y_coordinate)
{
	// string_width() doesn't adjust for different fonts, so I'm using the number of characters times the width of my monospace font
	// the 2 is extra padding for the sides so that the bubble looks better around the text
	//_text_width = string_length(_text) * 8 + 2;
	//// range of 0 to 1, 0 is invisible
	//_opacity = 0.8;
	
	//ToDo Create two object bubbles
	var _equation_answer_offset = floor(random_range(1, 5.99));
	var _equation_answer_offset_sign = 0;
	do
	{
		_equation_answer_offset_sign = sign(random_range(-1,1));
	}
	until(_equation_answer_offset_sign != 0);
	
	with (instance_create_layer(_x_coordinate + 20, _y_coordinate - sprite_get_height(spr_even_marker), layer, obj_bubble))
	{
		bubble_val = _equation_solution;
		
	}
	
	with (instance_create_layer(_x_coordinate - 20, _y_coordinate - sprite_get_height(spr_even_marker), layer, obj_bubble))
	{
		
		//Set the Bubble Fields
		
		bubble_val = _equation_solution + _equation_answer_offset * _equation_answer_offset_sign;
		
	}
	
	
	// draw the box
	//draw_sprite_ext(spr_text_box_side, 0, _text_x_center - (_text_width / 2), _text_y_center, 1, 1, 0, c_white, _opacity);
	//draw_sprite_ext(spr_text_box_middle, 0, _text_x_center, _text_y_center, _text_width / 2, 1, 0, c_white, _opacity);
	//draw_sprite_ext(spr_text_box_side, 0,  _text_x_center + (_text_width / 2), _text_y_center, -1, 1, 0, c_white, _opacity);
	
	//// draw text
	//scr_draw_set_text(c_white, global.monotype_font, fa_center, fa_middle);
	//draw_text(_text_x_center, _text_y_center, _text);
}