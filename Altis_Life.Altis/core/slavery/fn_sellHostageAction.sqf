/*
	File: fn_sellHostageAction.sqf
	@Foamy
	www.strainonline.com
	www.strainmod.com
	Description:
	Player Sale Action.
*/
private["_unit","_noesckey"];

_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
hint format["%1", _unit];
if(isNull _unit) exitWith {}; // There is no spoon
if(life_enslaved) exitWith {hint "Este jogador foi escravizado recentemente, você deve aguardar para escraviza-lo novamente!"}; // Target already Enslaved

// Disable Esc key
_noesckey = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((_this select 1) isEqualTo 1) then { true }"];

// Send player to slave pen
if (player getVariable "restrained" isEqualTo 1) then {
player setPos (getMarkerPos "slave_trader_center");
};

// Release the player
player setVariable["restrained",false,true];
player setVariable["escorting",false,true];
player setVariable["transporting",false,true];
//player setVariable["hostage",false,true];

// Set enslaved
player setVariable["enslaved",true,true];
life_enslaved = true;

titleText["Você foi vendido como um escravo! Trabalhe para ganhar sua liberdade!","PLAIN"];
hint "Você foi vendido como um escravo! Trabalhe para ganhar sua liberdade!";
sleep 15;
slave_task1 = player createSimpleTask ["slave_task_1"];
slave_task1 setSimpleTaskDescription ["Enrole 40 cigarros e retorne até mim para ganhar sua liberdade.","Enrole sua liberdade... ha, ha, ha.",""];
slave_task1 setTaskState "Assigned";
player setCurrentTask slave_task1;

// Keep player in there
[] spawn 
{
	while {life_enslaved && alive player} do 
	{
		if(player distance (getMarkerPos "slave_trader_center") > 40) then
		{	
			player setPos (getMarkerPos "slave_trader_center");
		};
	};
};

waitUntil {!life_enslaved};
(findDisplay 46) displayRemoveEventHandler ["KeyDown", _noesckey];