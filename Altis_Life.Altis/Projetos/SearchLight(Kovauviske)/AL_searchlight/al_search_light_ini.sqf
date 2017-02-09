private ["_object_with_searchlight"];

if (!isServer) exitWith {};

_object_with_searchlight = _this select 0;

if (_object_with_searchlight isKindOf "air") then {
	[[[_object_with_searchlight,[0,55],[1, 1, 1],10],"AL_searchlight\al_search_effect_heli.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;
} else {
	[[[_object_with_searchlight],"AL_searchlight\al_search_light_effect.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;
};