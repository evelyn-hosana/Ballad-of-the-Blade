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

// puzzle 1
if (keyboard_check_direct(vk_control) && keyboard_check_pressed(ord("Z"))) {
	if (global.note_count > 0) {
	    // get last placed note
	    var last_note = global.notes[global.note_count - 1];

	    // check if note exists and destroy it
	    instance_destroy(last_note);

	    // remove note from global array
	    global.note_count -= 1;
	}
}