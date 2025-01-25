/// @description Draw Player Interaction Indication

if (show_indicator) {
    // scale world coordinates to GUI coordinates
    var camera_width = camera_get_view_width(view_camera[0]);
    var camera_height = camera_get_view_height(view_camera[0]);
    var viewport_width = display_get_gui_width();
    var viewport_height = display_get_gui_height();

    var scale_x = viewport_width / camera_width;
    var scale_y = viewport_height / camera_height;

    // convert NPC world position to screen-space
    var screen_x = (x - camera_get_view_x(view_camera[0])) * scale_x;
    var screen_y = (y - camera_get_view_y(view_camera[0])) * scale_y;

    var indicator_text = "Press E to interact";
    var text_width = string_width(indicator_text);
    var text_height = string_height(indicator_text);

    // position indicator above NPC
    var indicator_x = screen_x;
    var indicator_y = screen_y - sprite_height * scale_y - 20;

    // draw rectangle background for text
    draw_set_color(c_black);
    draw_set_alpha(0.7);
    draw_rectangle(indicator_x - text_width / 2 - 4, indicator_y - text_height / 2 - 4,
                   indicator_x + text_width / 2 + 4, indicator_y + text_height / 2 + 4, false);

    // draw text
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_text(indicator_x, indicator_y, indicator_text);
}