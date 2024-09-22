/// @description Sign text

//Equation Generator
operation = floor(random_range(1,4.99));
if operation == 1
{
	flag_equation_x = floor(random_range(1,50.99));
	flag_equation_y = floor(random_range(1,50.99));
	flag_equation_solution = flag_equation_x + flag_equation_y;
	text = string(flag_equation_x) + "+" + string(flag_equation_y) + "= ";
}
else if operation == 2
{
	flag_equation_x = floor(random_range(1,100.99));
	flag_equation_y = floor(random_range(1,100.99));
	if flag_equation_x >= flag_equation_y
	{
		text = string(flag_equation_x) + "-" + string(flag_equation_y) + "= ";
		flag_equation_solution = flag_equation_x - flag_equation_y;
	}
	else
	{
		text = string(flag_equation_y) + "-" + string(flag_equation_x) + "= ";
		flag_equation_solution = flag_equation_y - flag_equation_x;
	}
}
else if operation == 3
{
	flag_equation_x = floor(random_range(1,12.99));
	flag_equation_y = floor(random_range(1,12.99));
	flag_equation_solution = flag_equation_x * flag_equation_y;
	text = string(flag_equation_x) + "x" + string(flag_equation_y) + "= ";
}
else if operation == 4
{
	flag_equation_solution = floor(random_range(1,12.99));
	flag_equation_y = floor(random_range(1,12.99));
	flag_equation_x = flag_equation_solution * flag_equation_y;
	text = string(flag_equation_x) + "/" + string(flag_equation_y) + "= ";
}




//Proximity
if (instance_exists(obj_player)) && (point_in_circle(obj_player.x,obj_player.y,x,y,64)) && (!instance_exists(obj_text))
{
	nearby = true;
	if (keyboard_check_pressed(vk_up)) || keyboard_check_pressed(ord("W"))
	{
		flagid = instance_nearest(obj_player.x,obj_player.y,obj_flag)
		with (instance_create_layer(x,y-64,layer,obj_text))
		{
			flagid = other.flagid;
			text_equation_solution = other.flag_equation_solution;
			text = other.text;
			length = string_length(text);
		}
	
		with (obj_camera)
		{
			follow = other.flagid;
		}
	}
}
else nearby = false;
