#macro view view_camera[0]





if (instance_exists(obj_diologe_cam))
	{
		var _x = clamp( obj_diologe_cam.x - view_width/2 ,0,room_width - view_width) ;
		var _y = clamp( obj_diologe_cam.y - view_height/2,0,room_height - view_height);
		camera_set_view_pos(view,_x,_y);
	}
else
{
	if (instance_exists(obj_player))
	{
		var _x = clamp( obj_player.x - view_width/2 ,0,room_width - view_width) ;
		var _y = clamp( obj_player.y - view_height/2,0,room_height - view_height);
		camera_set_view_pos(view,_x,_y);
		
	}
}


camera_set_view_size(view,view_width,view_height);