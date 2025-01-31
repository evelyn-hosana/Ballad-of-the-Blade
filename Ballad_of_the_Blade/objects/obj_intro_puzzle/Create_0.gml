/// @description Place Necessary Objects
global.hidden = false;
global.puzzle_active = true;

// note spawners
quarter_note = instance_create_layer(x - 170, y + 40, "StaffNotesLayer", obj_noteSpawner);
quarter_note.image_index = 3;
quarter_note.relative_x = -170;
quarter_note.relative_y = 40;

half_note = instance_create_layer(x - 100, y + 40, "StaffNotesLayer", obj_noteSpawner);
half_note.image_index = 0;
half_note.relative_x = -100;
half_note.relative_y = 40;

// pause/play
audio_player = instance_create_layer(x + 145, y + 20, "GUI", obj_play_pause);
audio_player.relative_x = 140;
audio_player.relative_y = 20;

function spawn_area() {
	// staff note placement
	// first staff
	section_1 = instance_create_layer(x - 113, y - 49, "StaffLayer", obj_placeNoteArea);
	section_1.relative_x = -113;
	section_1.relative_y = -49;

	section_2 = instance_create_layer(x - 40, y - 49, "StaffLayer", obj_placeNoteArea);
	section_2.relative_x = -40;
	section_2.relative_y = -49;

	section_3 = instance_create_layer(x + 27, y - 49, "StaffLayer", obj_placeNoteArea);
	section_3.relative_x = 27;
	section_3.relative_y = -49;

	section_1.correct_key = 6;
	section_2.correct_key = 7;
	section_3.correct_key = 5;
	section_1.correct_note_type = 3;
	section_2.correct_note_type = 3;
	section_3.correct_note_type = 0;
}