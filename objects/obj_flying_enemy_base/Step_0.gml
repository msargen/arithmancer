//Horizontal collision
if (place_meeting(x + flying_enemy_base_horizontal_speed, y, obj_wall))
{
	while (!place_meeting(x + sign(flying_enemy_base_horizontal_speed), y, obj_wall))
	{
		x = x + sign(flying_enemy_base_horizontal_speed);
	}
	flying_enemy_base_horizontal_speed = -flying_enemy_base_horizontal_speed;
}
x = x + flying_enemy_base_horizontal_speed;

//Vertical collision
if (place_meeting(x, y + flying_enemy_base_vertical_speed, obj_wall))
{
	while (!place_meeting(x, y + sign(flying_enemy_base_vertical_speed), obj_wall))
	{
		y = y + sign(flying_enemy_base_vertical_speed);
	}
	flying_enemy_base_vertical_speed = -flying_enemy_base_vertical_speed;
}
y = y + flying_enemy_base_vertical_speed;

//Animations
//if (!place_meeting(x, y + 1, obj_wall))
//{
//	flying_enemy_base_is_flying = false;
//	sprite_index = spr_ram;
//	image_speed = 0;
//	if (sign(flying_enemy_base_vertical_speed) > 0) image_index = 1; else image_index = 0;
//}
//else
//{
//	flying_enemy_base_is_flying = true;
//	image_speed = 1;
//	if (flying_enemy_base_horizontal_speed == 0)
//	{
//		sprite_index = spr_ram;
//	}
//	else
//	{
//		sprite_index = spr_ram_running;
//	}
//}

if (flying_enemy_base_horizontal_speed != 0) image_xscale = sign(flying_enemy_base_horizontal_speed);

