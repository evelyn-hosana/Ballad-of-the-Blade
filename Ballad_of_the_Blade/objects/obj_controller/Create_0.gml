/// @description Overall Game Settings
global.font = font_add_sprite(spr_font, 32, true, 1);

// spawn mouse cursor
instance_create_layer(0, 0, "GUI", obj_cursor);

// puzzle globals
global.puzzle_active = false;
global.intro_complete = false;
global.puzzle_1_complete = false;
global.puzzle_2_complete = false;
global.puzzle_3_complete = false;

global.notes = [];
global.note_count = 0;