global.topics = {};

global.topics[$ "BibooTax"] = [
	FONT(global.font_main),
	SPEAKER("Pebbles" , spr_pebbles, PORTRAIT_SIDE.LEFTSIDE),
	TEXT("You have make a huge mistake just by talking to me "),
	TEXT("And for that ...."),
	CUSTOM(function(textbox) {
     textbox.alarm[0] = 60;
     textbox.next();
}),
	TEXT("GET TAXED "),
];


global.topics[$ "Testing option"] = [
	FONT(global.font_main),
	SPEAKER("Amelia Watson" , spr_ame_portrait, PORTRAIT_SIDE.LEFTSIDE),
	TEXT("A!"),
	TEXT("It's Me Amelia Watson"),
	CHOICE("Who is your favorite Myth Member ?",
		OPTION("Gura", "chose gura"),
		OPTION("Kiara", "chose kiara"),
		OPTION("Calii", "chose calli"),
		OPTION("Ina", "chose ina"),
		OPTION("You" , "chose me"))
];

global.topics[$ "chose gura"] = [
	FONT(global.font_main),
	TEXT("Nice , gura is cute"),
	SPIN (obj_player, LEFT ),
	GOTO("Thanks")
];

global.topics[$ "chose kiara"] = [
	FONT(global.font_main),
	CAM(200 , 200 , 1),
	CAM(100 , 250 ,1 ),
	TEXT("I will tell Calli about this "),
	GOTO("Thanks")
];

global.topics[$ "chose calli"] = [
	FONT(global.font_main),
	TEXT("Are you sure about this?"),
	GOTO("Thanks")
];

global.topics[$ "chose ina"] = [
	FONT(global.font_main),
	TEXT("Game dev is that you ?"),
	FONT(global.font_ao),
	TEXT("Are we still in play testing ?"),
	GOTO("Thanks")
];

global.topics[$ "chose me"] = [
	FONT(global.font_main),
	TEXTR("AWWW thanks"),
	MOVETOR (obj_player, 20 , 20 ,1,LEFT),
	MOVETO (obj_player , 20 ,80, 1, UP),
	MOVETOR (obj_player, 500 , 500 ,1,RIGHT),
	GOTO("Thanks")
];

global.topics[$ "Thanks" ] = [
	FONT(global.font_main),
	TEXT("Ok, bye")
];	


global.topics[$ "Ao-chan"] = [
	FONT(global.font_main),
	SPEAKER("Amelia Watson" , spr_ame_portrait, PORTRAIT_SIDE.LEFTSIDE),
	TEXT("To make a takodachi we need to ..."),
	FONT(global.font_ao),
	SPEAKER("???????" , spr_the_acient_one, PORTRAIT_SIDE.LEFTSIDE),
	TEXT("YOU THERE"),
	TEXT("TURN BACK WHILE YOU CAN "),
	FONT(global.font_ao_red),
	TEXT("You have been warned"),
	
];
//Mumei hentai
global.topics[$ "mumei"]=[
	FONT(global.font_main),
	SPEAKER("Owl" , spr_mumei_big, PORTRAIT_SIDE.LEFTSIDE),
	TEXT("Oh hi!"),
	CHOICE("Do you by chance know what is this kanji mean ? ",
		OPTION("I miss you","Chose lie"),
		OPTION("Hentai","Chose truth" ))
];

global.topics[$ "Chose lie"]=[
	FONT(global.font_main_red),
	SPEAKER("Owl?", spr_mumei_scary,PORTRAIT_SIDE.LEFTSIDE),
	TEXT("YOU DIRTY LIAR "),
	FONT(global.font_main),
];

global.topics[$ "Chose truth"]=[
	FONT(global.font_main),
	TEXT("Oh..."),
	TEXT("Sorry for asking"),
];
