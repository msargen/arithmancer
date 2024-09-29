/// @description End Credits
ending_end_text[0] = "Well mathed\n You completed " + string(global.flags_collected) + " Equations\nWith " + string(global.time) + " Remaining"


ending_text_speed = 0.5;
ending_letters = 0;
ending_current_line = 0;
ending_text_length = string_length(ending_end_text[ending_current_line]);
ending_text = "";