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
	section_1 = instance_create_layer(x - 188, y - 119, "StaffLayer", obj_placeNoteArea);
	section_1.relative_x = -188;
	section_1.relative_y = -119;
	section_1.reflection = true;

	section_2 = instance_create_layer(x - 104, y - 119, "StaffLayer", obj_placeNoteArea);
	section_2.relative_x = -104;
	section_2.relative_y = -119;
	section_2.reflection = true;

	section_3 = instance_create_layer(x + 1, y - 119, "StaffLayer", obj_placeNoteArea);
	section_3.relative_x = 1;
	section_3.relative_y = -119;
	section_3.reflection = true;
	

	section_1.correct_key = 6;
	section_2.correct_key = 8;
	section_3.correct_key = 7;
	section_1.correct_note_type = 0;
	section_2.correct_note_type = 3;
	section_3.correct_note_type = 3;
	
	// second staff
	section_4 = instance_create_layer(x - 167, y - 31, "StaffLayer", obj_placeNoteArea);
	section_4.relative_x = -167;
	section_4.relative_y = -31;
	section_4.reflection = true;

	section_5 = instance_create_layer(x - 62, y - 31, "StaffLayer", obj_placeNoteArea);
	section_5.relative_x = -62;
	section_5.relative_y = -31;
	section_5.reflection = true;

	section_6 = instance_create_layer(x - 10, y - 31, "StaffLayer", obj_placeNoteArea);
	section_6.relative_x = -10;
	section_6.relative_y = -31;
	section_6.reflection = true;

	section_4.correct_key = 8;
	section_5.correct_key = 4;
	section_6.correct_key = 8;
	section_4.correct_note_type = 3;
	section_5.correct_note_type = 3;
	section_6.correct_note_type = 0;
	
	// third staff
	section_7 = instance_create_layer(x - 127, y + 45, "StaffLayer", obj_placeNoteArea);
	section_7.relative_x = -127;
	section_7.relative_y = 45;
	section_7.reflection = true;

	section_8 = instance_create_layer(x - 52, y + 45, "StaffLayer", obj_placeNoteArea);
	section_8.relative_x = -52;
	section_8.relative_y = 45;
	section_8.reflection = true;

	section_9 = instance_create_layer(x + 17, y + 45, "StaffLayer", obj_placeNoteArea);
	section_9.relative_x = 17;
	section_9.relative_y = 45;
	section_9.reflection = true;

	section_7.correct_key = 7;
	section_8.correct_key = 5;
	section_9.correct_key = 8;
	section_7.correct_note_type = 3;
	section_8.correct_note_type = 3;
	section_9.correct_note_type = 3;
	
	// fourth staff
	section_10 = instance_create_layer(x - 103, y + 117, "StaffLayer", obj_placeNoteArea);
	section_10.relative_x = -103;
	section_10.relative_y = 117;
	section_10.reflection = true;
	
	section_11 = instance_create_layer(x - 45, y + 117, "StaffLayer", obj_placeNoteArea);
	section_11.relative_x = -45;
	section_11.relative_y = 117;
	section_11.reflection = true;

	section_10.correct_key = 8;
	section_11.correct_key = 6;
	section_11.correct_note_type = 3;
	section_10.correct_note_type = 3;
}