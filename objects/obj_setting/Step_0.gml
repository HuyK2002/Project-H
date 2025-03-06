if instance_exists(obj_textbox ) && cam_spawned == false
{
	instance_create_depth(obj_player.x , obj_player.y ,0 , obj_diologe_cam );
	cam_spawned = true ;
}

if !instance_exists(obj_textbox)
{
	instance_destroy(obj_diologe_cam);
	cam_spawned = false ;
}