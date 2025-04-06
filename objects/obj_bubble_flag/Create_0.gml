/// @description The numpad flag object (tmp)

// Proximity
np_flag_player_nearby = false;

// Defaults to 5 for a randome assignment of an equation type
np_flag_operation = 5;


//Equation Variables
np_flag_equation_solution = 0;
np_flag_text = 0;

// The flag instance id
np_flag_id = id;

// Keeps track of the number of equations solved for this flag
np_flag_eq_solved = 0;
// Default to one. Can be set in the instance creation code if we want more equations to be needed
np_flag_tot_eq = 1;