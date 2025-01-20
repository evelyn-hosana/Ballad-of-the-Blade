// obj_sheetMusic Step Event
if (mouse_check_button_pressed(mb_left)) {
    // Are we clicking over the staff region (including expansion)?
    //   x and y are the top-left in your new code
    var left   = x;
    var right  = x + sheet_width;
    var top	    = y;
    var bottom = y + sprite_get_height(spr_sheetMusic);
	// Expansion threshold
	var edge_buffer = 20;	

    if (mouse_x >= left && mouse_x <= right && mouse_y >= top && mouse_y <= bottom) {
        // Convert mouse position to local
        var note_x = mouse_x - x; 
        var note_y = mouse_y - y;

        // Expand if near the edge
		if (note_x > (sheet_width - edge_buffer - 1)) {
		    target_width += 64; // roll out more
		    show_debug_message("Target sheet width updated to: " + string(target_width));
		}

        // Place the new note object
        instance_create_layer(mouse_x, mouse_y, "StaffNotesLayer", obj_sheetMusicNotesPlatform);
    }
}

//create animation for cleff
if (phase == "treble") {
    // Fade in treble
    image_alpha += 0.05;
    if (image_alpha > 1) image_alpha = 1;

    // If treble animation is done...
    if (image_index >= image_number - 1) {
        // Move to next phase
        phase = "fade_staff";
        
        // Optionally reset alpha for staff fade (so staff starts invisible)
        // or do a crossfade if you prefer.
        
        // For a discrete fade (treble disappears, staff appears):
        // - Immediately switch sprite_index, but set alpha back to 0
        sprite_index = normalSprite;
        image_index  = 0;
        image_speed  = 0; // if staff is static
        image_alpha  = 0; // reset alpha so staff can fade in
    }
}

if (phase == "fade_staff") {
    // 1) Fade in
    image_alpha = min(image_alpha + 0.05, 1);

    // 2) Animate the roll-out
    if (sheet_width < target_width) {
        sheet_width += roll_speed; 
        if (sheet_width > target_width) sheet_width = target_width;
    }

    // 3) Once fully faded and unrolled, become active
    if (image_alpha >= 1 && sheet_width >= target_width) {
        phase = "active";
    }
}

// Even in "active", keep checking if we need to expand more
if (phase == "active") {
    // If user triggered expansion, target_width might be bigger now
    // We keep rolling out until we match target_width
    if (sheet_width < target_width) {
        sheet_width += roll_speed; 
        if (sheet_width > target_width) sheet_width = target_width;
    }
}