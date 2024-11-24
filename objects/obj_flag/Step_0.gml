/// @description Sign text

//Equation Generator
flag_operation = floor(random_range(1, 4.99));
if (flag_operation == 1)
{
	flag_equation_x = floor(random_range(1, 50.99));
	flag_equation_y = floor(random_range(1, 50.99));
	flag_equation_solution = flag_equation_x + flag_equation_y;
	flag_text = string(flag_equation_x) + "+" + string(flag_equation_y) + "= ";
}
else if (flag_operation == 2)
{
	flag_equation_x = floor(random_range(1, 100.99));
	flag_equation_y = floor(random_range(1, 100.99));
	if (flag_equation_x >= flag_equation_y)
	{
		flag_text = string(flag_equation_x) + "-" + string(flag_equation_y) + "= ";
		flag_equation_solution = flag_equation_x - flag_equation_y;
	}
	else
	{
		flag_text = string(flag_equation_y) + "-" + string(flag_equation_x) + "= ";
		flag_equation_solution = flag_equation_y - flag_equation_x;
	}
}
else if (flag_operation == 3)
{
	flag_equation_x = floor(random_range(1, 12.99));
	flag_equation_y = floor(random_range(1, 12.99));
	flag_equation_solution = flag_equation_x * flag_equation_y;
	flag_text = string(flag_equation_x) + "x" + string(flag_equation_y) + "= ";
}
else if (flag_operation == 4)
{
	flag_equation_solution = floor(random_range(1, 12.99));
	flag_equation_y = floor(random_range(1, 12.99));
	flag_equation_x = flag_equation_solution * flag_equation_y;
	flag_text = string(flag_equation_x) + "/" + string(flag_equation_y) + "= ";
}



// TODO: proximity radius should be a global and set to 32 probably
//Proximity
if ((instance_exists(obj_player)) && (point_in_circle(obj_player.x, obj_player.y, x, y, 32)) && (!instance_exists(obj_equation_text)))
{
	flag_player_nearby = true;
	if (global.key_up)
	{
		flag_id = instance_nearest(obj_player.x, obj_player.y, obj_flag)
		with (instance_create_layer(x, y - 32, layer, obj_equation_text))
		{
			equation_text_flag_id = other.flag_id;
			equation_text_equation_solution = other.flag_equation_solution;
			equation_text_text = other.flag_text;
			equation_text_length = string_length(equation_text_text);
		}
	
		with (obj_camera)
		{
			camera_tracking = other.flag_id;
		}
	}
}
else flag_player_nearby = false;
