// Convert mouse position relative to the sheet music
var note_x = mouse_x - x;
var note_y = mouse_y - y;

// Create a new note instance
var new_platform = instance_create_layer(x + note_x, y + note_y, "Instances", obj_sheetMusicNotesPlatform);
new_platform.depth = -10;  // Lower value = closer to the front


// Store the note position for debugging
show_debug_message("Note added at position: " + string(note_x) + ", " + string(note_y));