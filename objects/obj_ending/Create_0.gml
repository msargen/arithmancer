/// @description End Credits
ending_end_text[0] = "Well mathed\n You solved " + string(global.equations_solved) + " Equations\nIn only " + string(global.time) + "!"


ending_text_speed = 0.5;
ending_letters = 0;
ending_current_line = 0;
ending_text_length = string_length(ending_end_text[ending_current_line]);
ending_text = "";

ending_text_max = 50;