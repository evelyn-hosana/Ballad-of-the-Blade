/// Step Event of obj_enemy
// If there’s nothing directly below, apply gravity:
if (!place_meeting(x, y + 1, obj_solid_parent)) {
    vspd += 0.3; // Increase vertical speed by 0.3 each step
} else {
    vspd = 0; // If on the ground, reset vertical speed
}

// Move vertically, but stop if hitting the ground or ceiling
if (place_meeting(x, y + vspd, obj_solid_parent)) {
    // Slide up/down until collision
    while (!place_meeting(x, y + sign(vspd), obj_solid_parent)) {
        y += sign(vspd);
    }
    vspd = 0; // Stop vertical movement
} else {
    y += vspd; // Apply vertical movement
}


// -- If in "walk" state, move horizontally:
if (state == "walk") {
		// Check collision with wall before moving
		if (place_meeting(x + hspd, y, obj_solid_parent)) {
		    // Move back step by step until not colliding
		    while (!place_meeting(x + sign(hspd), y, obj_solid_parent)) {
		        x += sign(hspd);
		    }
		    // Reverse direction once free
		    hspd = -hspd;
		}

		// Front check for turning around when no ground ahead
		var frontCheckX = x + sign(hspd) * 30;
		if (!place_meeting(frontCheckX, y + 1, obj_solid_parent)) {
		    hspd = -hspd;
		}

// Move the enemy after checks
x += hspd;

    // Flip the sprite if moving left
    image_xscale = (hspd < 0) ? -1 : 1;
}

// -- If in "dead" state, we could stop moving:
if (state == "dead") {
    // no movement, or do something else (like a death animation)
}