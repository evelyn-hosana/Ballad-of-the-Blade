//Create
//dont need yet? but maybe
//depth = -9999;

//textbox parameters
textbox_width = 900;
textbox_height = 300;
border = 50;
line_sep = 12;
line_width = textbox_width - border*2;
txtb_spr = spr_textbox;
txtb_img = 0;
txtb_img_spd = 6/60;

//the text
page = 0;
page_number = 0;
//default text
text[0] = "This is a test of the textbox";
text[1] = "This is ANOTHER test of the textbox";
text[2] = "Please stop testing the textbox";
text[3] = "Final text";
text_length[0] = string_length(text[0]);
draw_char = 0;
text_spd = 1;

setup = false;
