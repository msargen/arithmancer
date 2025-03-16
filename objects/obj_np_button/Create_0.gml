/// @description The numpad buttons

// The value of the particular button. Can be (0-9) or (B, E)
np_button_key_value = 0;

// Denotes if the player is currently pressing the button
np_button_pressed = false;

// Denotes if the sprite should be changed to the button pressed version
np_button_sprite_button_pressed = false;

// Denotes if the button being pressed will change anything for the equation
np_button_can_input = false;

// Keeps track of the last time the button was pressed
np_button_timer = 0;

// The minimum time difference between when the button was pressed and when it should go back to normal.
// The time is tracked in microseconds (1 millon to each second)
np_button_time_diff = 300000;


// The text offsets for the button numbers to make them centerd over the buttons
np_button_text_offset = 10;
np_button_text_offset_second = 1;