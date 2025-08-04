/// @description  stuff
function scr_set_addition_function(_equation_difficulty = 0)
{
	var _contains_equation = array_contains(global.equation_difficulty, EQUATION_TYPE.ADDITION);
	var _should_add = false;
	
	switch (_equation_difficulty)
	{
		case EQUATION_DIFFICULTY.OFF:
			if (_contains_equation)
			{
				array_delete(global.equation_difficulty, array_get_index(global.equation_difficulty, EQUATION_TYPE.ADDITION), 1);
			}
			break;

		case EQUATION_DIFFICULTY.EASY:
			global.addition_difficulty = function()
			{
				// Addition
				var _equation_x = floor(random_range(1, 50.99));
				var _equation_y = floor(random_range(1, 50.99));
				var _equation_answer = _equation_x + _equation_y;
				var _equation_text = string(_equation_x) + "+" + string(_equation_y) + "=e?";
		
				return [_equation_answer, _equation_text];
			}
			_should_add = true;
			break;
		
		case EQUATION_DIFFICULTY.MEDUIM:

			global.addition_difficulty = function()
			{
				// Addition
				var _equation_x = floor(random_range(1, 50.99));
				var _equation_y = floor(random_range(1, 50.99));
				var _equation_answer = _equation_x + _equation_y;
				var _equation_text = string(_equation_x) + "+" + string(_equation_y) + "=m?";
		
				return [_equation_answer, _equation_text];
			}
			_should_add = true;
			break;
			
		case EQUATION_DIFFICULTY.HARD:
			global.addition_difficulty = function()
			{
				// Addition
				var _equation_x = floor(random_range(1, 50.99));
				var _equation_y = floor(random_range(1, 50.99));
				var _equation_answer = _equation_x + _equation_y;
				var _equation_text = string(_equation_x) + "+" + string(_equation_y) + "=h?";
		
				return [_equation_answer, _equation_text];
			}
			_should_add = true;
			break;
	}
	
	if(!_contains_equation && _should_add)
	{
		array_push(global.equation_difficulty, EQUATION_TYPE.ADDITION);
	}
	
}

/// @description  stuff
function scr_set_subtraction_function(_equation_difficulty = 0)
{
	var _contains_equation = array_contains(global.equation_difficulty, EQUATION_TYPE.SUBTRACTION);
	var _should_add = false;
	
	switch (_equation_difficulty)
	{
		case EQUATION_DIFFICULTY.OFF:
			if (_contains_equation)
			{
				array_delete(global.equation_difficulty, array_get_index(global.equation_difficulty, EQUATION_TYPE.SUBTRACTION), 1);
			}
			break;

		case EQUATION_DIFFICULTY.EASY:
			global.subtraction_difficulty = function()
			{
				// Subtraction
				var _equation_text = "";
				var _equation_answer = 0;
	
				var _equation_x = floor(random_range(1, 100.99));
				var _equation_y = floor(random_range(1, 100.99));
				if (_equation_x >= _equation_y)
				{
					_equation_text = string(_equation_x) + "-" + string(_equation_y) + "=e?";
					_equation_answer = _equation_x - _equation_y;
				}
				else
				{
					_equation_text = string(_equation_y) + "-" + string(_equation_x) + "=e?";
					_equation_answer = _equation_y - _equation_x;
				}
	
				return [_equation_answer, _equation_text];
			}
			_should_add = true;
			break;
		
		case EQUATION_DIFFICULTY.MEDUIM:
			global.subtraction_difficulty = function()
			{
				// Subtraction
				var _equation_text = "";
				var _equation_answer = 0;
	
				var _equation_x = floor(random_range(1, 100.99));
				var _equation_y = floor(random_range(1, 100.99));
				if (_equation_x >= _equation_y)
				{
					_equation_text = string(_equation_x) + "-" + string(_equation_y) + "=m?";
					_equation_answer = _equation_x - _equation_y;
				}
				else
				{
					_equation_text = string(_equation_y) + "-" + string(_equation_x) + "=m?";
					_equation_answer = _equation_y - _equation_x;
				}
	
				return [_equation_answer, _equation_text];
			}
			_should_add = true;
			break;
			
		case EQUATION_DIFFICULTY.HARD:
			global.subtraction_difficulty = function()
			{
				// Subtraction
				var _equation_text = "";
				var _equation_answer = 0;
	
				var _equation_x = floor(random_range(1, 100.99));
				var _equation_y = floor(random_range(1, 100.99));
				if (_equation_x >= _equation_y)
				{
					_equation_text = string(_equation_x) + "-" + string(_equation_y) + "=h?";
					_equation_answer = _equation_x - _equation_y;
				}
				else
				{
					_equation_text = string(_equation_y) + "-" + string(_equation_x) + "=h?";
					_equation_answer = _equation_y - _equation_x;
				}
	
				return [_equation_answer, _equation_text];
			}
			_should_add = true;
			break;
	}
	
	if(!_contains_equation && _should_add)
	{
		array_push(global.equation_difficulty, EQUATION_TYPE.SUBTRACTION);
	}
}

