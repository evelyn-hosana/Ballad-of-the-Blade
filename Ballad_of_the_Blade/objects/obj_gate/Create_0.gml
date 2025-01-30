// Gate create event
gate_open = false;       // Has the gate been triggered to open yet?
image_speed = 0;         // Start with the animation not playing
image_index = 0;         // Start at the first frame (fully closed)
collisionable = true; // We start closed, so collisions should block the player