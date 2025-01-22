/// @description Set Cursor Details
window_set_cursor(cr_none);
if (room == rm_main_menu || room == rm_intro) {
	image_xscale = 1;
	image_yscale = 1;
} else {
	image_xscale = 0.5;
	image_yscale = 0.5;
}