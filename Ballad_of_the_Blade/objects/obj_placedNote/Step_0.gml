/// @description Hide Notes if Puzzle Not Active

if (global.hidden) {
	visible = 0;
} else {
	visible = 1;
}

if (correct_notes == 12) {
	global.puzzle_1_complete = true;
	if (instance_exists(obj_puzzle_1)) {
		instance_destroy(obj_puzzle_1);
	}
}