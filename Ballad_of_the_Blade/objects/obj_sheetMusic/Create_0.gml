//Create Event
notes = [];  // Store added notes


/// Create Event of obj_sheetMusic

// Phase can be "intro", "active", etc.
phase = "treble"; 

// We’ll start with the treble animation sprite
sprite_index = spr_treble_animation;
image_speed = 2; // how fast the treble animation plays
image_index = 0;   // start from the first frame

// We’ll also fade in from transparent
image_alpha = 0;   // completely invisible at first

// If you need the sheet music’s final sprite name:
normalSprite = spr_sheetMusic;  // store for later use

// Store initial sprite dimensions
sheet_width = 0;                  // Start “rolled up” at width 0
target_width = sprite_get_width(spr_sheetMusic); 
                                   // The normal “final” width, e.g. 96
roll_speed = 8; 


sheet_height = sprite_get_height(spr_sheetMusic);