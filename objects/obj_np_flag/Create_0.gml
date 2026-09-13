/// @description The numpad flag object (tmp)

#region // Creation code fields
// Default to one. Can be set in the instance creation code if we want more equations to be needed
np_flag_tot_eq = 1;
// For forcing specific quations at flags
np_flag_force_eq = false;
np_flag_forced_solutions = [0];
np_flag_forced_text = [""];
np_flag_forced_index_tracker = 0;
#endregion

// Proximity
np_flag_player_nearby = false;

//Equation Variables
np_flag_equation_solution = 0;
np_flag_text = 0;

// The flag instance id
np_flag_id = id;

// Keeps track of the number of equations solved for this flag
np_flag_eq_solved = 0;

// The offset for the indicator and the equation box for the flag
np_flag_equation_offset = 25;
