/// @description Player Movement Logic (Step Event)

// 0) Early exit if puzzle is open or sheetMusic is present
if (global.puzzle_active) exit;
if (instance_number(obj_sheetMusic) > 0) {
    // Only handle sheet music in this block if you want
    // e.g. if puzzle is open, skip movement
    // But let's skip for now:
}

//-----------------------------------------
// 1) Key Inputs
//-----------------------------------------
var up_key     = keyboard_check(vk_up) || keyboard_check(ord("W"));
var down_key   = keyboard_check(vk_down) || keyboard_check(ord("S"));
var left_key   = keyboard_check(vk_left) || keyboard_check(ord("A"));
var right_key  = keyboard_check(vk_right) || keyboard_check(ord("D"));
var jump_key   = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));

// We'll do our ground check here,
// but we'll confirm again after vertical collision below
var isOnGround = place_meeting(x, y + 2, obj_solid_parent);

//-----------------------------------------
// 2) Ladder Logic
//-----------------------------------------
var onLadder = place_meeting(x, y, obj_ladder); 
if (onLadder && (up_key || down_key)) {
    isClimbing = true;
} else if (!onLadder) {
    isClimbing = false;
}

//-----------------------------------------
// 3) Wall Detection
//-----------------------------------------
var wall_on_left  = place_meeting(x - 1, y, obj_solid_parent);
var wall_on_right = place_meeting(x + 1, y, obj_solid_parent);

wall_direction = 0;  // -1 if left, +1 if right, 0 if none
if (wall_on_left)  wall_direction = -1;
if (wall_on_right) wall_direction =  1;

//-----------------------------------------
// 4) Jumps (Normal + Wall Jump)
//-----------------------------------------
if (jump_key) 
{
    if (isOnGround) {
        // Normal jump
        vspd = -jspd; 
        wall_jumping = false; 
    }
    else {
        // Potential wall jump
        if (wall_direction != 0) {
            vspd = -jspd;
            hspd = wall_jump_force * -wall_direction;
            wall_jumping = true;
            alarm[2] = 30;
        }
    }
}

// Reset if we land on the ground
if (isOnGround) {
    wall_jumping = false;
}

//-----------------------------------------
// 5) Movement & Gravity (or Ladder)
//-----------------------------------------
if (isClimbing) 
{
    // Cancel normal gravity
    vspd = 0; 
    if (up_key)   y -= climbSpeed;
    if (down_key) y += climbSpeed;
}
else 
{
    // Normal platformer gravity
    var grav = 0.5; 
    if (!isOnGround) {
        // apply gravity
        if (vspd < 10) vspd += grav;
    }
}

//-----------------------------------------
// 6) Horizontal Movement
//-----------------------------------------
var isMoving = false;

// If you're not in the middle of a "wall jump push", set horizontal speed from input
if (!wall_jumping) {
    if (right_key) {
        hspd = spd;
        isMoving = true;
        image_xscale = 1;
    }
    else if (left_key) {
        hspd = -spd;
        isMoving = true;
        image_xscale = -1;
    }
    else {
        hspd = 0;
    }
}

//-----------------------------------------
// 7) Collision Checks
//-----------------------------------------
// Vertical
var newY = y + vspd;
if (!place_meeting(x, newY, obj_solid_parent)) {
    y = newY;
} 
else {
    var vd = sign(vspd);
    // move up/down until we just collide
    while(!place_meeting(x, y + vd, obj_solid_parent)) {
        y += vd;
    }
    vspd = 0;
}

// Re-check if on ground AFTER the vertical collision:
isOnGround = place_meeting(x, y + 2, obj_solid_parent);

// HORIZONTAL COLLISION WITH "STEP UP"
var newX = x + hspd;
if (!place_meeting(newX, y, obj_solid_parent)) {
    // no collision at all, so just move
    x = newX;
} else {
    // we are colliding horizontally; try stepping up
    var stepped = false;
    var stepHeight = 10; // or however many pixels you want to “step” 
    var hd = sign(hspd);

    // Try moving up 1..stepHeight pixels
    for (var i = 1; i <= stepHeight; i++) {
        // Check both horizontal + vertical at that "i" offset
        if (!place_meeting(newX, y - i, obj_solid_parent)) {
            // We also want to ensure we won't clip into the block vertically
            if (!place_meeting(newX, (y - i) + vspd, obj_solid_parent)) {
                x = newX;
                y -= i; // step up
                stepped = true;
                break;
            }
        }
    }
    
    // If we couldn't step up, do the normal "snap to wall" collision
    if (!stepped) {
        while(!place_meeting(x + hd, y, obj_solid_parent)) {
            x += hd;
        }
        hspd = 0;
    }
}
//-----------------------------------------
// 8) Determine "State" and Set Sprite
//-----------------------------------------
var movement_state = "";

// Ladder state takes priority
if (isClimbing) 
{
    movement_state = "climb";
}
// If not climbing, check if on ground or in air
else if (!isOnGround) 
{
    // separate "jump" vs "fall" by vspd
    if (vspd < 0) movement_state = "jump";
    else          movement_state = "fall";
}
else 
{
    // on ground
    if (isMoving) movement_state = "run";
    else          movement_state = "idle";
}

// Switch sprite based on movement_state
switch (movement_state) 
{
    case "idle":
        if (sprite_index != spr_idle) {
            sprite_index = spr_idle;
            image_speed  = 0;
            image_index  = 0;
        }
        break;
        
    case "run":
        if (sprite_index != spr_run) {
            sprite_index = spr_run;
            image_speed  = 0.5;
        }
        break;
        
    case "jump":
        if (sprite_index != spr_jump) {
            sprite_index = spr_jump;
            image_speed  = 0.5;
        }
        break;
        
 
        

}

//-----------------------------------------
// 9) Summon/Destroy Sheet Music
//-----------------------------------------
if (keyboard_check_pressed(vk_space)) 
{
    if (instance_number(obj_sheetMusic) > 0) {
        with (obj_sheetMusic) instance_destroy();
    } 
    else {
        var offset_x = 50 * image_xscale;
        var offset_y = -50;
        var music = instance_create_layer(x + offset_x, y + offset_y, "StaffLayer", obj_sheetMusic);
        music.visible = true;
    }
}

//-----------------------------------------
// 10) Health/Death Logic
//-----------------------------------------
health -= damage_taken;
if (health <= 0) 
{
    if (sprite_index != spr_death) {
        sprite_index = spr_death;
        image_speed  = 0.2;
    }
    instance_destroy(); // remove player
}