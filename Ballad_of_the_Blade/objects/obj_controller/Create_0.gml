/// @description Overall Game Settings
global.font = font_add_sprite(spr_font, 32, true, 1);

// spawn mouse cursor
instance_create_layer(0, 0, "GUI", obj_cursor);