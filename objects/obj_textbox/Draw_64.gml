

var draw_text_x = x;
var draw_text_y = y;
var draw_text_width = text_width;

var finished = text_progress == text_length;

if (sprite_exists(portrait_sprite)) 
{
	var draw_portrait_x = x + portrait_x;
	var draw_portrait_y = y + portrait_y - 40;
	var draw_portrait_xscale = 1;
	
	
	// What side is the portrait on?
	if (portrait_side == PORTRAIT_SIDE.RIGHTSIDE)
	{
		draw_portrait_x = x + width - portrait_width - portrait_x;
		draw_portrait_xscale = -1;
	}
	//animet the portrait
	var subimg = 0;
	if (!finished)
		subimg = (text_progress / text_speed) * (sprite_get_speed(portrait_sprite) / game_get_speed(gamespeed_fps));
		
	draw_sprite_ext(portrait_sprite, subimg,
		draw_portrait_x + portrait_width / 2, draw_portrait_y + portrait_height / 2,
		draw_portrait_xscale, 1, 0, c_white, 1);
	
}	

// Draw the box
draw_sprite_stretched(sprite_index, 0, x, y, width, height);
//speaker 
if (speaker_name != "") {
	// Expand the nameplate if the name is wider than the default width
	var name_w = max(string_width(speaker_name), speaker_width);
	
	draw_sprite_stretched(spr_name, 0, x + speaker_x, y + speaker_y - speaker_height / 2, name_w, speaker_height);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(speaker_font);
	draw_set_color(speaker_color);
	draw_text(x + speaker_x + name_w / 2, y + speaker_y, speaker_name);
}




// Text
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(text_font);
draw_set_color(text_color);
type(x + text_x, y + text_y, text, text_progress, text_width);



// Options
if (finished && option_count > 0) {
	draw_set_valign(fa_middle);
	draw_set_color(option_text_color);
	for (var i = 0; i < option_count; i++) {
		var opt_x = x + option_x ;
		var opt_y = y + option_y - (option_count - i - 1) * option_spacing;
		
		// Selected option is indented with an arrow
		if (i == current_option) {
			opt_x -= option_selection_indent;
			draw_sprite(spr_option_arrow, 0, opt_x + 100 , opt_y - 8);
		}
		
		draw_sprite_stretched(spr_option, 0, opt_x, opt_y - option_height / 2, option_width, option_height);
		draw_text(opt_x + option_text_x, opt_y, options[i].text);
	}
}



