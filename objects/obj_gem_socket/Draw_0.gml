/// @description Draw Gem Socket and Equation

// draw sprite before drawing text
draw_self();

// draw equation above socket
if(instance_exists(obj_player) &&  (id == obj_player.player_closest_socket) && obj_player.player_holding_gem && obj_player.player_near_socket)
{
	// insert held gem value into equation text
	obj_player.player_closest_socket.socket_equation_text = string_insert(string(obj_player.player_held_gem.gem_answer), socket_equation_text_base, string_length(socket_equation_text_base));
}
else
{
	socket_equation_text = socket_equation_text_base;
}

// only draw above sockets that don't have gems in them
if(socket_answer != global.over_9000)
{
	// draw equation above socket
	scr_text_box(socket_equation_text, ORIENTATION.UP, x, y, socket_text_offset);
}