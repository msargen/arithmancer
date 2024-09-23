/// @description scr_stun_player() Stun the player object
function scr_stun_player() {
	instance_change(obj_stunned,true);

	direction = point_direction(other.x, other.y, x, y);
	stunned_horizontal_speed = lengthdir_x(4, direction);
	stunned_vertical_speed = lengthdir_y(2, direction) - 2;
	if (sign(stunned_horizontal_speed) != 0) image_xscale = sign(stunned_horizontal_speed);
}
