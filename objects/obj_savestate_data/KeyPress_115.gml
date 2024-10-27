/// @description Load from savestate_one

// check if savestate data exists
if (savestate[1].level == -1) {exit;};

// assign savestate load number
savestate_load_number = 1;

// go to savestate room
room_goto(asset_get_index(savestate[1].level));