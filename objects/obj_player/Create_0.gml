xspd = 0;
yspd = 0;

move_spd = 1;
// sprite control 
sprite[RIGHT] = spr_Amelia_Watson_right;
sprite[UP] = spr_Amelia_Watson_up;
sprite[LEFT] = spr_Amelia_Watson_left;
sprite[DOWN] = spr_Amelia_Watson_down;

face = DOWN;

// for interaction
interactDist = 4;

// player state control
state = 0;
   movementState = 0;
   slidingState = 1;
   
   //state infomation
   movementControl = true; // get xpd and yspd base on state
   autoSpriteControl = true; // sprite control
   animate = true; //control the animation
   
   
//last_input
   last_input = 0;
  idleling = 0 ;
 
 //random encouter 
 encouter_zone_step_1 = 0 ;
 step_to_encouter_zone_1 = 0;
 enter_combat_timer_active = false ;

 