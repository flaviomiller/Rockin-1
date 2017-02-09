// by ALIAS
// Searchlight DEMO
// Tutorial: https://www.youtube.com/user/aliascartoons
// [[[_veh_armed_svr],"AL_light\al_search_light_effect.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;

private ["_unghi_vert","_search_light_0","_search_light_31","_search_light_32","_poz_0","_poz_31","_poz_32","_pos_search_end","_poz_abs","_poz_rel","_unghi_search","_unghi_car","_poz_lit","_dir_gun","_flash_light","_veh_armed","_veh_turr_beg","_veh_turr_end","_search_light_1","_search_light_2","_search_light_3","_search_light_4","_search_light_5","_search_light_6","_search_light_7","_search_light_8","_search_light_9","_search_light_91","_search_light_92","_search_light_end","_poz_1","_poz_2","_poz_3","_poz_4","_poz_5","_poz_6","_poz_7","_poz_8","_poz_9","_poz_91","_poz_92","_poz_end"];

if (!hasInterface) exitWith {};

_veh_armed = _this select 0;

_veh_turr_beg = getText (configfile >> "CfgVehicles" >> (typeOf _veh_armed) >> "Turrets" >> "MainTurret" >> "gunBeg");
_veh_turr_end = getText (configfile >> "CfgVehicles" >> (typeOf _veh_armed) >> "Turrets" >> "MainTurret" >> "gunEnd");

// ======================= search light source simulation - comment lines bellow if you don't want it =======================

_obiect_search = createVehicle ["Land_FloodLight_F", getpos _veh_armed, [], 0, "CAN_COLLIDE"];
_obiect_search attachTo [_veh_armed, [0.13,0,-0.2], _veh_turr_end]; 

/*
_flash_light = "#lightpoint" createVehicle position _veh_armed;  
_flash_light setLightAmbient [.9,.8,.5];  
_flash_light setLightColor [.9,.8,.5];
_flash_light setLightIntensity 1000;
_flash_light setLightUseFlare true;
_flash_light setLightFlareSize 0.5;
_flash_light setLightFlareMaxDistance 1000;
_flash_light setLightAttenuation [1,20,20,500,0.5,5]; 
_flash_light setLightDayLight true;
_flash_light attachTo [_veh_armed, [0,0,-0.01],_veh_turr_end];

_flash_light = "#lightpoint" createVehicle position _obiect_search;  
_flash_light setLightAmbient [.9,.8,.5];  
_flash_light setLightColor [.9,.8,.5];
_flash_light setLightIntensity 1000;
_flash_light setLightUseFlare true;
_flash_light setLightFlareSize 0.5;
_flash_light setLightFlareMaxDistance 1000;
_flash_light setLightAttenuation [1,20,20,500,0.5,5]; 
_flash_light setLightDayLight true;
_flash_light attachTo [_obiect_search, [0,0,0]];
*/
// ^^^^^^^^^^^^^^^^ end search light source simulation ===============================================================

_search_light_0 = "#lightpoint" createVehicle position _veh_armed;  
_search_light_0 setLightAmbient [.9,.8,.5];  
_search_light_0 setLightColor [.9,.8,.5];
_search_light_0 setLightIntensity 1000;
_search_light_0 setLightUseFlare true;
_search_light_0 setLightFlareSize 0;
_search_light_0 setLightFlareMaxDistance 2000;
_search_light_0 setLightAttenuation [/*start*/ 2000, /*constant*/60, /*linear*/ 1, /*quadratic*/ 200, /*hardlimitstart*/0.5,/* hardlimitend*/1]; 
_search_light_0 setLightDayLight true;

_search_light_1 = "#lightpoint" createVehicle position _veh_armed;  
_search_light_1 setLightAmbient [.9,.8,.5];  
_search_light_1 setLightColor [.9,.8,.5];
_search_light_1 setLightIntensity 1000;
_search_light_1 setLightUseFlare true;
_search_light_1 setLightFlareSize 0;
_search_light_1 setLightFlareMaxDistance 2000;
_search_light_1 setLightAttenuation [/*start*/ 2000, /*constant*/60, /*linear*/ 1, /*quadratic*/ 200, /*hardlimitstart*/1,/* hardlimitend*/2]; 
_search_light_1 setLightDayLight true;

_search_light_2 = "#lightpoint" createVehicle position _veh_armed;  
_search_light_2 setLightAmbient [.9,.8,.5];  
_search_light_2 setLightColor [.9,.8,.5];
_search_light_2 setLightIntensity 1000;
_search_light_2 setLightUseFlare true;
_search_light_2 setLightFlareSize 0;
_search_light_2 setLightFlareMaxDistance 2000;
_search_light_2 setLightAttenuation [/*start*/ 2000, /*constant*/70, /*linear*/ 1, /*quadratic*/ 200, /*hardlimitstart*/1.5,/* hardlimitend*/3]; 
_search_light_2 setLightDayLight true;

