/// @description Destroy Notes if Puzzle Complete

if ((global.intro_complete || global.puzzle_1_complete || 
     global.puzzle_2_complete || global.puzzle_3_complete) && !global.puzzle_active) {
	instance_destroy();
}