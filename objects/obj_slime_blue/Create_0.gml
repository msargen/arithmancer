// Inherit the parent event
event_inherited();

// More aggressive jump speed
jumping_enemy_slow_idle_time = global.framerate * (0.25);
jumping_enemy_fast_idle_time = global.framerate * (0.5);
jumping_enemy_crouch_time = global.framerate * (0.6);