/// @description Cheatcodes

// N to skip over to next room
if (keyboard_check_pressed(ord("N"))) {
	room_goto_next();
}

// quit game
if (keyboard_check_pressed(vk_escape)) {
	game_end();
}

// toggle fullscreen
if (keyboard_check_pressed(vk_f11)) {
	window_set_fullscreen(!window_get_fullscreen());
}