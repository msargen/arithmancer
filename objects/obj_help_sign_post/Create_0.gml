/// @description A sign for giving the player tips

// Denotes if the player is near to the sign post
help_sp_player_nearby = false;

// The id of the help text box created by this sign post
help_sp_text_id = noone;

// The distance above the sign post to have the text box appear
help_sp_text_offset = 18;

// Array of arrays of text and symbols to display in the help box
help_sp_list = array_create(0);
// The current index in the list
help_sp_list_index = 0;