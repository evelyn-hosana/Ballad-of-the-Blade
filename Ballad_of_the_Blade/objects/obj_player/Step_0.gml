/// @description Player Movement Logic
// In Step Event of Player
//-------------------------------------
// Only run movement if staff is not open
//-------------------------------------
if (!global.puzzle_active) {
if (instance_number(obj_sheetMusic) == 0) {

    // Separate keys
    var up_key    = keyboard_check(vk_up)   || keyboard_check(ord("W"));
    var down_key  = keyboard_check(vk_down) || keyboard_check(ord("S"));
    var left_key  = keyboard_check(vk_left) || keyboard_check(ord("A"));
    var right_key = keyboard_check(vk_right)|| keyboard_check(ord("D"));

    // Check if the player is on a ladder
    var onLadder = place_meeting(x, y, obj_ladder);

    // 1) Decide if climbing or not
    if (onLadder && (up_key || down_key)) {
        isClimbing = true;
    } else if (!onLadder) {
        isClimbing = false;
    }

    // 2) Movement logic
    if (isClimbing) 
    {
        // -- LADDERS --
        vspd    = 0;
        gravity = 0;
        if (up_key)    y -= climbSpeed;
        if (down_key)  y += climbSpeed;
    }
    else 
    {
        // -- NORMAL MOVEMENT --
        gravity = 0.5;

        // Jump logic (only if on ground and not on ladder)
        if (place_meeting(x, y + 1, obj_solid_parent)) {
            vspd = 0;
            if (up_key) {
                vspd = -jspd;
            }
        } else {
            if (vspd < 10) vspd += grav;
        }

        // Horizontal movement
        if (right_key) {
            hspd = spd;
        } 
        else if (left_key) {
            hspd = -spd;
        } 
        else {
            hspd = 0;
        }

        // Apply vertical collision first
        if (place_meeting(x, y + vspd, obj_solid_parent)) {
            while (!place_meeting(x, y + sign(vspd), obj_solid_parent)) {
                y += sign(vspd);
            }
            vspd = 0;
        }
        y += vspd;

        // Apply horizontal collision
        if (place_meeting(x + hspd, y, obj_solid_parent)) {
            while (!place_meeting(x + sign(hspd), y, obj_solid_parent)) {
                x += sign(hspd);
            }
            hspd = 0;
        }
        x += hspd;
    }
}
}

// update health based on damage taken
health -= damage_taken;
if (health <= 0) {
	instance_destroy(); // destroy player
}