_search_light_3 = "#lightpoint" createVehicle position _veh_armed;  
_search_light_3 setLightAmbient [.9,.8,.5];  
_search_light_3 setLightColor [.9,.8,.5];
_search_light_3 setLightIntensity 1000;
_search_light_3 setLightUseFlare true;
_search_light_3 setLightFlareSize 0;
_search_light_3 setLightFlareMaxDistance 2000;
_search_light_3 setLightAttenuation [/*start*/ 2000, /*constant*/50, /*linear*/ 1, /*quadratic*/ 200, /*hardlimitstart*/2,/* hardlimitend*/4]; 
_search_light_3 setLightDayLight true;


_search_light_31 = "#lightpoint" createVehicle position _veh_armed;  
_search_light_31 setLightAmbient [.9,.8,.5];  
_search_light_31 setLightColor [.9,.8,.5];
_search_light_31 setLightIntensity 1000;
_search_light_31 setLightUseFlare true;
_search_light_31 setLightFlareSize 0;
_search_light_31 setLightFlareMaxDistance 2000;
_search_light_31 setLightAttenuation [/*start*/ 2000, /*constant*/50, /*linear*/ 1, /*quadratic*/ 200, /*hardlimitstart*/2.5,/* hardlimitend*/5]; 
_search_light_31 setLightDayLight true;

_search_light_32 = "#lightpoint" createVehicle position _veh_armed;  
_search_light_32 setLightAmbient [.9,.8,.5];  
_search_light_32 setLightColor [.9,.8,.5];
_search_light_32 setLightIntensity 1000;
_search_light_32 setLightUseFlare true;
_search_light_32 setLightFlareSize 0;
_search_light_32 setLightFlareMaxDistance 2000;
_search_light_32 setLightAttenuation [/*start*/ 2000, /*constant*/50, /*linear*/ 1, /*quadratic*/ 200, /*hardlimitstart*/3,/* hardlimitend*/6]; 
_search_light_32 setLightDayLight true;

_search_light_4 = "#lightpoint" createVehicle position _veh_armed;  
_search_light_4 setLightAmbient [.9,.8,.5];  
_search_light_4 setLightColor [.9,.8,.5];
_search_light_4 setLightIntensity 1000;
_search_light_4 setLightUseFlare true;
_search_light_4 setLightFlareSize 0;
_search_light_4 setLightFlareMaxDistance 2000;
_search_light_4 setLightAttenuation [/*start*/ 2000, /*constant*/50, /*linear*/ 1, /*quadratic*/ 200, /*hardlimitstart*/3.5,/* hardlimitend*/7]; 
_search_light_4 setLightDayLight true;

_search_light_5 = "#lightpoint" createVehicle position _veh_armed;  
_search_light_5 setLightAmbient [.9,.8,.5];  
_search_light_5 setLightColor [.9,.8,.5];
_search_light_5 setLightIntensity 1000;
_search_light_5 setLightUseFlare true;
_search_light_5 setLightFlareSize 0;
_search_light_5 setLightFlareMaxDistance 2000;
_search_light_5 setLightAttenuation [/*start*/ 2000, /*constant*/50, /*linear*/ 1, /*quadratic*/ 200, /*hardlimitstart*/4,/* hardlimitend*/8]; 
_search_light_5 setLightDayLight true;

_search_light_6 = "#lightpoint" createVehicle position _veh_armed;  
_search_light_6 setLightAmbient [.9,.8,.5];  
_search_light_6 setLightColor [.9,.8,.5];
_search_light_6 setLightIntensity 1000;
_search_light_6 setLightUseFlare true;
_search_light_6 setLightFlareSize 0;
_search_light_6 setLightFlareMaxDistance 2000;
_search_light_6 setLightAttenuation [/*start*/ 2000, /*constant*/50, /*linear*/ 1, /*quadratic*/ 200, /*hardlimitstart*/4.5,/* hardlimitend*/9]; 
_search_light_6 setLightDayLight true;

_search_light_7 = "#lightpoint" createVehicle position _veh_armed;  
_search_light_7 setLightAmbient [.9,.8,.5];  
_search_light_7 setLightColor [.9,.8,.5];
_search_light_7 setLightIntensity 1000;
_search_light_7 setLightUseFlare true;
_search_light_7 setLightFlareSize 0;
_search_light_7 setLightFlareMaxDistance 2000;
_search_light_7 setLightAttenuation [/*start*/ 2000, /*constant*/50, /*linear*/ 1, /*quadratic*/ 200, /*hardlimitstart*/5,/* hardlimitend*/10]; 
_search_light_7 setLightDayLight true;

