/// @description Draw Gem Socket and Equation

// draw sprite before drawing text
draw_self();

// draw equation above socket
if(instance_exists(obj_player) &&  (id == obj_player.player_closest_socket) && obj_player.player_holding_gem && obj_player.player_near_socket)
{
	// insert held gem value into equation text
	obj_player.player_closest_socket.socket_equation_text = string(socket_variable_one) + "+" + string(socket_variable_two) + "=" + string(obj_player.player_held_gem.gem_answer) + "?";
}
else
{
	// equation text without gem value
	socket_equation_text = string(socket_variable_one) + "+" + string(socket_variable_two) + "=?";
}

// only draw above sockets that don't have gems in them
if(socket_answer != 0)
{
	// draw equation above socket
	scr_draw_set_text(c_white, fnt_menu, fa_center, fa_bottom);
	draw_text(x - socket_text_x_offset, y - socket_text_y_offset, socket_equation_text);
}