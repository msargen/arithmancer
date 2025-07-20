/// @description Create two answer bubbles one correct and one incorrect
/// @arg _equation_solution Correct answer for the equation
/// @arg _x_coordinate the x coordinate of the activated flag
/// @arg _y_coordinate the y coordinate of the activated flag
function scr_text_box_bubbles(_equation_solution, _x_coordinate, _y_coordinate)
{

	//Generate a random number 1-5 and assign it a positive or negative value not equal to 0
	var _equation_answer_offset = floor(random_range(1, 5.99));
	var _equation_answer_offset_sign = choose(-1, 1);
	
	//Create variables to randomize which bubble gets the correct answer
	var _bubble_val_one = 0;
	var _bubble_val_two = 0;
	var _coinflip = choose(true, false);
	var _incorrect_answer = _equation_solution + _equation_answer_offset * _equation_answer_offset_sign;
	
	if(_incorrect_answer < 0)
	{
		 _incorrect_answer = _equation_solution - _equation_answer_offset * _equation_answer_offset_sign;
	}
	
	if(_coinflip == true)
	{
		_bubble_val_one = _equation_solution;
		_bubble_val_two = _incorrect_answer;
	}
	else
	{
		_bubble_val_one = _incorrect_answer;
		_bubble_val_two = _equation_solution;
	}

	//Create the right bubble
	with (instance_create_layer(_x_coordinate + 20, _y_coordinate - sprite_get_height(spr_even_marker), layer, obj_bubble))
	{
		bubble_val = _bubble_val_one;	
	}
	//Create the left bubble
	with (instance_create_layer(_x_coordinate - 20, _y_coordinate - sprite_get_height(spr_even_marker), layer, obj_bubble))
	{		
		bubble_val = _bubble_val_two;
	}
}