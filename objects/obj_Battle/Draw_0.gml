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


for (var _i = 0 ; _i < array_length(enemy_portraits); _i++) {
	var _data = enemy_portraits[_i];
	draw_sprite( _data.sprite,0 , _data.left , _data.top);
  //draw health bar 
	draw_sprite_stretched(spr_enemiesBGbar,0, _data.left + 20, _data.top -10 ,25,1);
	draw_sprite_stretched(spr_enemiesHP,0,_data.left +20 ,_data.top -10 ,min((enemyUnits[_i].hp / enemyUnits [_i].hpMax)* 25,25) ,1);
	draw_sprite_stretched(spr_enemiesHPbar,0,_data.left + 20 ,_data.top -11 , 25 ,3);
	draw_text ( _data.left + 20,  _data.top -20 , $"{enemyUnits[_i].name}" )

}    


for (var _i = 0 ; _i < array_length(player_portraits); _i++ ) {
	var _data = player_portraits[_i];
	draw_sprite(_data.sprite,0 ,_data.left , _data.top);
 
 	//draw name 
	draw_set_color(c_white);
	draw_text ( _data.left + 5,  _data.top + 40 , $"{partyUnits[_i].name}" );
	//health bar
	draw_sprite_stretched(spr_barBackground,0, _data.left + 10, _data.top + 50 ,51,9);
	draw_sprite_stretched(spr_player_HP,0,_data.left +10 ,_data.top + 51 ,min((partyUnits[_i].hp / partyUnits[_i].hpMax)* 50,50) ,healthbar_height-2);
	draw_sprite_stretched(spr_player_HPBar,0,_data.left ,_data.top + 50 , healthbar_width,healthbar_height);
	draw_set_color(c_white);
	if (partyUnits[_i].hp < (partyUnits[_i].hpMax * 0.5 ))  draw_set_color(c_orange);
	if (partyUnits[_i].hp <= 0 ) draw_set_color(c_red);
	draw_text(_data.left+ 12 , _data.top + 50 ,  $"{partyUnits[_i].hp}/{partyUnits[_i].hpMax}");
	
	//mana bar
	draw_sprite_stretched(spr_barBackground,0, _data.left + 5, _data.top + 60 ,51,9);
	draw_sprite_stretched(spr_player_mana,0,_data.left + 6 ,_data.top + 61 ,(partyUnits[_i].mp / partyUnits [_i].mpMax)* 50 ,manabar_height-2);
	draw_sprite_stretched(spr_player_manaBar,0,_data.left -6 ,_data.top + 60 , manabar_width,manabar_height);
	draw_set_color(c_white);
	if (partyUnits[_i].mp < (partyUnits[_i].mpMax * 0.5 ))  draw_set_color(c_orange);
	if (partyUnits[_i].mp <= 0 ) draw_set_color(c_red);
	draw_text(_data.left+ 8 , _data.top + 60 ,  $"{partyUnits[_i].mp}/{partyUnits[_i].mpMax}");
	

	}    
