/// @description Levitate health

// update levitation offset over time
levitate_offset += levitate_speed;

// apply levitation to y position
y += sin(levitate_offset) * levitate_amplitude;