//what stage are we in
    //idle / not sliding
	  if sliding == false
	  {
		  //set our starting cood
		  startPointX = x;
		  startPointY = y;
		  
		  // reset movement speed
		  xspd = 0;
		  yspd = 0;
	  }
	  //pushbox Area
	  if place_meeting( x, y, obj_PushboxArea)
	  {
		  pushblockArea = true;
	  } else {
		  pushblockArea = false;
		  }
	      
	  //we're on ice
	   if place_meeting( x, y, obj_Icebox)
	   {
		   onIce = true;
	   } else {
		   onIce = false;
	   }
	  
	  //sliding 
	  if sliding == true
	  { 
		  // get the 360 we should move
		  var _realDir = faceDir * 90;
		  //get our target
		  var _targetXDist = lengthdir_x(gridSpace, _realDir);
		  var _targetYDist = lengthdir_y(gridSpace, _realDir);
		  targetX = startPointX + _targetXDist;
		  targetY = startPointY + _targetYDist;
		  
		  // if on ice - keep going till wall
		  if onIce == true
		  {
			  // reset our target X and target Y
			  targetX = startPointX;
			  targetY = startPointY;
			  
			  //search each space ahead to make sure there IS ice
			 while place_meeting(targetX + _targetXDist, targetY + _targetYDist, obj_Icebox) && !place_meeting(targetX + _targetXDist, targetY + _targetYDist,obj_wall)
			 {
				 targetX += _targetXDist;
				 targetY += _targetYDist;
			 }	 
		    
		  }
		  
		  //set the speed
		  var _targetDist = point_distance( x, y, targetX, targetY);
		  var _finalSpd = min(move_spd, _targetDist);
		  xspd = lengthdir_x( _finalSpd, _realDir );
		  yspd = lengthdir_y( _finalSpd, _realDir );
		  
		  //cancle movemet pushbox
		  if pushblockArea = true && !place_meeting(targetX, targetY, obj_PushboxArea)
		  {
			xspd = 0;
			yspd = 0;
		  }
		  
		  
		  // don't let the block move to grid space that has a wall in it
		  if place_meeting( targetX, targetY, obj_wall)
		  {
		     xspd = 0;
		     yspd = 0;
		  }
		  //done with sliding
          if xspd == 0 && yspd == 0
          {
	          sliding = false;
          }	
		  
		  
	  }
	  
//move 
x += xspd;
y += yspd;



//depth
depth = -bbox_bottom;