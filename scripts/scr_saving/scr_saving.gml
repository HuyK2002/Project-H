global.game_data = 

{
	
	
	room_data: {},
	current_room : {},

};


function save_game()

{
	
	save_room();
	
	
//edit the file 	
	var _string = json_stringify(global.game_data);
	var _file = file_text_open_write("time_pin.txt");
	file_text_write_string(_file , _string);
	
	
	
	file_text_close(_file);


}
function save_room()
{
	var _array = [];
	
	with(obj_player)
	{
		var _struct = 
		{
			object: object_get_name(object_index),
			x:x,
			y:y,
		}
		
		array_push( _array ,_struct );
	
	}
	struct_set(global.game_data.room_data, room_get_name(room),_array);
	global.game_data.current_room  = room_get_name(room);
	
}
function load_game()
{
	if (file_exists("time_pin.txt"))
	{
		var _file = file_text_open_read("time_pin.txt");
		
		var _json = file_text_read_string(_file);
		
		global.game_data = json_parse(_json);
		
		load_room();
		
		room_goto(asset_get_index(global.game_data.current_room));
		
		
		file_text_close(_file);
	}

}
function load_room()
{
	var _array = struct_get(global.game_data.room_data, room_get_name(room));
	
	if (_array != undefined)
	{
		instance_destroy(obj_player);
		
		for( var i = 0; i < array_length(_array);i +=1 )
		{
			var _struct = _array[i];
			
			instance_create_layer(_struct.x , _struct.y, "Instances", asset_get_index(_struct.object ) , _struct);
			
		}
	}
}

