/// @description Sets the desired function for addition problems based off of the passed difficulty.
/// @arg {Real} _equation_difficulty Must be an enum of type EQUATION_DIFFICULTY. Options are: off, easy, medium, hard
function scr_set_addition_difficulty(_equation_difficulty = EQUATION_DIFFICULTY.OFF)
{
	// Indicates if the addition equation type is active
	var _contains_equation = array_contains(global.active_equation_types, EQUATION_TYPE.ADDITION);
	
	// Indicates if the addition equation type should be added to the list of active equations
	var _should_add = false;
	
	switch (_equation_difficulty)
	{
		case EQUATION_DIFFICULTY.OFF:
			// Remove the addition equation type from the list of active equations if it is currently active
			if (_contains_equation)
			{
				array_delete(global.active_equation_types, array_get_index(global.active_equation_types, EQUATION_TYPE.ADDITION), 1);
			}
			break;

		case EQUATION_DIFFICULTY.EASY:
			global.addition_difficulty = function()
			{
				// TODO: Easy addition equation
				var _equation_x = floor(random_range(1, 50.99));
				var _equation_y = floor(random_range(1, 50.99));
				var _equation_answer = _equation_x + _equation_y;
				var _equation_text = string(_equation_x) + "+" + string(_equation_y) + "=?";
		
				return [_equation_answer, _equation_text];
			}
			_should_add = true;
			break;
		
		case EQUATION_DIFFICULTY.MEDUIM:

			global.addition_difficulty = function()
			{
				// TODO: Medium addition equation
				var _equation_x = floor(random_range(1, 50.99));
				var _equation_y = floor(random_range(1, 50.99));
				var _equation_answer = _equation_x + _equation_y;
				var _equation_text = string(_equation_x) + "+" + string(_equation_y) + "=?";
		
				return [_equation_answer, _equation_text];
			}
			_should_add = true;
			break;
			
		case EQUATION_DIFFICULTY.HARD:
			global.addition_difficulty = function()
			{
				// TODO: Hard addition equation
				var _equation_x = floor(random_range(1, 50.99));
				var _equation_y = floor(random_range(1, 50.99));
				var _equation_answer = _equation_x + _equation_y;
				var _equation_text = string(_equation_x) + "+" + string(_equation_y) + "=?";
		
				return [_equation_answer, _equation_text];
			}
			_should_add = true;
			break;
	}
	
	// Add the addition equation type to the list of active equations
	if(!_contains_equation && _should_add)
	{
		array_push(global.active_equation_types, EQUATION_TYPE.ADDITION);
	}
	
}

/// @description Sets the desired function for subtraction problems based off of the passed difficulty.
/// @arg {Real} _equation_difficulty Must be an enum of type EQUATION_DIFFICULTY. Options are: off, easy, medium, hard
function scr_set_subtraction_difficulty(_equation_difficulty = EQUATION_DIFFICULTY.OFF)
{
	// Indicates if the subtraction equation type is active
	var _contains_equation = array_contains(global.active_equation_types, EQUATION_TYPE.SUBTRACTION);
	
	// Indicates if the subtraction equation type should be added to the list of active equations
	var _should_add = false;
	
	switch (_equation_difficulty)
	{
		case EQUATION_DIFFICULTY.OFF:
			// Remove the subtraction equation type from the list of active equations if it is currently active
			if (_contains_equation)
			{
				array_delete(global.active_equation_types, array_get_index(global.active_equation_types, EQUATION_TYPE.SUBTRACTION), 1);
			}
			break;

		case EQUATION_DIFFICULTY.EASY:
			global.subtraction_difficulty = function()
			{
				// TODO: Easy subtraction equation
				var _equation_text = "";
				var _equation_answer = 0;
	
				var _equation_x = floor(random_range(1, 100.99));
				var _equation_y = floor(random_range(1, 100.99));
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
	
				return [_equation_answer, _equation_text];
			}
			_should_add = true;
			break;
		
		case EQUATION_DIFFICULTY.MEDUIM:
			global.subtraction_difficulty = function()
			{
				// TODO: Medium subtraction equation
				var _equation_text = "";
				var _equation_answer = 0;
	
				var _equation_x = floor(random_range(1, 100.99));
				var _equation_y = floor(random_range(1, 100.99));
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
	
				return [_equation_answer, _equation_text];
			}
			_should_add = true;
			break;
			
		case EQUATION_DIFFICULTY.HARD:
			global.subtraction_difficulty = function()
			{
				// TODO: Hard subtraction equation
				var _equation_text = "";
				var _equation_answer = 0;
	
				var _equation_x = floor(random_range(1, 100.99));
				var _equation_y = floor(random_range(1, 100.99));
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
	
				return [_equation_answer, _equation_text];
			}
			_should_add = true;
			break;
	}
	
	// Add the subtraction equation type to the list of active equations
	if(!_contains_equation && _should_add)
	{
		array_push(global.active_equation_types, EQUATION_TYPE.SUBTRACTION);
	}
}

