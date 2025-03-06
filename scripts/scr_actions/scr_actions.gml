
#macro SPEAKER new SpeakerAction
#macro CHOICE new ChoiceAction
#macro OPTION new OptionAction
#macro GOTO new GotoAction
#macro FONT new FontPicking
#macro CUSTOM new CustomAction

//auto move to the next action when done
#macro TEXTR new TextActionRun
#macro MOVETOR new MoveToActionRun
#macro SPINR new LookAtRun
#macro WAIT new Waitfor

//wait for input
#macro TEXT new TextAction
#macro SPIN new LookAt
#macro MOVETO new MoveToAction

//camera
#macro CAM new  CameraSet 
#macro CAMR new  CameraSetRun 

function DialogueAction() constructor {
	act = function() { };
}

// Define new text to type out
function TextAction(_text) : DialogueAction() constructor {
	text = _text;

	act = function(textbox) {
		textbox.setText(text);
	}
}


// Define new text to type out
function TextActionRun(_text) : DialogueAction() constructor {
	text = _text;

	act = function(textbox) {
		textbox.setText(text);
		textbox.next();
	}
}

// Set the speaker, optionally its portrait and side the portrait is on
function SpeakerAction(_name, _sprite = undefined, _side = undefined): DialogueAction() constructor {
	name = _name;
	sprite = _sprite;
	side = _side;

	act = function(textbox) {
		textbox.speaker_name = name;
		
		if (!is_undefined(sprite))
			textbox.portrait_sprite = sprite;
			
		if (!is_undefined(side))
			textbox.portrait_side = side;
			
		textbox.next();
	}
}

// Define a branch in the dialogue
function ChoiceAction(_text) : DialogueAction() constructor {
	text = _text;

	// Fill this array with all the arguments after the first one
	options = [];
	for (var i = 1; i < argument_count; i++)
		array_push(options, argument[i]);

	act = function(textbox) {
		textbox.setText(text);
		textbox.options = options;
		textbox.option_count = array_length(options);
		textbox.current_option = 0;
	}
}

// Place options within the ChoiceAction
function OptionAction(_text, _topic): DialogueAction() constructor {
	text = _text;
	topic = _topic;

	act = function(textbox) {
		textbox.setTopic(topic);
	}
}

// Automatically go to a specified topic
function GotoAction(_topic): DialogueAction() constructor {
	topic = _topic;

	act = function(textbox) {
		textbox.setTopic(topic);
	}
}

// font chose
function FontPicking ( _font ): DialogueAction() constructor {
	font = _font
	
	act = function(textbox) {
        textbox.text_font = font;
        textbox.next();
    }
}

//custom
function CustomAction(_action) : DialogueAction() constructor {
    act = _action;

}

//moving player run
function MoveToActionRun (_obj , _to_x , _to_y ,_speed , _dir ) : DialogueAction()  constructor
{
	object = _obj;
	x = _to_x;
	y= _to_y;
	spd = _speed;
	dir = _dir;
	
	
	
	
	act =	function(textbox) 
	{
		
		var inst = instance_create_depth(x, y, 0, obj_move_controller);
		inst.object = object;
		inst.spd = spd;
		inst.textbox = textbox;
		object.face = dir;
	
	}	
}

//moving player wait for input
function MoveToAction (_obj , _to_x , _to_y ,_speed, _dir ) : DialogueAction()  constructor
{
	object = _obj;
	x = _to_x;
	y= _to_y;
	spd = _speed;
	dir = _dir
	
	
	
	act =	function(textbox) 
	{
		
		var inst = instance_create_depth(x, y, 0, obj_move_controller_1);
		inst.object = object;
		inst.spd = spd;
		inst.textbox = textbox;
		object.face = dir;
	
	}	
}



//spining player run
function LookAtRun (_obj , _dir  ) : DialogueAction()  constructor
{
	object = _obj; // player 
	dir = _dir;  // looking  where
	act =	function(textbox) 
	{
		
		object.face = dir;
		textbox.next();	
	}	
} 

//spining player wait for input
function LookAt (_obj , _dir  ) : DialogueAction()  constructor
{
	object = _obj; // player 
	dir = _dir;  // looking  where
	act =	function(textbox) 
	{
		
		object.face = dir;
	}	
} 



//wait for

function Waitfor ( _second ) :  DialogueAction()  constructor
{
	second = _second ;
	act =	function(textbox)
	{
		ticks = second * 60;
		
		var inst = instance_create_depth(0,0,0, obj_just_for_waiting);
		inst.textbox = textbox;
		inst.ticks = ticks
	}
}

//cam moving 

function CameraSet (_to_x , _to_y, _speed) :  DialogueAction()  constructor
{
	x = _to_x;
	y = _to_y;
	spd = _speed;
	
	act = function (textbox)
	{
		var inst = instance_create_depth(x, y, 0, obj_camDio);
		inst.spd = spd;
		inst.textbox = textbox;
	}
}

//cam moving 

function CameraSetRun (_to_x , _to_y, _speed) :  DialogueAction()  constructor
{
	x = _to_x;
	y = _to_y;
	spd = _speed;
	
	act = function (textbox)
	{
		var inst = instance_create_depth(x, y, 0, obj_camDio_1);
		inst.spd = spd;
		inst.textbox = textbox;
	}
}