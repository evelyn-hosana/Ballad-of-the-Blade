//Draw
var accept_key = keyboard_check_pressed(vk_enter);

var textbox_x = camera_get_view_x(view_camera[0]);
var textbox_y = camera_get_view_y(view_camera[0]) + 250;

//setup
if setup == false
{ 
	setup = true;
	
	// loop through the pages
	page_number = array_length(text);
	for(var p = 0; p<page_number;p++)
	{
		//find how many chars are on each page and store that nmber in the text length array
		text_length[p] = string_length(text[p]);
		//get the x position for the textbox
			//no character (center the textbox)
			text_x_offset[p] = 140;
	}
}

//typing the text
if draw_char <text_length[page]
	{
		draw_char+= text_spd;
		draw_char = clamp(draw_char,0,text_length[page]);
	}
	

//flip through pages
if accept_key
	{
		
		//if the typing is done
		if draw_char == text_length[page]
			{
				//next page
				if page < page_number-1
					{
						page++;
						draw_char = 0;
					}
				else 
					{
						instance_destroy();
					}
			}
		//if not done typing
		else
			{
				draw_char = text_length[page];
			}
				
	}
	
//draw the textbox
txtb_img += txtb_img_spd;
var txtb_spr_w = sprite_get_width(txtb_spr);
var txtb_spr_h = sprite_get_height(txtb_spr);

//back of textbox
draw_sprite_ext(txtb_spr,txtb_img,textbox_x + text_x_offset[page],textbox_y,textbox_width/txtb_spr_w,textbox_height/txtb_spr_h,0,c_white,1);

//draw the text
var _drawtext = string_copy(text[page],1,draw_char);
draw_text_ext_transformed(textbox_x + text_x_offset[page] +border, textbox_y +border,_drawtext,line_sep,line_width, 1, 1, 0);