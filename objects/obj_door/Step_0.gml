/// @description Destroy door when enough equations have been solved

if (global.equations_solved == door_equations_to_solve)
{
	instance_destroy();
}
