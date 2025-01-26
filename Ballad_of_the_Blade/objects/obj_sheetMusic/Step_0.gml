// obj_sheetMusic Step Event
if (mouse_check_button_pressed(mb_left)) 
{
    // 1) Calculate the local click position relative to the sheet
    var localX = mouse_x - x;
    var localY = mouse_y - y;

    // 2) Check if the click is within our staff region
    var staffTop    = 0;
    var staffBottom = sprite_get_height(spr_sheetMusic);
    var staffLeft   = 0;
    var staffRight  = sheet_width; // or sprite_get_width(spr_sheetMusic) if fully unrolled

    if (localX >= staffLeft && localX <= staffRight && localY >= staffTop && localY <= staffBottom)
    {
        // 3) Expand if near the edge, etc. (same as your code)
        var edge_buffer = 20;
        if (localX > (sheet_width - edge_buffer - 1)) {
            target_width += 64;
        }

        // 4) Determine the note from the localY
        var theSound = getNoteSound(localY); 
          // calls the function in #2 above

        // 5) Create the "platform note" object in the same place as the click
        var newPlatform = instance_create_layer(mouse_x, mouse_y, "StaffNotesLayer", obj_sheetMusicNotesPlatform);

        // 6) Assign the note
        newPlatform.mySound = theSound;
		show_debug_message("Assigned platform sound: " + string(theSound));
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