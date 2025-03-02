/// @description The numpad buttons

// The value of the particular button. Can be (0-9) or (B, E)
np_button_key_value = 0;

// Denotes if the player is currently activating the button
np_button_player_on_top = false;

// Denotes if the button being pressed will change anything for the equation
np_button_can_input = false;

// Keeps track of the last time the button was pressed
np_button_timer = 0;

// The minimum time difference between when the button was pressed and when it should go back to normal
np_button_time_diff = 300000;

// Denotes if the button is currently pressed
np_button_pressed = false;

// The direction the button will face. Also will determine where the number text is and how the button is pressed
// 0 = up
// 1 = down
// 2 = left
// 3 = right
np_button_orientation = 0;

// Ensures the button angle is only set once
np_button_angle_set = false;

// The text offsets for the button numbers to make them centerd over the buttons
np_button_text_offset = 10;
np_button_text_offset_second = 1;