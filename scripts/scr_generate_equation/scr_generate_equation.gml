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