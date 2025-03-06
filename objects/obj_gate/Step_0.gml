//match the state of the button
if instance_exists(button_obj)
{
	state = button_obj.state;

}	

//close 
if state == 0
{
	mask_index = sprite_index;
}	

//open
if state == 1
{
	mask_index = spr_Nocollision ;
}
//reflect state change
image_index = state;