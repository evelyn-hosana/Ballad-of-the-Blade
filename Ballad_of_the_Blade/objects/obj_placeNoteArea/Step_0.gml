/// @description Destroy Object if Puzzle is Hidden & Reset

if (global.hidden) {
	global.note_count = 0;
	for (var i = 0; i < array_length_1d(global.notes); i++) {
	    if (instance_exists(global.notes[i])) {
	        instance_destroy(global.notes[i]);
	    }
	}
	global.notes = [];
	instance_destroy();
}