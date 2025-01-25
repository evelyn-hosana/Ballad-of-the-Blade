/// @description Player Movement Logic
// In Step Event of Player
//-------------------------------------
// Only run movement if staff is not open
//-------------------------------------
if (!global.puzzle_active) {
	if (instance_number(obj_sheetMusic) == 0) {
	    // movement keys
	    var jump_key = keyboard_check(vk_up) || keyboard_check(ord("W"));
	    var left_key = keyboard_check(vk_left) || keyboard_check(ord("A"));
	    var right_key = keyboard_check(vk_right) || keyboard_check(ord("D"));

	    // check for ground
	    if (place_meeting(x, y+1, obj_solid_parent)) {
	        vspd = 0;
	        if (jump_key) vspd = -jspd;
	    } else {
	        if (vspd < 10) vspd += grav;
	    }

	    // horizontal input
	    if (right_key) hspd = spd;
	    else if (left_key) hspd = -spd;
	    else hspd = 0;

	    // horizontal collision
	    if (place_meeting(x + hspd, y, obj_solid_parent)) {
	        while (!place_meeting(x + sign(hspd), y, obj_solid_parent)) {
	            x += sign(hspd);
	        }
	        hspd = 0;
	    }
	    x += hspd;

	    // vertical collision
	    if (place_meeting(x, y + vspd, obj_solid_parent)) {
	        while (!place_meeting(x, y + sign(vspd), obj_solid_parent)) {
	            y += sign(vspd);
	        }
	        vspd = 0;
	    }
	    y += vspd;
	}

	//summon the sheet music
	if (keyboard_check_pressed(vk_space)) {
	   if (instance_number(obj_sheetMusic) > 0) {
	        // staff is open => close it
			        show_debug_message("Number of staff before destruction: " + string(instance_number(obj_sheetMusic)));

				// staff is open => close it
				with (obj_sheetMusic) {
				    show_debug_message("Destroying staff ID: " + string(id));
				    instance_destroy();
				}

				show_debug_message("Number of staff after destruction: " + string(instance_number(obj_sheetMusic)));
		} else {
		    var offset_x = 50;  // Adjust this value to place it in front of the player
			var offset_y = -50;   // Adjust if needed for vertical alignment
			var music = instance_create_layer(x + (image_xscale * offset_x), y + offset_y, "StaffLayer", obj_sheetMusic);
			music.visible = true;
		}
	}
}

// update health based on damage taken
health -= damage_taken;
if (health <= 0) {
	instance_destroy(); // destroy player
}