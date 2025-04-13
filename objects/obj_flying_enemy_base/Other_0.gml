/// @description If the flyer goes offscreen, reverse the movement directions

if (y > room_height)
{
	flying_enemy_base_vertical_speed = -flying_enemy_base_vertical_speed;
	flying_enemy_base_horizontal_speed = -flying_enemy_base_horizontal_speed;
}
