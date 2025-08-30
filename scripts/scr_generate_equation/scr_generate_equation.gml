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
			
		case 0:
			// Always returns 1 + 1 = 2
			_equation = scr_get_default_equation();
			break;
	}
	
	return _equation;

}