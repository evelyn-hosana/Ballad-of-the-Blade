/// @description Place Necessary Objects
global.hidden = false;
global.puzzle_active = true;

// note spawners
quarter_note = instance_create_layer(x + 135, y + 30, "StaffNotesLayer", obj_noteSpawner);
quarter_note.image_index = 3;
quarter_note.relative_x = 135;
quarter_note.relative_y = 30;

half_note = instance_create_layer(x + 205, y + 30, "StaffNotesLayer", obj_noteSpawner);
half_note.image_index = 0;
half_note.relative_x = 205;
half_note.relative_y = 30;

// pause/play
audio_player = instance_create_layer(x + 173, y - 75, "GUI", obj_play_pause);
audio_player.relative_x = 173;
audio_player.relative_y = -75;

function spawn_area() {
	// staff note placement
	// first staff
	section_1 = instance_create_layer(x - 175, y - 120, "StaffLayer", obj_placeNoteArea);
	section_1.relative_x = -175;
	section_1.relative_y = -120;

	section_2 = instance_create_layer(x - 97, y - 120, "StaffLayer", obj_placeNoteArea);
	section_2.relative_x = -97;
	section_2.relative_y = -120;

	section_3 = instance_create_layer(x - 3, y - 120, "StaffLayer", obj_placeNoteArea);
	section_3.relative_x = -3;
	section_3.relative_y = -120;

	section_1.correct_key = 9;
	section_2.correct_key = 8;
	section_3.correct_key = 7;
	section_1.correct_note_type = 3;
	section_2.correct_note_type = 3;
	section_3.correct_note_type = 3;
	
	// second staff
	section_4 = instance_create_layer(x - 193, y - 32, "StaffLayer", obj_placeNoteArea);
	section_4.relative_x = -193;
	section_4.relative_y = -32;

	section_5 = instance_create_layer(x - 125, y - 32, "StaffLayer", obj_placeNoteArea);
	section_5.relative_x = -125;
	section_5.relative_y = -32;

	section_6 = instance_create_layer(x - 7, y - 32, "StaffLayer", obj_placeNoteArea);
	section_6.relative_x = -7;
	section_6.relative_y = -32;

	section_4.correct_key = 2;
	section_5.correct_key = 6;
	section_6.correct_key = 6;
	section_4.correct_note_type = 3;
	section_5.correct_note_type = 0;
	section_6.correct_note_type = 3;
	
	// third staff
	section_7 = instance_create_layer(x - 157, y + 45, "StaffLayer", obj_placeNoteArea);
	section_7.relative_x = -157;
	section_7.relative_y = 45;

	section_8 = instance_create_layer(x - 77, y + 45, "StaffLayer", obj_placeNoteArea);
	section_8.relative_x = -77;
	section_8.relative_y = 45;

	section_9 = instance_create_layer(x - 27, y + 45, "StaffLayer", obj_placeNoteArea);
	section_9.relative_x = -27;
	section_9.relative_y = 45;
	
	section_10 = instance_create_layer(x + 25, y + 45, "StaffLayer", obj_placeNoteArea);
	section_10.relative_x = 25;
	section_10.relative_y = 45;

	section_7.correct_key = 8;
	section_8.correct_key = 9;
	section_9.correct_key = 8;
	section_10.correct_key = 5;
	section_7.correct_note_type = 3;
	section_8.correct_note_type = 3;
	section_9.correct_note_type = 3;
	section_10.correct_note_type = 0;
	
	// fourth staff
	section_11 = instance_create_layer(x - 167, y + 117, "StaffLayer", obj_placeNoteArea);
	section_11.relative_x = -167;
	section_11.relative_y = 117;

	section_12 = instance_create_layer(x - 22, y + 117, "StaffLayer", obj_placeNoteArea);
	section_12.relative_x = -22;
	section_12.relative_y = 117;

	section_11.correct_key = 5;
	section_12.correct_key = 6;
	section_11.correct_note_type = 3;
	section_12.correct_note_type = 3;
}