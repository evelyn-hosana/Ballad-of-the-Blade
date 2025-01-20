// obj_sheetMusic Step Event
if (mouse_check_button_pressed(mb_left)) {
    // Are we clicking over the staff region (including expansion)?
    //   x and y are the top-left in your new code
    var left   = x;
    var right  = x + sheet_width;
    var top    = y;
    var bottom = y + sprite_get_height(spr_sheetMusic);
	// Expansion threshold
	var edge_buffer = 20;	

    if (mouse_x >= left && mouse_x <= right && mouse_y >= top && mouse_y <= bottom) {
        // Convert mouse position to local
        var note_x = mouse_x - x; 
        var note_y = mouse_y - y;

        // Expand if near the edge
        if (note_x > (sheet_width - edge_buffer - 1)) {
            sheet_width += 64;
            show_debug_message("Sheet expanded to: " + string(sheet_width));
        }

        // Place the new note object
        instance_create_layer(mouse_x, mouse_y, "StaffNotesLayer", obj_sheetMusicNotesPlatform);
    }
}