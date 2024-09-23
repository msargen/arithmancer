/// @description scr_draw_set_text(_colour, _font, _halign, _valign)
/// @arg _colour
/// @arg _font
/// @arg _halign
/// @arg _valign
function scr_draw_set_text(_colour, _font, _halign, _valign) {

	// Allows one line setup of major text drawing vars.

	draw_set_colour(_colour);
	draw_set_font(_font);
	draw_set_halign(_halign);
	draw_set_valign(_valign);


}
