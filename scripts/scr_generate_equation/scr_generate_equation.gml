// Script for generating an equation

/// @description  Generates an equation (solution, x, y). The passed argument will determine the type of equation
/// @arg {Real} _equation_type Must be an integer between 0-4 (random, addition, subtraction, multiplication, division)
function scr_generate_equation(_equation_type = 0){
	if (_equation_type == 0) 
	{
		_equation_type = floor(random_range(1, 4.99));
	}
	
	var _equation_answer = 0;
	var _equation_x = 0;
	var _equation_y = 0;
	var _equation_text = "";
	
	if (_equation_type == 1)
	{
		// Addition
		_equation_x = floor(random_range(1, 50.99));
		_equation_y = floor(random_range(1, 50.99));
		_equation_answer = _equation_x + _equation_y;
		_equation_text = string(_equation_x) + "+" + string(_equation_y) + "=?";
	}
	else if (_equation_type == 2)
	{
		// Subtraction
		_equation_x = floor(random_range(1, 100.99));
		_equation_y = floor(random_range(1, 100.99));
		if (_equation_x >= _equation_y)
		{
			_equation_text = string(_equation_x) + "-" + string(_equation_y) + "=?";
			_equation_answer = _equation_x - _equation_y;
		}
		else
		{
			_equation_text = string(_equation_y) + "-" + string(_equation_x) + "=?";
			_equation_answer = _equation_y - _equation_x;
		}
	}
	else if (_equation_type == 3)
	{
		// Multiplication
		_equation_x = floor(random_range(1, 12.99));
		_equation_y = floor(random_range(1, 12.99));
		_equation_answer = _equation_x * _equation_y;
		_equation_text = string(_equation_x) + "X" + string(_equation_y) + "=?";
	}
	else if (_equation_type == 4)
	{
		// Division
		_equation_answer = floor(random_range(1, 12.99));
		_equation_y = floor(random_range(1, 12.99));
		_equation_x = _equation_answer * _equation_y;
		_equation_text = string(_equation_x) + "/" + string(_equation_y) + "=?";
	}
	
	return [_equation_answer, _equation_text];

}

/// @description  Generates an equation (solution, equation text).
/// @return  Array of length two. First index is the {real} solution answer, second index is the {string} equation text
function scr_generate_equation2(){
	var _equation_type = array_length(global.equation_difficulty);
	
	//show_debug_message("et1: " + string(_equation_type));
	
	if (_equation_type != 0) 
	{
		_equation_type = global.equation_difficulty[floor(random_range(0, _equation_type - 0.01))];
	}
	
	//show_debug_message("et1: " + string(_equation_type));
	
	var _equation;
	
	switch (_equation_type)
	{

		case EQUATION_TYPE.ADDITION:
			// Addition
			_equation = global.addition_difficulty();
			//show_debug_message("addition solution [" + string(_equation[0]) + "] text [" + string(_equation[1] + "]"));
			break;
			
		case EQUATION_TYPE.SUBTRACTION:
			// Addition
			_equation = global.subtraction_difficulty();
			//show_debug_message("subtraction solution [" + string(_equation[0]) + "] text [" + string(_equation[1] + "]"));
			break;
			
		case EQUATION_TYPE.MULTIPLICATION:
			// Addition
			_equation = global.multiplication_difficulty();
			//show_debug_message("multiplication solution [" + string(_equation[0]) + "] text [" + string(_equation[1] + "]"));
			break;
			
		case EQUATION_TYPE.DIVISION:
			// Addition
			_equation = global.division_difficulty();
			//show_debug_message("division solution [" + string(_equation[0]) + "] text [" + string(_equation[1] + "]"));
			break;
			
		case 0:
			// Addition
			_equation = scr_get_default_equation();
			//show_debug_message("default solution [" + string(_equation[0]) + "] text [" + string(_equation[1] + "]"));
			break;
	}
	
	//show_debug_message("return solution [" + string(_equation[0]) + "] text [" + string(_equation[1] + "]"));
	return [_equation[0], _equation[1]];

}