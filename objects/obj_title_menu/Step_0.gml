// get inputs
up_key = keyboard_check_pressed(ord("W")) || keyboard_check(vk_up); 
down_key = keyboard_check_pressed(ord("S")) || keyboard_check(vk_down); 
accept_key = keyboard_check_pressed(vk_space);

// store number of option in current menu
op_length = array_length(option[menu_level]);

//move in menu
pos += down_key - up_key;
if pos >= op_length {pos = 0};
if pos < 0 {pos = op_length - 1};

//using the options

if accept_key{
	
	var _sml = menu_level
	
	
	switch(menu_level){
		// menu
		case 0:
		switch(pos){
			//new game
			
			case 0:
				
				room_goto(Room1);
				instance_create_layer(127 , 111 , "Instances" ,obj_player);
				
				break;

			//continue
			case 1:
				
				load_game()
			
				break;
		
			//setting
			case 2:
				menu_level = 1;
				break;

			//end
			case 3:
				game_end();
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