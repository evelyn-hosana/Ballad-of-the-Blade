// Convert mouse position relative to the sheet music
var note_x = mouse_x - x;
var note_y = mouse_y - y;

// Add the note (ensure it aligns to the lines)
array_push(notes, [note_x, note_y]);


// Convert note into a platform
var new_platform = instance_create_layer(x + note_x, y + note_y, "Instances", obj_sheetMusicNotesPlatform);

// Debugging output
show_debug_message("Note added at position: " + string(note_x) + ", " + string(note_y));