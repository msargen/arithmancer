/// @description Progress text

letters += spd;
input = string_digits(keyboard_string);
alltext = text + input;
text_current = string_copy(alltext,1,floor(letters));

draw_set_font(fnt_sign);
if (h == 0) h = string_height(alltext);
w = string_width(text_current);

//Destroy when done
if (letters >= length) && (keyboard_check_pressed(vk_enter)) && text_equation_solution == real(input)
{
	keyboard_string = "";
	instance_destroy();
	with (obj_camera) follow = obj_player;
	instance_destroy(flagid);
	global.flagscollected ++ ;
}
