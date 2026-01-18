// Script for generating an equation

/// @description  Generates an equation (solution, equation text) dependent on the difficulty for each equation type
/// @return  Array of length two. First index is the {real} solution answer, second index is the {string} equation text
function scr_generate_equation(){
	// Gets the total number of equation types not set to "OFF"
	var _active_equations = array_length(global.active_equation_types);
	
	var _equation_type = 0;
	
	// If at least one of the equation types is not set to "OFF", randomly choose between the active
	// equation types
	if (_active_equations != 0) 
	{
		// This is why global.active_equation_types is added to/deleted from instead of having an array
		// of length four with each index indicating if that equation type is active. Selecting one of those
		// active equation types would be much more difficult if the array was always the same length
		// with a bit true/false indicator for each equation.
		_equation_type = global.active_equation_types[floor(random_range(0, _active_equations - 0.01))];
	}
	
	
	var _equation;
	
	switch (_equation_type)
	{

		case EQUATION_TYPE.ADDITION:
			_equation = global.addition_difficulty();
			break;
			
		case EQUATION_TYPE.SUBTRACTION:
			_equation = global.subtraction_difficulty();
			break;
			
		case EQUATION_TYPE.MULTIPLICATION:
			_equation = global.multiplication_difficulty();
			break;
			
		case EQUATION_TYPE.DIVISION:
			_equation = global.division_difficulty();
			break;
			
		case EQUATION_TYPE.SIMPLE:
			// Always returns 1 + 1 = 2
			_equation = scr_get_default_equation();
			break;
	}
	
	return _equation;

}

/// @description  Generates a simple equation for tutorial purposes (solution, x, y). The passed argument will determine the type of equation
/// @arg {Real} _equation_type Must be an integer between 0-4 (random, addition, subtraction, multiplication, division)
/// @return  Array of length two. First index is the {real} solution answer, second index is the {string} equation text
function scr_generate_tutorial_equation(_equation_type = 0){
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