_search_light_8 = "#lightpoint" createVehicle position _veh_armed;  
_search_light_8 setLightAmbient [.9,.8,.5];  
_search_light_8 setLightColor [.9,.8,.5];
_search_light_8 setLightIntensity 1000;
_search_light_8 setLightUseFlare true;
_search_light_8 setLightFlareSize 0;
_search_light_8 setLightFlareMaxDistance 2000;
_search_light_8 setLightAttenuation [/*start*/ 2000, /*constant*/50, /*linear*/ 1, /*quadratic*/ 200, /*hardlimitstart*/5.5,/* hardlimitend*/11]; 
_search_light_8 setLightDayLight true;

_search_light_9 = "#lightpoint" createVehicle position _veh_armed;  
_search_light_9 setLightAmbient [.9,.8,.5];  
_search_light_9 setLightColor [.9,.8,.5];
_search_light_9 setLightIntensity 1000;
_search_light_9 setLightUseFlare true;
_search_light_9 setLightFlareSize 0;
_search_light_9 setLightFlareMaxDistance 2000;
_search_light_9 setLightAttenuation [/*start*/ 2000, /*constant*/50, /*linear*/ 1, /*quadratic*/ 200, /*hardlimitstart*/6,/* hardlimitend*/12]; 
_search_light_9 setLightDayLight true;

_search_light_91 = "#lightpoint" createVehicle position _veh_armed;  
_search_light_91 setLightAmbient [.9,.8,.5];  
_search_light_91 setLightColor [.9,.8,.5];
_search_light_91 setLightIntensity 1000;
_search_light_91 setLightUseFlare true;
_search_light_91 setLightFlareSize 0;
_search_light_91 setLightFlareMaxDistance 2000;
_search_light_91 setLightAttenuation [/*start*/ 2000, /*constant*/50, /*linear*/ 1, /*quadratic*/ 200, /*hardlimitstart*/6.5,/* hardlimitend*/13]; 
_search_light_91 setLightDayLight true;

_search_light_92 = "#lightpoint" createVehicle position _veh_armed;  
_search_light_92 setLightAmbient [.9,.8,.5];  
_search_light_92 setLightColor [.9,.8,.5];
_search_light_92 setLightIntensity 1000;
_search_light_92 setLightUseFlare true;
_search_light_92 setLightFlareSize 0;
_search_light_92 setLightFlareMaxDistance 2000;
_search_light_92 setLightAttenuation [/*start*/ 2000, /*constant*/50, /*linear*/ 1, /*quadratic*/ 200, /*hardlimitstart*/7,/* hardlimitend*/14]; 
_search_light_92 setLightDayLight true;

_search_light_end = "#lightpoint" createVehicle position _veh_armed;  
_search_light_end setLightAmbient [.9,.8,.5];  
_search_light_end setLightColor [.9,.8,.5];
_search_light_end setLightIntensity 1000;
_search_light_end setLightUseFlare true;
_search_light_end setLightFlareSize 0;
_search_light_end setLightFlareMaxDistance 2000;
_search_light_end setLightAttenuation [2000, 50, 1,200,10,16]; 
_search_light_end setLightDayLight true;

_unghi_search = direction _veh_armed;
_weapon_vek = currentWeapon _veh_armed;

