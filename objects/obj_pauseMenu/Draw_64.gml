draw_set_font(global.font_main)


//get width and hight of menu
var _new_w = 0;
for (var i = 0; i < op_length; i++)
	{
	var _op_w = string_width(option[menu_level, i]);
	_new_w = max(_new_w ,_op_w);

	}

width = _new_w + op_border*2;
height = op_border*2 + string_height(option[0, 0]) + (op_length - 1)*op_space;




//condition for open it 
if pausing == true {
	//draw the menu background
	draw_set_alpha(0.5);
	draw_set_color(c_black);
	draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),0);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_sprite_stretched(spr_escMenu , 0 , x, y, width, height);
	instance_create_layer(0,0,"Instances",obj_pauser);

	//draw the option

	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	for (var i = 0; i < op_length; i++)
		{
			var _c = c_white;
			if pos == i {_c = c_yellow ; draw_sprite_stretched(spr_menu_picking, 0 , x+10, y + 10 + op_space*i, 55, 15 )};
		
			draw_text_color(x + op_border, y + op_border + op_space*i ,option[menu_level, i], _c, _c ,_c, _c, 1);
		
		}


}	

if pausing == false { } 
	