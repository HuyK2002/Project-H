battleState ();

var _enemycount = array_length(global.enemies_for_encounter);
var _totalContentWidth = _enemycount * content.width ;
var _gap = (EnemyBox.width - _totalContentWidth) / ( _enemycount+1);
var _start = _gap;
enemy_portraits = []

for ( var _i = 0 ; _i < _enemycount; _i++) {
	var _position = EnemyBox.bounds.left + _gap * (_i+1) + content.width * _i + content.width /2 ;
	var _left = _position - content.width /2;
	var _top = EnemyBox.position.y - content.height/2;
	array_push(enemy_portraits, {
		sprite : global.enemies_for_encounter[_i].portrait,
		left : _left,
		top: _top,
	})
}	

var _playercount = array_length(global.party_setup);
_totalContentWidth = _playercount * content.width ;
 _gap = (PlayerBox.width - _totalContentWidth) / ( _playercount+1);
_start = _gap ;
player_portraits = []

for ( var _i = 0 ; _i < _playercount; _i++) {
	var _position = PlayerBox.bounds.left + _gap * (_i+1) + content.width * _i + content.width /2 ;
	var _left = _position - content.width /2;
	var _top = PlayerBox.position.y - content.height/2;
	array_push(player_portraits, {
		sprite : global.party_setup[_i].portrait,
		left : _left,
		top: _top,
	})
}	