while {alive _veh_armed} do {
	_unghi_car = (direction _veh_armed) mod 360;
	_dir_gun = [_veh_armed selectionPosition _veh_turr_end,_veh_armed selectionPosition _veh_turr_beg] call BIS_fnc_vectorFromXToY;
	//hint str _dir_gun;
	_unghi_gun = (_dir_gun select 0) atan2 (_dir_gun select 1);
//	_unghi_gun=Deg (_veh_armed AnimationPhase "MainTurret"); valorile sunt inversate la unghi
	_unghi_vert = _dir_gun select 2;
	if (_unghi_gun >= 0) then {_unghi_search = (direction _veh_armed + _unghi_gun)mod 360} else {_unghi_search = (direction _veh_armed + (360+_unghi_gun))mod 360};
	_unghi_search = round _unghi_search;
	_elevation = 74*sin (deg _unghi_vert);
//	hint str _unghi_vert;
//	systemChat format ["%1 , %2, %3", _unghi_car, _unghi_gun,_unghi_search];
	_poz_rel = _veh_armed selectionPosition _veh_turr_beg;
	_poz_abs = [getPosASL _veh_armed select 0,getPosASL _veh_armed select 1,_elevation];
	_pos_search_end = [_poz_abs, 74, _unghi_search] call BIS_fnc_relPos;
	_search_light_end setPos _pos_search_end;
	
	_obiect_search setDir _unghi_gun-90;

//	_poz_fl	 = [[getPosASL _veh_armed select 0,getPosASL _veh_armed select 1,0.3*sin (deg _unghi_vert)], 0.3, _unghi_search] call BIS_fnc_relPos;
	
	_poz_0	 = [[getPosASL _veh_armed select 0,getPosASL _veh_armed select 1,2*sin (deg _unghi_vert)], 2, _unghi_search] call BIS_fnc_relPos;
	_poz_1	 = [[getPosASL _veh_armed select 0,getPosASL _veh_armed select 1,4*sin (deg _unghi_vert)], 4, _unghi_search] call BIS_fnc_relPos;
	_poz_2	 = [[getPosASL _veh_armed select 0,getPosASL _veh_armed select 1,6*sin (deg _unghi_vert)], 6, _unghi_search] call BIS_fnc_relPos;
	_poz_3	 = [[getPosASL _veh_armed select 0,getPosASL _veh_armed select 1,8*sin (deg _unghi_vert)], 8, _unghi_search] call BIS_fnc_relPos;
	
	_poz_31	 = [[getPosASL _veh_armed select 0,getPosASL _veh_armed select 1,12*sin (deg _unghi_vert)], 12, _unghi_search] call BIS_fnc_relPos;
	_poz_32	 = [[getPosASL _veh_armed select 0,getPosASL _veh_armed select 1,16*sin (deg _unghi_vert)], 16, _unghi_search] call BIS_fnc_relPos;

	_poz_4	 = [[getPosASL _veh_armed select 0,getPosASL _veh_armed select 1,22*sin (deg _unghi_vert)], 22, _unghi_search] call BIS_fnc_relPos;
	_poz_5	 = [[getPosASL _veh_armed select 0,getPosASL _veh_armed select 1,28*sin (deg _unghi_vert)], 28, _unghi_search] call BIS_fnc_relPos;
	_poz_6	 = [[getPosASL _veh_armed select 0,getPosASL _veh_armed select 1,34*sin (deg _unghi_vert)], 34, _unghi_search] call BIS_fnc_relPos;
	_poz_7	 = [[getPosASL _veh_armed select 0,getPosASL _veh_armed select 1,40*sin (deg _unghi_vert)], 40, _unghi_search] call BIS_fnc_relPos;
	_poz_8	 = [[getPosASL _veh_armed select 0,getPosASL _veh_armed select 1,46*sin (deg _unghi_vert)], 46, _unghi_search] call BIS_fnc_relPos;
	_poz_9	 = [[getPosASL _veh_armed select 0,getPosASL _veh_armed select 1,52*sin (deg _unghi_vert)], 52, _unghi_search] call BIS_fnc_relPos;
	_poz_91	 = [[getPosASL _veh_armed select 0,getPosASL _veh_armed select 1,58*sin (deg _unghi_vert)], 58, _unghi_search] call BIS_fnc_relPos;
	_poz_92  = [[getPosASL _veh_armed select 0,getPosASL _veh_armed select 1,64*sin (deg _unghi_vert)], 64, _unghi_search] call BIS_fnc_relPos;
	
//	_flash_light setPos _poz_fl;
	_search_light_0 setPos _poz_0;
	_search_light_1 setPos _poz_1;
	_search_light_2 setPos _poz_2;
	_search_light_3 setPos _poz_3;
	
	_search_light_31 setPos _poz_31;
	_search_light_32 setPos _poz_32;

	_search_light_4 setPos _poz_4;
	_search_light_5 setPos _poz_5;
	_search_light_6 setPos _poz_6;
	_search_light_7 setPos _poz_7;
	_search_light_8 setPos _poz_8;
	_search_light_9 setPos _poz_9;
	_search_light_91 setPos _poz_91;
	_search_light_92 setPos _poz_92;

	sleep 0.05;
};
//deleteVehicle _flash_light;
deleteVehicle _search_light_0;
deleteVehicle _search_light_end;
deleteVehicle _search_light_1;
deleteVehicle _search_light_2;
deleteVehicle _search_light_3;
deleteVehicle _search_light_31;
deleteVehicle _search_light_32;
deleteVehicle _search_light_4;
deleteVehicle _search_light_5;
deleteVehicle _search_light_6;
deleteVehicle _search_light_7;
deleteVehicle _search_light_8;
deleteVehicle _search_light_9;
deleteVehicle _search_light_91;
deleteVehicle _search_light_92;