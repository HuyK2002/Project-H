right_key = keyboard_check(ord("D")) || keyboard_check(vk_right);
up_key = keyboard_check(ord("W"))  || keyboard_check(vk_up); 
left_key = keyboard_check(ord("A")) || keyboard_check(vk_left); 
down_key = keyboard_check(ord("S")) || keyboard_check(vk_down); 
interactKeyPressed = keyboard_check_pressed(vk_space);





//stop or not stop with chat box
if (instance_exists(obj_textbox))
{
	
	if  !instance_exists (obj_move_controller ) && !instance_exists(obj_move_controller_1)
	{
	xspd = 0 ; yspd = 0;
	image_index = 0;
	sprite_index = sprite[face];
	
	exit;
	} 
	
	if  instance_exists(obj_move_controller) || instance_exists(obj_move_controller_1)
	{
		xspd = 0; yspd =0;
		image_speed = 1 ;
		sprite_index = sprite[face];
		exit;
		
	}	
	

}




//interact with the push blocks
if interactKeyPressed == true
{
	//find the 360 
	var _checkDir = face * 90;
	
	//see if we can find push box
	var _checkX = x + lengthdir_x(interactDist, _checkDir);
	var _checkY = y + lengthdir_y(interactDist, _checkDir);
	var _pushBlockInst = instance_place( _checkX, _checkY ,obj_Pushbox);
	var _interactionStar = instance_place( _checkX, _checkY ,obj_interactionStar);
	
	
	//if there is a pushbox , tell it where to slide
	if instance_exists(_pushBlockInst) && _pushBlockInst.sliding == false
	{
		_pushBlockInst.sliding = true;
		_pushBlockInst.faceDir = face;
	}	
	// for interaction star
	if instance_exists(_interactionStar) && _interactionStar.interact == false
	{
		_interactionStar.interact = true;
	}	
	
	
}
//get info for each state
#region  
  
  //movement state ( full control)
  if state == movementState
  {
	  //set the quality of state
	  movementControl = true;
	  autoSpriteControl = true;
	  animate = true;
	  //state swapping
	  if place_meeting(x, y, obj_IcePlayer) && ( xspd != 0 || yspd != 0 )
          { 
			  state = slidingState;
		  }
  }  
  
  // slding state 
  if state == slidingState
  { 
	  //set state
	  movementControl = false;
	  autoSpriteControl = false;
	  animate = false;
	  
	  //state swapping
	  if !place_meeting(x , y, obj_IcePlayer) || (xspd == 0 && yspd == 0 )
	  {
		  state = movementState;
	  }  
  }  

#endregion


//get xspd and yspd
if movementControl == true
{
	xspd = (right_key - left_key) * move_spd;
    yspd = (down_key - up_key) * move_spd;
}

//Pauser

if instance_exists(obj_pauser)
     {
     xspd = 0;
     yspd = 0;
     }




//set sprite
mask_index = sprite[DOWN];
if autoSpriteControl == true
{
	
if yspd == 0
     {
     if xspd > 0 {face = RIGHT}
     if xspd < 0 {face = LEFT};
     }
if xspd > 0 and face == LEFT	 {face = RIGHT};
if xspd < 0 and face == RIGHT	 {face = LEFT};

if xspd == 0
     {
     if yspd > 0 {face = DOWN};
	 if yspd < 0 {face = UP};
     }
if yspd > 0 and face == UP	 {face = DOWN};
if yspd < 0 and face == DOWN {face = UP};	 
sprite_index = sprite[face];
}







//collisions 
if place_meeting(x + xspd, y, obj_wall) == true
   {
	   xspd = 0;
   }x  += xspd;

if place_meeting(x, y + yspd, obj_wall) == true
   {
	   yspd = 0;
   } y  += yspd;


//idle animation ( 5 seacond couter)
 if xspd == 0 and yspd == 0 && !instance_exists(obj_pauser)
 {
	 last_input ++;
 } else { last_input = 0;}	
 
if last_input >= 300
{
	idleling = 1;
} else { idleling = 0;}






//animate
if animate == true
{
	image_speed = 1; 

if xspd == 0 and yspd == 0 && idleling == 0
    {
		image_index = 0;
		animate = 0 ;
	}
if idleling == 1
{
	image_speed = 1;
	sprite_index = spr_ame_idle;
	if instance_exists(obj_pauser)
	{image_speed = 0;
	}
}	

} else { image_speed = 0; } 


//get in combat zone 1

if place_meeting(x,y,obj_encounter_zone1)  && enter_combat_timer_active = false
{
	step_to_encouter_zone_1 = irandom_range(100, 150);
	enter_combat_timer_active = true; 
	encouter_zone_step_1 = 0;
}	 
	
	
if place_meeting(x,y,obj_encounter_zone1) &&  enter_combat_timer_active = true && ( xspd != 0  || yspd != 0 )
{
	encouter_zone_step_1 ++ ;
	
}	
	
if place_meeting(x,y,obj_encounter_zone1) && encouter_zone_step_1 >= step_to_encouter_zone_1 && enter_combat_timer_active = true 
	{

		var number_of_enemies = irandom_range(2, 3);
		var enemies_for_encounter = [];
		global.enemies_for_encounter = enemies_for_encounter;

		repeat(number_of_enemies) {
		    var random_index = irandom(array_length(global.zone_enemies.zone1 )- 1);
		    var random_enemy = global.zone_enemies.zone1[random_index];
		    array_push(enemies_for_encounter, random_enemy);
		
		}
		
	NewEncounter(enemies_for_encounter, global.party_setup, sbg_1);
	enter_combat_timer_active = false;
	
}






//depth

depth = -bbox_bottom;