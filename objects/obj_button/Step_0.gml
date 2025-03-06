if place_meeting(x, y, obj_Pushbox) || place_meeting(x, y, obj_player)
{
	state = 1;
} else {
	state = 0;
}	


//show the button press
image_index = state;