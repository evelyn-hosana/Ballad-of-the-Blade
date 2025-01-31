///@description Place Notes

if (instance_exists(obj_snapNoteToKey)) {
	var nearest_snap = instance_nearest(mouse_x, mouse_y, obj_snapNoteToKey);
	
	// find index of snap object in array
	var snap_index = 0; // default (not found)
    for (var i = 1; i <= array_length_1d(snap); i++) {
        if (snap[i] == nearest_snap) {
            snap_index = i;
            break;
        }
    }
	
	// check if a note is already active
    if (active_note != noone && instance_exists(active_note)) {
        show_message("There can only be one note in each block!");
        exit; // prevent creating another note
    }
	
	// place note
    var placed_note = instance_create_layer(nearest_snap.x, nearest_snap.y, "StaffNotesLayer", obj_placedNote);
	placed_note.image_index = global.sprite_frame_selected;
	
	if (reflection == true) {
		placed_note.image_angle += 180;
	}
	
	// set this note as active
    active_note = placed_note;
	 
	// check if snapped note matches correct key and note type
	if ((snap_index == correct_key) && (global.sprite_frame_selected == correct_note_type)) {
        correct = true;
	} // if only key matches
	else if ((snap_index == correct_key) && (global.sprite_frame_selected != correct_note_type)) {
		correct = false;
		show_message("You've got the right idea! It sounds right... but maybe another note would fit better.");
	} else {
        correct = false;
	}
	
	// change sprite to correct answer
    if (correct) {
        placed_note.image_index += 2;
		show_message("Way to go!");
    }
    
    // store placed note
    global.notes[global.note_count] = placed_note;
    global.note_count += 1;
}