/// @description  stuff
function scr_set_multiplication_function(_equation_difficulty = 0)
{
	var _contains_equation = array_contains(global.equation_difficulty, EQUATION_TYPE.MULTIPLICATION);
	var _should_add = false;
	
	switch (_equation_difficulty)
	{
		case EQUATION_DIFFICULTY.OFF:
			if (_contains_equation)
			{
				array_delete(global.equation_difficulty, array_get_index(global.equation_difficulty, EQUATION_TYPE.MULTIPLICATION), 1);
			}
			break;

		case EQUATION_DIFFICULTY.EASY:
			global.multiplication_difficulty = function()
			{
				// Multiplication
				var _equation_x = floor(random_range(1, 12.99));
				var _equation_y = floor(random_range(1, 12.99));
				var _equation_answer = _equation_x * _equation_y;
				var _equation_text = string(_equation_x) + "X" + string(_equation_y) + "=e?";
	
				return [_equation_answer, _equation_text];
			}
			_should_add = true;
			break;
		
		case EQUATION_DIFFICULTY.MEDUIM:
			global.multiplication_difficulty = function()
			{
				// Multiplication
				var _equation_x = floor(random_range(1, 12.99));
				var _equation_y = floor(random_range(1, 12.99));
				var _equation_answer = _equation_x * _equation_y;
				var _equation_text = string(_equation_x) + "X" + string(_equation_y) + "=m?";
	
				return [_equation_answer, _equation_text];
			}
			_should_add = true;
			break;
			
		case EQUATION_DIFFICULTY.HARD:
			global.multiplication_difficulty = function()
			{
				// Multiplication
				var _equation_x = floor(random_range(1, 12.99));
				var _equation_y = floor(random_range(1, 12.99));
				var _equation_answer = _equation_x * _equation_y;
				var _equation_text = string(_equation_x) + "X" + string(_equation_y) + "=h?";
	
				return [_equation_answer, _equation_text];
			}
			_should_add = true;
			break;
	}
	
	if(!_contains_equation && _should_add)
	{
		array_push(global.equation_difficulty, EQUATION_TYPE.MULTIPLICATION);
	}
}

/// @description  stuff
function scr_set_division_function(_equation_difficulty = 0)
{
	var _contains_equation = array_contains(global.equation_difficulty, EQUATION_TYPE.DIVISION);
	var _should_add = false;
	
	switch (_equation_difficulty)
	{
		case EQUATION_DIFFICULTY.OFF:
			if (_contains_equation)
			{
				array_delete(global.equation_difficulty, array_get_index(global.equation_difficulty, EQUATION_TYPE.DIVISION), 1);
			}
			break;
			
		case EQUATION_DIFFICULTY.EASY:
			global.division_difficulty = function()
			{
				// Division
				var _equation_answer = floor(random_range(1, 12.99));
				var _equation_y = floor(random_range(1, 12.99));
				var _equation_x = _equation_answer * _equation_y;
				var _equation_text = string(_equation_x) + "/" + string(_equation_y) + "=e?";
	
				return [_equation_answer, _equation_text];
			}
			_should_add = true;
			break;
		
		case EQUATION_DIFFICULTY.MEDUIM:
			global.division_difficulty = function()
			{
				// Division
				var _equation_answer = floor(random_range(1, 12.99));
				var _equation_y = floor(random_range(1, 12.99));
				var _equation_x = _equation_answer * _equation_y;
				var _equation_text = string(_equation_x) + "/" + string(_equation_y) + "=m?";
	
				return [_equation_answer, _equation_text];
			}
			_should_add = true;
			break;
			
		case EQUATION_DIFFICULTY.HARD:
			global.division_difficulty = function()
			{
				// Division
				var _equation_answer = floor(random_range(1, 12.99));
				var _equation_y = floor(random_range(1, 12.99));
				var _equation_x = _equation_answer * _equation_y;
				var _equation_text = string(_equation_x) + "/" + string(_equation_y) + "=h?";
	
				return [_equation_answer, _equation_text];
			}
			_should_add = true;
			break;
	}
	
	if(!_contains_equation && _should_add)
	{
		array_push(global.equation_difficulty, EQUATION_TYPE.DIVISION);
	}
}

function scr_get_default_equation()
{
	var _equation_answer = 2;
	var _equation_text = string(1) + "+" + string(1) + "=d?";
		
	return [_equation_answer, _equation_text];
}
