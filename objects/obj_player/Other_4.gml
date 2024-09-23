/// @description Auto Save

//Overwrite old save
if (file_exists(SAVEFILE)) file_delete(SAVEFILE);

//Create new save
var _file = file_text_open_write(SAVEFILE);
file_text_write_string(_file, room_get_name(room));
file_text_close(_file);