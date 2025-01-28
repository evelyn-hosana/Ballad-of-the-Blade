/// @description Destroy Notes if Puzzle Complete

if (global.puzzle_1_complete && !global.puzzle_active) {
	instance_destroy();
}