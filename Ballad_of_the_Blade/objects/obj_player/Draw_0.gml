/// @description Draw Self and Healthbar
draw_self();

if (room != rm_main_menu && room != rm_intro) {
	/// Healthbar settings
	var cam_x = camera_get_view_x(view_camera[0]);
	var cam_y = camera_get_view_y(view_camera[0]);
	var cam_height = camera_get_view_height(view_camera[0]);

	var healthbar_x = cam_x;
	var healthbar_y = cam_y + cam_height; // bottom-left corner of camera

	// draw overall health bar (frame 0)
	draw_sprite(spr_healthbar, 0, healthbar_x, healthbar_y);

	// calculate scale factor for filling based on player health
	var health_ratio = health / max_health;

	// draw filling
	draw_sprite_ext(
	    spr_healthbar, 
	    1, // frame index
	    healthbar_x, healthbar_y, // position (bottom-left corner)
	    health_ratio, 1, // xscale (proportional to health), yscale (unchanged)
	    0, // rotation
	    c_white, // color
	    1 // alpha
	);
}