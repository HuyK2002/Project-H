if room = rm_main exit;
{
// get inputs
up_key = keyboard_check_pressed(ord("W"));
down_key = keyboard_check_pressed(ord("S"));
accept_key = keyboard_check_pressed(vk_space);
esc_key = keyboard_check_pressed(vk_escape);

//check for the pausing state
if esc_key && room != rm_main && !instance_exists(obj_textbox)
{
  pausing = !pausing;
  pos = 0 ;
  menu_level = 0;
  if !pausing 
  {
	  instance_destroy(obj_pauser);
  }
}

// store number of option in current menu
op_length = array_length(option[menu_level]);

//move in menu
if pausing = true
{
	pos += down_key - up_key;
	if pos >= op_length {pos = 0};
	if pos < 0 {pos = op_length - 1};
}
//using the options

if accept_key && pausing = true {
	
	var _sml = menu_level
	
	
	switch(menu_level){
		
		//pause menu
		case 0:
		switch(pos){
			//continue
			case 0:
				pausing = false;
				instance_destroy(obj_pauser);
				break;

			//setting
			case 1:
				menu_level = 1;
				break;
		
			//save
			case 2:
				save_game();
				pausing = false;
				instance_destroy(obj_pauser);
				break;
				
			//	load
			case 3:
				load_game();
				pausing = false;
				instance_destroy(obj_pauser);
				
				break;

			//Save and exit
			case 4:
				pausing = false;
				save_game();
				instance_destroy(obj_pauser);
				instance_destroy(obj_player);
				room_goto(rm_main);
				
				break;
		}
		break;
	
		//setting 
		case 1:
		switch(pos){
			//window size
			case 0:
				
				break;
			//audio
			case 1:
				
				break;
			//controls
			case 2:
				
				break;	
			//back
			case 3:
				menu_level = 0;
				break;	
			}
			break;
	
	}
//set position back
if _sml != menu_level {pos = 0};

// correct option length
op_length = array_length(option[menu_level]);

}

}