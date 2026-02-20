// Load various information from settings.ini
scr_load_from_ini();

// Slide transition to main menu after one second
function _slide() {scr_slide_transition(TRANS_MODE.GOTO, rm_title_screen);}
call_later(1, time_source_units_seconds, _slide);