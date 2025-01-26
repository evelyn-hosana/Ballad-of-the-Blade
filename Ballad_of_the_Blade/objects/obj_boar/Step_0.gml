// Gravity handling first
if (!place_meeting(x, y + 1, obj_solid_parent)) {
    vspd += 0.3;  // Apply gravity gradually
} else {
    vspd = 0;  // Reset if on ground
}

// Vertical movement and collision handling
if (vspd != 0) {
    if (!place_meeting(x, y + vspd, obj_solid_parent)) {
        y += vspd;  // Apply vertical movement
    } else {
        while (!place_meeting(x, y + sign(vspd), obj_solid_parent)) {
            y += sign(vspd);
        }
        vspd = 0;  // Stop vertical movement
    }
}

// -- If in "walk" state, move horizontally:
if (state == "walk") {
    previous_x = x;

    // First, check for walls in the intended movement direction
    if (place_meeting(x + sign(hspd), y, obj_solid_parent)) {
        show_debug_message("Boar collided with wall at X: " + string(x));

        var nudge_count = 0;
        var max_nudge = 5;

        while (place_meeting(x + sign(hspd), y, obj_solid_parent) && nudge_count < max_nudge) {
            x -= sign(hspd);  // Nudge back slightly
            nudge_count++;
        }

        if (nudge_count >= max_nudge) {
            show_debug_message("Warning: Boar stuck too deep, repositioning...");
            x = previous_x;  // Reset to last safe position
        }

        hspd = -hspd;  // Reverse direction after collision
    }

    // Check if there's ground ahead before moving further
    var frontCheckX = x + sign(hspd) * 8;  // Reduced from 16 to avoid overshooting
    var frontCheckY = y + 1;

    if (!place_meeting(frontCheckX, frontCheckY, obj_solid_parent)) {
        show_debug_message("No ground detected ahead at X: " + string(frontCheckX) + ", turning around...");
        hspd = -hspd;  
    } else {
        x += hspd;  // Move the boar if no collision detected
    }

    // Flip sprite based on direction
    image_xscale = (hspd < 0) ? 1 : -1;
}

// If in "dead" state, stop movement
if (state == "dead") {
    hspd = 0;
    vspd = 0;
}