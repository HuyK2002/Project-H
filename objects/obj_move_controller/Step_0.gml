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





var _distance_to_target = point_distance(object.x , object.y, x , y);
var _angle_to_target = point_direction(object.x , object.y, x , y );	



if _distance_to_target > spd
		{
			object.x += lengthdir_x(spd, _angle_to_target);
			object.y += lengthdir_y(spd, _angle_to_target);
	
		} else
		{
			object.x = x;
			object.y = y;
			textbox.next();
			instance_destroy();
		}
