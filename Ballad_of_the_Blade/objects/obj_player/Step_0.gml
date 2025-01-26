/// @description Player Movement Logic (Step Event)

// Only run movement if staff (puzzle) is not open
if (!global.puzzle_active) {
    // Also ensure no sheetMusic is present
    if (instance_number(obj_sheetMusic) == 0) {

        //-------------------------------------
        // 1) Key inputs
        //-------------------------------------
        var up_key    = keyboard_check(vk_up)   || keyboard_check(ord("W"));
        var down_key  = keyboard_check(vk_down) || keyboard_check(ord("S"));
        var left_key  = keyboard_check(vk_left) || keyboard_check(ord("A"));
        var right_key = keyboard_check(vk_right)|| keyboard_check(ord("D"));

        //-------------------------------------
        // 2) Ladder logic
        //-------------------------------------
        var onLadder = place_meeting(x, y, obj_ladder);

        // Decide if climbing or not
        if (onLadder && (up_key || down_key)) {
            isClimbing = true;
        } else if (!onLadder) {
            isClimbing = false;
        }

        //-------------------------------------
        // 3) Movement & Collision
        //-------------------------------------
        if (isClimbing) 
        {
            // -- LADDERS --
            vspd    = 0;
            gravity = 0;

            // Move up/down the ladder
            if (up_key)    y -= climbSpeed;
            if (down_key)  y += climbSpeed;

        }
        else 
        {
            // -- NORMAL PLATFORMER MOVEMENT --
            // Set gravity
            var grav = 0.5; // Adjust if needed

            // If on ground, reset vertical speed and allow jump
            if (place_meeting(x, y + 1, obj_solid_parent)) {
                vspd = 0; 
                // Jump if pressing Up
                if (up_key) {
                    vspd = -jspd; 
                }
            } 
            else {
                // In air, apply gravity
                if (vspd < 10) {
                    vspd += grav;
                }
            }

            // Horizontal input
            if (right_key) {
                hspd = spd;
            } else if (left_key) {
                hspd = -spd;
            } else {
                hspd = 0;
            }

            //-------------------------------------------------------------
            // VERTICAL COLLISION CHECK (check BEFORE actually moving)
            //-------------------------------------------------------------
            var newY = y + vspd;

            // If moving vertically won’t collide, just move
            if (!place_meeting(x, newY, obj_solid_parent)) {
                y = newY;
            } 
            else {
                // If it would collide, move until just before collision
                var verticalDir = sign(vspd);
                while (!place_meeting(x, y + verticalDir, obj_solid_parent)) {
                    y += verticalDir;
                }
                // Stop vertical speed
                vspd = 0;
            }

            //-------------------------------------------------------------
            // HORIZONTAL COLLISION CHECK
            //-------------------------------------------------------------
            var newX = x + hspd;

            // If moving horizontally won’t collide, just move
            if (!place_meeting(newX, y, obj_solid_parent)) {
                x = newX;
            } 
            else {
                // If it would collide, move until just before collision
                var horizontalDir = sign(hspd);
                while (!place_meeting(x + horizontalDir, y, obj_solid_parent)) {
                    x += horizontalDir;
                }
                // Stop horizontal speed
                hspd = 0;
            }
        }

        // Optional debug messages if you want to verify ground detection
        /*
        if (place_meeting(x, y + 1, obj_solid_parent)) {
            show_debug_message("Ground detected!");
        } else {
            show_debug_message("No ground detected!");
        }
        */
		
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

//-------------------------------------
// 4) Health and death
//-------------------------------------
health -= damage_taken;
if (health <= 0) {
    instance_destroy(); // destroy player
}