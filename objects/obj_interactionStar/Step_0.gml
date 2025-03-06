if interact == true
{ 
	
		startDialogue(topics[time]);
		time = min( time + 1 , array_length(topics) - 1) ;
		interact = false;
		
}	
	
	