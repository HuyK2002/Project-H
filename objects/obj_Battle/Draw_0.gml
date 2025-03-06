draw_sprite(battleBackground,0,x,y);

//draw units in depth order
var _unitWithCurrentTurn = unitTurnOrder[turn].id;
for (var i = 0 ; i < array_length(unitRenderOrder); i ++)
{
	with (unitRenderOrder[i])
	{
		draw_self();
	}
}


var _enemycount = array_length(global.enemies_for_encounter);
var _playercount = array_length(global.party_setup);


//draw area for enemy
//draw_rectangle(EnemyBox.bounds.left, EnemyBox.bounds.top, EnemyBox.bounds.right, EnemyBox.bounds.bottom, true);


var _totalContentWidth = _enemycount * content.width;
var _gap = (EnemyBox.width - _totalContentWidth) / (_enemycount+1);
var _start = _gap;

for(var _i = 0; _i < _enemycount; _i++){
  var _position = EnemyBox.bounds.left + _gap * (_i+1) + content.width * _i + content.width / 2;
  var _left = _position - content.width / 2;
  var _top = EnemyBox.position.y - content.height / 2;
  draw_sprite(global.enemies_for_encounter[_i].portrait,0 , _left, _top);
  //draw health bar 
	draw_sprite_stretched(spr_enemiesBGbar,0, _left + 20, _top -10 ,25,1);
	draw_sprite_stretched(spr_enemiesHP,0,_left +20 ,_top -10 ,min((enemyUnits[_i].hp / enemyUnits [_i].hpMax)* 25,25) ,1);
	draw_sprite_stretched(spr_enemiesHPbar,0,_left + 20 ,_top -11 , 25 ,3);
	draw_text ( _left + 20,  _top -20 , $"{enemyUnits[_i].name}" )

}    


//draw area for player
//draw_rectangle(PlayerBox.bounds.left, PlayerBox.bounds.top, PlayerBox.bounds.right, PlayerBox.bounds.bottom, true);


var _totalContentWidth = _playercount * content.width;
var _gap = (PlayerBox.width - _totalContentWidth) / (_playercount+1);
var _start = _gap;

for(var _i = 0; _i < _playercount; _i++){
  var _position = PlayerBox.bounds.left + _gap * (_i+1) + content.width * _i + content.width / 2;
  var _left = _position - content.width / 2;
  var _top = PlayerBox.position.y - content.height / 2;
  draw_sprite(global.party_setup[_i].portrait,0 , _left, _top);
 
 	//draw name 
	draw_set_color(c_white);
	draw_text ( _left + 5,  _top + 40 , $"{partyUnits[_i].name}" );
	//health bar
	draw_sprite_stretched(spr_barBackground,0, _left + 10, _top + 50 ,51,9);
	draw_sprite_stretched(spr_player_HP,0,_left +10 ,_top + 51 ,min((partyUnits[_i].hp / partyUnits[_i].hpMax)* 50,50) ,healthbar_height-2);
	draw_sprite_stretched(spr_player_HPBar,0,_left ,_top + 50 , healthbar_width,healthbar_height);
	draw_set_color(c_white);
	if (partyUnits[_i].hp < (partyUnits[_i].hpMax * 0.5 ))  draw_set_color(c_orange);
	if (partyUnits[_i].hp <= 0 ) draw_set_color(c_red);
	draw_text(_left+ 12 , _top + 50 ,  $"{partyUnits[_i].hp}/{partyUnits[_i].hpMax}");
	
	//mana bar
	draw_sprite_stretched(spr_barBackground,0, _left + 5, _top + 60 ,51,9);
	draw_sprite_stretched(spr_player_mana,0,_left + 6 ,_top + 61 ,(partyUnits[_i].mp / partyUnits [_i].mpMax)* 50 ,manabar_height-2);
	draw_sprite_stretched(spr_player_manaBar,0,_left -6 ,_top + 60 , manabar_width,manabar_height);
	draw_set_color(c_white);
	if (partyUnits[_i].mp < (partyUnits[_i].mpMax * 0.5 ))  draw_set_color(c_orange);
	if (partyUnits[_i].mp <= 0 ) draw_set_color(c_red);
	draw_text(_left+ 8 , _top + 60 ,  $"{partyUnits[_i].mp}/{partyUnits[_i].mpMax}");
	

	


}    
