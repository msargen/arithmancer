/// @description The bubble flag object for use with floating answer choice bubbles

#region // Creation code fields
// For forcing specific quations at flags
bubble_flag_force_eq = false;
bubble_flag_forced_solutions = 0;
bubble_flag_forced_text = "";
#endregion

// Proximity
bubble_flag_player_nearby = false;

//Equation Variables
bubble_flag_equation_solution = 0;
bubble_flag_text = 0;

// The flag instance id
bubble_flag_id = id;
bubble_flag_equation_display = false;

bubble_flag_interract_offset = 25;

// The offset for the indicator and the equation box for the flag
bubble_flag_equation_offset = 22;

// Array of bubble object IDs

bubble_object_ids = array_create(0);