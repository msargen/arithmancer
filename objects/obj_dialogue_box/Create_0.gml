/// @description For showing dialogue

// NOTE: dialogue lines passed to this object "probably" shouldn't already have \n characters in them

// The current amount of chars that can comfortably fix in a single line in the box (at the moment)
dialogue_box_max_line_chars = 75;
// Max lines of dialogue to show in a box at once. The box can technically fit up to 5 (right now), but that looks too busy
dialogue_box_max_lines = 3;

// The array of text lines that will be shown in the box. One array index at a time
dialogue_box_text_list = array_create(0);
// Keeps track of the string length of each line for the dialogue
dialogue_box_text_line_length = array_create(0);
// Keeps track of where each line should have its starting x position in the dialogue box
dialogue_box_show_line_x = array_create(0);
// Keeps track of where each line should have its starting y position in the dialogue box
dialogue_box_show_line_y = array_create(0);

// How fast the dialogue progesses
dialogue_box_text_speed = 0.5;
// The current shown text (as it progesses)
dialogue_box_shown_text = "";
// The current number of characters shown in the text crawl
dialogue_box_text_crawl = 0;
// The current line of dialogue being shown
dialogue_box_current_line = 0;

// TODO: update all formatting values after pulling in Joels changes
// TODO: figure out how to flip the portrait side and how that will affect text location.
// TODO: Figure out if a struct or a ds_map will be better for long term dialogue use. Also general storage location of dialogue. And how we will progress through the dialogue options throughout the game.
// TODO: Update the box and the scripts for conversations (right now it just works as a monologue).