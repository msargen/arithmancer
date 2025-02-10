/// @description Draw Gem Socket and Equation

// draw sprite before drawing text
draw_self();

// draw equation above socket
if(near_socket && instance_exists(obj_player) && obj_player.holding_gem)
{
	// insert held gem value into equation text
	closest_socket.equation_text = string(addend_one) + "+" + string(addend_two) + "=" + string(obj_gem.held_gem.answer) + "?";
}
else
{
	// equation text without gem value
	equation_text = string(addend_one) + "+" + string(addend_two) + "=?";
}

// only draw above inactive sockets
if(sum != 0)
{
	// set text color and position
	scr_draw_set_text(c_white, fnt_menu, fa_center, fa_bottom);
	
	// draw equation above socket
	draw_text(x - text_x_offset, y - text_y_offset, equation_text);
}