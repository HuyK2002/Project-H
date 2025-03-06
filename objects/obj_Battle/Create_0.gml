instance_deactivate_all(true)

units = [];
turn = 0;
unitTurnOrder = [];
unitRenderOrder = [];

enemy_portraits = [];
player_portraits = [];

turnCount = 0;
roundCount = 0;
battleWaitTimeFrames = 10;
battleWaitTimeRemaining = 0;
currentUser = noone;
currentAction = -1;
currentTargets = noone;

//draw HP and MP 
healthbar_width = 61 ;
healthbar_height = 9;
manabar_width = 63 ;
manabar_height = 9; 





//make enemies


EnemyBox = {
  width: display_get_gui_width()-100,
  height: 64,
  position: {x: (display_get_gui_width()) / 2, y: (display_get_gui_height() /2)- 60 }
}
EnemyBox.bounds = {
  left: EnemyBox.position.x - EnemyBox.width / 2, 
  top: EnemyBox.position.y - EnemyBox.height / 2,
  right: EnemyBox.position.x + EnemyBox.width / 2,
  bottom: EnemyBox.position.y + EnemyBox.height / 2
}

content = {
  width: sprite_get_width(global.enemies_for_encounter[0].portrait),
  height: sprite_get_height(global.enemies_for_encounter[0].portrait)


} 

for ( var i = 0 ; i < array_length(global.enemies_for_encounter); i ++ )
{
	enemyUnits[i] = instance_create_depth(x,y,depth-10,obj_battleUnitEnemy,global.enemies_for_encounter[i]);
	array_push(units , enemyUnits[i]);
}

//make party for player


PlayerBox = {
  width: display_get_gui_width(),
  height: 64,
  position: {x: display_get_gui_width() / 2, y: display_get_gui_height() - 50}
}
PlayerBox.bounds = {
  left: PlayerBox.position.x - PlayerBox.width / 2, 
  top: PlayerBox.position.y - PlayerBox.height / 2,
  right: PlayerBox.position.x + PlayerBox.width / 2,
  bottom: PlayerBox.position.y + PlayerBox.height / 2
}

content = {
  width: sprite_get_width(global.party_setup[0].portrait),
  height: sprite_get_height(global.party_setup[0].portrait)
} 

for ( var i = 0 ; i < array_length(global.party_setup); i ++ )
{
	partyUnits[i] = instance_create_depth(x,y,depth-10, obj_battleUnitPC,global.party_setup[i]);
	array_push(units , partyUnits[i]);
}






//Shuffle turn order
unitTurnOrder = array_shuffle(units);

//get render order
RefreshRenderOrder = function ()
{	
	unitRenderOrder = [];
	array_copy(unitRenderOrder, 0, units, 0, array_length(units));
	array_sort(unitRenderOrder, function( _1 , _2 )
	{
		return _1.x - _2.x ;
	});
}
RefreshRenderOrder();

function BattleStateSelectedAction ()
{
	//get the current unit
	var _unit = unitTurnOrder[turn];
	
	//is the unit dead / unuseable to act ?
	if (!instance_exists(_unit)) || ( _unit.hp <= 0)
	{
		battleState = BattleStateVictoryCheck;
		exit;
	}
	
	//Select an action to perform
	BeginAction(_unit.id , global.actionLibrary.tan_cong, _unit.id);
}

function BeginAction (_user , _action, _targets)
{
	currentUser = _user;
	currentAction = _action;
	currentTargets = _targets;
	if (!is_array(currentTargets)) currentTargets = [currentTargets];
	battleWaitTimeRemaining = battleWaitTimeFrames;
	with (_user)
	{
		acting = true ;
		if (!is_undefined(_action[$ "userAnimation"])) &&(!is_undefined(_user.sprite[$ _action.userAnimation]))
		{
			sprite_index = sprites[$ _action.userAnimation]	;
			image_index = 0;
		}
	}
	battleState = BattleStatePerformAction;
	
}

function BattleStatePerformAction()
{
	if ( currentUser.acting ) 	
	{
		//when it end , perform action effects
		if (currentUser.image_index>= currentUser.image_number -1)
		{
			with (currentUser)
			{
				image_index = 0;
				acting = false;
			}
			if (variable_struct_exists(currentAction , "effectSprite" ))
			{
				if (currentAction.effectOnTarget == MODE.ALWAYS) || ( ( currentAction.effectOnTarget == MODE.VARIES) &&  ( array_length(currentTargets) <= 1 ))
				{
					for (var _i = 0 ; _i < array_length(currentTargets); _i++)
					{
						instance_create_depth(currentTargets[_i].x , currentTargets[_i].y, currentTargets[_i].depth-1, obj_BattleEffect,{sprite_index: currentAction.effectSprite});
						
						
					}
				}
				else //play it at 0.0
				{
					var _effectSprite = currentAction.effectSprite
					if (variable_struct_exists(currentAction, "effectSpriteNoTarget" ) ) _effectSprite = currentAction._effectSpriteNoTarget;
					instance_create_depth(x,y,depth-100, obj_BattleEffect,{sprite_index: _effectSprite  });
					
				}
			}
			currentAction.func(currentUser,currentTargets);
			
		}
	}
	else //wait for delay
	{
		if ( !instance_exists(obj_BattleEffect))
		{
			battleWaitTimeRemaining --
			if (battleWaitTimeRemaining == 0)
			{
				battleState = BattleStateVictoryCheck;
			}
		}
	}
}

function BattleStateVictoryCheck()
{
	battleState = BattleStateTurnProgression;
}

function BattleStateTurnProgression()
{
	turnCount ++ ;
	turn ++;
	//loopturns
	if (turn > array_length(unitTurnOrder) -1 )
	{
		turn = 0;
		roundCount++;
	}
	battleState = BattleStateSelectedAction;
}

battleState = BattleStateSelectedAction;