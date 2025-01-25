/// @description Hide Puzzle until Complete

global.hidden = !global.hidden;

// toggle visibility
if (global.hidden) {
	visible = 0;
} else {
	visible = 1;
}

global.puzzle_active = !global.puzzle_active;