/// @description Sets the desired function for multiplication problems based off of the passed difficulty.
/// @arg {Real} _equation_difficulty Must be an enum of type EQUATION_DIFFICULTY. Options are: off, easy, medium, hard
function scr_set_multiplication_difficulty(_equation_difficulty = EQUATION_DIFFICULTY.OFF)
{
	// Indicates if the multiplication equation type is active
	var _contains_equation = array_contains(global.active_equation_types, EQUATION_TYPE.MULTIPLICATION);
	
	// Indicates if the multiplication equation type should be added to the list of active equations
	var _should_add = false;;
	
	switch (_equation_difficulty)
	{
		case EQUATION_DIFFICULTY.OFF:
			// Remove the multiplication equation type from the list of active equations if it is currently active
			if (_contains_equation)
			{
				array_delete(global.active_equation_types, array_get_index(global.active_equation_types, EQUATION_TYPE.MULTIPLICATION), 1);
			}
			break;

		case EQUATION_DIFFICULTY.EASY:
			global.multiplication_difficulty = function()
			{
				// TODO: Easy multiplication equation
				var _equation_x = floor(random_range(1, 12.99));
				var _equation_y = floor(random_range(1, 12.99));
				var _equation_answer = _equation_x * _equation_y;
				var _equation_text = string(_equation_x) + "X" + string(_equation_y) + "=?";
	
				return [_equation_answer, _equation_text];
			}
			_should_add = true;
			break;
		
		case EQUATION_DIFFICULTY.MEDUIM:
			global.multiplication_difficulty = function()
			{
				// TODO: Medium multiplication equation
				var _equation_x = floor(random_range(1, 12.99));
				var _equation_y = floor(random_range(1, 12.99));
				var _equation_answer = _equation_x * _equation_y;
				var _equation_text = string(_equation_x) + "X" + string(_equation_y) + "=?";
	
				return [_equation_answer, _equation_text];
			}
			_should_add = true;
			break;
			
		case EQUATION_DIFFICULTY.HARD:
			global.multiplication_difficulty = function()
			{
				// TODO: Hard multiplication equation
				var _equation_x = floor(random_range(1, 12.99));
				var _equation_y = floor(random_range(1, 12.99));
				var _equation_answer = _equation_x * _equation_y;
				var _equation_text = string(_equation_x) + "X" + string(_equation_y) + "=?";
	
				return [_equation_answer, _equation_text];
			}
			_should_add = true;
			break;
	}
	
	// Add the multiplication equation type to the list of active equations
	if(!_contains_equation && _should_add)
	{
		array_push(global.active_equation_types, EQUATION_TYPE.MULTIPLICATION);
	}
}

/// @description Sets the desired function for division problems based off of the passed difficulty.
/// @arg {Real} _equation_difficulty Must be an enum of type EQUATION_DIFFICULTY. Options are: off, easy, medium, hard
function scr_set_division_difficulty(_equation_difficulty = EQUATION_DIFFICULTY.OFF)
{
	// Indicates if the division equation type is active
	var _contains_equation = array_contains(global.active_equation_types, EQUATION_TYPE.DIVISION);
	
	// Indicates if the division equation type should be added to the list of active equations
	var _should_add = false;
	
	switch (_equation_difficulty)
	{
		case EQUATION_DIFFICULTY.OFF:
			// Remove the division equation type from the list of active equations if it is currently active
			if (_contains_equation)
			{
				array_delete(global.active_equation_types, array_get_index(global.active_equation_types, EQUATION_TYPE.DIVISION), 1);
			}
			break;
			
		case EQUATION_DIFFICULTY.EASY:
			global.division_difficulty = function()
			{
				// TODO: Easy division equation
				var _equation_answer = floor(random_range(1, 12.99));
				var _equation_y = floor(random_range(1, 12.99));
				var _equation_x = _equation_answer * _equation_y;
				var _equation_text = string(_equation_x) + "/" + string(_equation_y) + "=?";
	
				return [_equation_answer, _equation_text];
			}
			_should_add = true;
			break;
		
		case EQUATION_DIFFICULTY.MEDUIM:
			global.division_difficulty = function()
			{
				// TODO: Medium division equation
				var _equation_answer = floor(random_range(1, 12.99));
				var _equation_y = floor(random_range(1, 12.99));
				var _equation_x = _equation_answer * _equation_y;
				var _equation_text = string(_equation_x) + "/" + string(_equation_y) + "=?";
	
				return [_equation_answer, _equation_text];
			}
			_should_add = true;
			break;
			
		case EQUATION_DIFFICULTY.HARD:
			global.division_difficulty = function()
			{
				// TODO: Hard division equation
				var _equation_answer = floor(random_range(1, 12.99));
				var _equation_y = floor(random_range(1, 12.99));
				var _equation_x = _equation_answer * _equation_y;
				var _equation_text = string(_equation_x) + "/" + string(_equation_y) + "=?";
	
				return [_equation_answer, _equation_text];
			}
			_should_add = true;
			break;
	}
	
	// Add the division equation type to the list of active equations
	if(!_contains_equation && _should_add)
	{
		array_push(global.active_equation_types, EQUATION_TYPE.DIVISION);
	}
}

/// @description The default equation for when all equation types (add, sub, mul, div) are set to off.
/// @return Array of length two. First index is the {real} solution answer (always 2), second index is the {string} equation text (always "1+1=?")
function scr_get_default_equation()
{
	var _equation_answer = 2;
	var _equation_text = string(1) + "+" + string(1) + "=?";
		
	return [_equation_answer, _equation_text];
}
