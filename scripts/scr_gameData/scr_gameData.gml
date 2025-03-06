global.actionLibrary = 
{
	tan_cong:
	{
		name : "Attack",
		description : "{0} attack!",
		subMenu : -1,
		targetRequired : true,
		targetEnemyBeDefault : true ,
		targetAll : MODE.NEVER ,
		effectSprite: spr_bonk,
		effectOnTarget: MODE.ALWAYS ,
		func : function ( _user , _targets )
		{
			var _damage = ceil(_user.atk + random_range(-_user.atk * 0.25, _user.atk * 0.5 ) );
			with ( _targets[0] ) hp = max (0 , hp - (max( 1, (_damage - def))));
			
		}
	}
}

enum MODE
{
	NEVER = 0 ,
	ALWAYS = 1 ,
	VARIES = 2 ,
}

//party data
global.party = [

	{
		name:"Amelia Watson",
		LV: 1,
		hp: 100,
		hpMax: 100,
		mp: 50,
		mpMax: 75,
		atk:20,
		def:20,
		sprites : {idle: spr_ame_combat},
		portrait : spr_ame_combat ,
		effect : [] ,
		actions: []
	}
	,
	{
		name:"Tanakashi Kiara",
		LV: 10,
		hp: 250,
		hpMax: 250,
		mp: 81,
		mpMax:120,
		atk:40,
		def:80,
		sprites : {idle: spr_kiara_portrait},
		portrait : spr_ame_combat ,
		effect : [] ,
		actions: []
	}
	,
	{
		name:"Garw Gura",
		LV: 25,
		hp: 300,
		hpMax: 300,
		mp: 200,
		mpMax: 210,
		atk:90,
		def:40,
		sprites : {idle: spr_kiara_portrait},
		portrait : spr_ame_combat ,
		effect : [] ,
		actions: []
	}
	,
	{
		name:"Ninomae Ina'nis",
		LV: 33,
		hp: 250,
		hpMax: 250,
		mp: 500,
		mpMax:500,
		atk:50,
		def:50,
		sprites : {idle: spr_kiara_portrait},
		portrait : spr_ame_combat ,
		effect : [] ,
		actions: []
	}
	,
	{
		name:"Calliope Mori",
		LV: 44,
		hp: 444,
		hpMax: 444,
		mp: 444,
		mpMax:444,
		atk:44,
		def:44,
		sprites : {idle: spr_kiara_portrait},
		portrait : spr_ame_combat ,
		effect : [] ,
		actions: []
	}
	
	
];
	


global.party_setup = [ global.party[0] , global.party[1] ];
	
	
	
	
	

global.enemies = [
 

	{
		name:"KFP",
		hp: 30,
		hpMax: 30,
		mp: 0,
		mpMax: 0,
		atk:5,
		def:10,
		sprites : {idle: spr_kfp},
		portrait : spr_kfp ,
		effect : [] ,
		actions: [],
		xpValue:15,
		AIscript : function()
		{
			//enemy turn AI goes here
		
		}
	}
	,
	{
		name:"little chicken",
		hp: 30,
		hpMax: 30,
		mp: 0,
		mpMax: 0,
		atk:5,
		def:10,
		sprites : {idle: spr_kfp2},
		portrait : spr_kfp2 ,
		effect : [] ,
		actions: [],
		xpValue:25,
		AIscript : function()
		{
			//enemy turn AI goes here
		
		}
	}
	,
	{
		name:"Shark",
		hp: 50,
		hpMax: 50,
		mp: 0,
		mpMax: 0,
		atk:10,
		def:15,
		sprites : {idle: spr_kfp},
		portrait : spr_kfp ,
		effect : [] ,
		actions: [],
		xpValue:35,
		AIscript : function()
		{
			//enemy turn AI goes here
		
		}
	}
] ;

// enemy zone 

global.zone_enemies = {
    zone1 : [global.enemies[0], global.enemies[1]],
    zone2 : [global.enemies[2]]
}