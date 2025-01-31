show_debug_message("Collision with hazard detected!");

if (alarm[0] <= 0) // Only take damage if cooldown is over
{
    health -= 25;
    show_debug_message("Player took damage! Current Health: " + string(health));
    alarm[0] = 30; // Invincibility cooldown (30 steps)
}

// Check if health is zero or below
if (health <= 0) {
    show_debug_message("Player died!");
    room_restart(); // Restart only when health is depleted
}