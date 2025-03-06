
if (!instance_exists(obj_textbox)) 
{
	instance_destroy();
	exit;
}

if (!instance_exists(obj_textbox))
{
	textbox.next();
	instance_destroy();
	exit;
}





var _distance_to_target = point_distance(obj_diologe_cam.x , obj_diologe_cam.y, x , y);
var _angle_to_target = point_direction(obj_diologe_cam.x , obj_diologe_cam.y, x , y );	



if _distance_to_target > spd
		{
			obj_diologe_cam.x += lengthdir_x(spd, _angle_to_target);
			obj_diologe_cam.y += lengthdir_y(spd, _angle_to_target);
	
		} else
		{
			obj_diologe_cam.x = x;
			obj_diologe_cam.y = y;
			textbox.next();
			instance_destroy();
		}
