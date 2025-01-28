//Create
//dont need yet? but maybe
//depth = -9999;

//textbox parameters
textbox_width = 360;
textbox_height = 100;
border = 15;
line_sep = 12;
line_width = textbox_width - border*2;
txtb_spr = spr_textbox;
txtb_img = 0;
txtb_img_spd = 6/60;

//the text
page = 0;
page_number = 0;
//default text
text[0] = "Test";
text_length[0] = string_length(text[0]);
draw_char = 0;
text_spd = 1;

setup = false;