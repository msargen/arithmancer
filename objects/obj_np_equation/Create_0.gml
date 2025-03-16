/// @description The numpad equation text (tmp)
// TODO: better comment these variables once we chose what we are going to use

np_equation_speed = 0.5;
np_equation_letters = 0;
// TODO: need to have a cap for not only shown values, but actually adding the values to the equation answer. 
// Because right now they might not show up, but they are still added so that when enter is selected, it wont 
// count even though it looks like it should
np_equation_letters_cap = 15;
np_equation_text = "";
np_equation_length = string_length(np_equation_text);
np_equation_text_current = "";
np_equation_display_width = 0;
np_equation_display_height = 0;
np_equation_display_border = 5;


//Player input
np_equation_input = "";

np_equation_all_text = "";


np_equation_equation_solution = 0;

np_equation_np_flag_id = id;

np_equation_bad_answer = false;
