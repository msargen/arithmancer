/// @description The numpad equation text

// Allows for a smooth reveal of the equation text (instead of just putting it all on the screen in one frame)
np_equation_reveal_speed = 0.5;
// The current number of letters to display
np_equation_num_shown_letters = 0;
// The maximum number of letters to diaplay
np_equation_shown_letters_cap = 15;
// The current text shown in the equation bubble
np_equation_text_current = "";

//Player input
np_equation_input = "";

// All the entered equation value. Base + player input
np_equation_all_text = "";

// Below variables are set by the creating object upon instance creation

// The nummeric answer to the equation text
np_equation_equation_solution = 0;
// The object id of the calling object
np_equation_np_flag_id = id;
// The actual equation being solved
np_equation_text_base = "";
// The length of the base equation (prevents too early anwers from being entered when the equation hasn't been
// fully displayed yet)
np_equation_base_length = string_length(np_equation_text_base);

// For when the player hits the enter or backspace numpad buttons
np_equation_button_enter = false;
np_equation_button_backspace = false;
