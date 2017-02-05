/*
    File: fn_setupActions.sqf
    Author:

    Description:
    Master addAction file handler for all client-based actions.
*/
switch (playerSide) do {
    case civilian: {
        //Drop fishing net
        life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
        (surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
		//Unmask
		life_actions = life_actions + [player addAction[localize "STR_pAct_Unmask",life_fnc_unmask,"",1,false,true,"",' playerSide isEqualTo west OR playerSide isEqualTo civilian && !isNull cursorObject && cursorObject getVariable "masked" && player distance cursorObject < 3 && cursorObject isKindOf "Man" ']];
        //Rob person
        life_actions = life_actions + [player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
        !isNull cursorObject && player distance cursorObject < 3.5 && isPlayer cursorObject && animationState cursorObject isEqualTo "Incapacitated" && !(cursorObject getVariable ["robbed",false]) ']];
        //Gang
        life_actions = life_actions + [player addAction["<t color='#FF0000'>Capture Gang Location</t>",life_fnc_areaCapture,"",0,false,false,"",' ((typeOf cursorTarget) isEqualTo "Flag_Red_F") ']];
    };
	case west: {
	    //CopSeizeObjects
		life_actions = life_actions + [player addAction["<t color='#BBBB00'>Apreender Objetos do Chão</t>",life_fnc_seizeObjects,cursorTarget,0,false,false,"",'(count(nearestObjects [player,["weaponholder"],3])>0)']];
	    //Copenter
        life_actions = life_actions + [player addAction[localize "STR_pAct_DriverSeat",life_fnc_copEnter,"driver",200,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']];		
        life_actions = life_actions + [player addAction[localize "STR_pAct_PassengerSeat",life_fnc_copEnter,"passenger",100,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']]; 		
        life_actions = life_actions + [player addAction[localize "STR_pAct_GunnerSeat",life_fnc_copEnter,"gunner",100,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']]; 		
        life_actions = life_actions + [player addAction[localize "STR_pAct_GoOut",life_fnc_copEnter,"exit",100,false,false,"",'(vehicle player != player) && (locked(vehicle player)isEqualTo2)']];
		//Barriers
		player addaction ["Barreiras",life_fnc_barrier,[""],0,false,true,"","vehicle player isEqualTo player and BarrierOpen isEqualTo 0"];
        //Gang
        life_actions = life_actions + [player addAction["<t color='#FF0000'>Capture Gang Location</t>",life_fnc_areaCapture,"",0,false,false,"",' ((typeOf cursorTarget) isEqualTo "Flag_Red_F") ']];
    };
	case independent: {
	    //Medenter
		life_actions = life_actions + [player addAction[localize "STR_pAct_DriverSeat",life_fnc_medEnter,"driver",200,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']];		
        life_actions = life_actions + [player addAction[localize "STR_pAct_PassengerSeat",life_fnc_medEnter,"passenger",100,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']]; 		
        life_actions = life_actions + [player addAction[localize "STR_pAct_GunnerSeat",life_fnc_medEnter,"gunner",100,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 3.5']]; 		
        life_actions = life_actions + [player addAction[localize "STR_pAct_GoOut",life_fnc_medEnter,"exit",100,false,false,"",'(vehicle player != player) && (locked(vehicle player)isEqualTo2)']];
		player addaction ["Barreiras",life_fnc_barrier,[""],0,false,true,"","vehicle player isEqualTo player and BarrierOpen isEqualTo 0"];
    };
};
