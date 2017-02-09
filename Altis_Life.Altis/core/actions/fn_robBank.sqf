/*
file: fn_robbank.sqf
Author: MrKraken
Made from MrKrakens bare-bones shop robbing tutorial on www.altisliferpg.com forums
Description:
Executes the rob shob action!
Idea developed by PEpwnzya v1.0
*/
private["_robber","_shop","_name","_kassa","_ui","_progress","_pgText","_cP","_pos"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; //The object that has the action attached to it is _this. ,0, is the index of object, ObjNull is the default should there be nothing in the parameter or it's broken
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; //Can you guess? Alright, it's the player, or the "caller". The object is 0, the person activating the object is 1
_action = [_this,2] call BIS_fnc_param;//Action name
_pos = GetPos _shop;
if(playersNumber west < 5) exitWith { hint "Não há 5 policias online para roubar este banco!"};
if(side _robber != civilian) exitWith { hint "Você não pode roubar este banco!" };
if (vehicle player != _robber) exitWith { hint "Você precisa sair do veículo!" };
if !(alive _robber) exitWith {};
if (currentWeapon _robber == "") exitWith { hint "Você nao pode roubar este Banco sem uma arma!" };
if(_shop getVariable ["coolDown",false]) exitWith {hint "Você só pode roubar este Banco novamente depois de 30 minutos!"};
if(_shop getVariable["rip",false]) exitWith {hint "Este Banco já está sendo roubado!"};

_shop setVariable ["rip",true,true];


_kassa = 500000 + round(random 800000);
_shop switchMove "AmovPercMstpSsurWnonDnon";
_chance = random(100);
if(_chance >= 40) then { hint "O Gerente do Banco do Brasil acionou o alarme silencioso, a polícia foi avisada!"; [[1,format["ALARME!!! - O Banco Br.Team: %1 está sendo roubado!", _shop]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; };
[[1,format["%1 está roubando um posto de gasolina!", profileName]],"life_fnc_broadcast",true,false] spawn BIS_fnc_MP;
_marker = createMarker [format["Marker%1",_shop], _pos];
_marker setMarkerColor "ColorRed";
_marker setMarkerText "ATENÇÃO - O Banco do Brasil está sendo roubado!!!";
_marker setMarkerType "mil_warning";

[[getPlayerUID _robber,name _robber,"212B"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;


//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Roubo em progresso, mantenha-se no raio de 10 metros (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;

while{true} do
{
	sleep 5; //15 mintue robbery
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["Roubo em progresso, mantenha-se no raio de 10 metros (%1%2)...",round(_cP * 100),"%"];
	if(_cP >= 1) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(_robber distance _shop > 10) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if!(alive _robber) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	if(life_isTazed) exitWith {_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];};
	playSound3D ["A3\Sounds_F\sfx\alarm_blufor.wss", player]; //loop that shit
};

if(!(alive _robber)) exitWith
{
	deletemarker _marker;
	[_shop] spawn
	{
		private["_shop"];
		_shop = _this select 0;
		_shop setVariable ["coolDown",true,true];
		sleep 300;
		_shop setVariable ["coolDown",false,true];
	};
	_shop setVariable ["rip",false,true];
};
if(_robber distance _shop > 11) exitWith
{
	_shop switchMove "";
	hint "Você precisa estar no raio de 10 metros de distância para roubar o Banco! - A caixa eletrônico está fechado!";
	5 cutText ["","PLAIN"];
	deletemarker _marker;
    _ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
	//[["sounds\pol_gas_fail"],"life_fnc_clientSound",west,false] spawn BIS_fnc_MP;
	[_shop] spawn
	{
		private["_shop"];
		_shop = _this select 0;
		_shop setVariable ["coolDown",true,true];
		sleep 300;
		_shop setVariable ["coolDown",false,true];
	};
	_shop setVariable ["rip",false,true];
};
if(life_isTazed) exitWith
{
	_shop switchMove "";
	hint "Você foi eletrocutado, e o roubo falhou!";
	5 cutText ["","PLAIN"];
	deletemarker _marker;
    _ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
	[_shop] spawn
	{
		private["_shop"];
		_shop = _this select 0;
		_shop setVariable ["coolDown",true,true];
		sleep 300;
		_shop setVariable ["coolDown",false,true];
	};
	_shop setVariable ["rip",false,true];
};
5 cutText ["","PLAIN"];


_ui = "osefStatusBar" call BIS_fnc_rscLayer;_ui cutRsc["osefStatusBar","PLAIN"];
titleText[format["Você roubou  R$ %1, agora corre antes que a polícia chegue!",[_kassa] call life_fnc_numberText],"PLAIN"];
life_cash = life_cash + _kassa;
[[getPlayerUID _robber,name _robber,"211B"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
deletemarker _marker;
life_use_atm = false;
sleep (120 + random(180));
life_use_atm = true;
[[1,format["NEWS: O Banco do Brasil acaba de ser roubado, os ladrôes fugiram com:  R$ %1", [_kassa] call life_fnc_numberText]],"life_fnc_broadcast",civilian,false] spawn life_fnc_MP;

[_shop] spawn
{
	private["_shop"];
	_shop = _this select 0;
	_shop setVariable ["coolDown",true,true];
	sleep 1000;
	_shop setVariable ["coolDown",false,true];
};
_shop switchMove "";
_shop setVariable ["rip",false,true];