// by ALIAS
// Searchlight DEMO
// Tutorial: https://www.youtube.com/user/aliascartoons
// [[[_search_source,_search_coord,_color_search,_bri_search],"AL_light\al_search_effect_heli.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;

private ["_ob_source_search","_coord_search_lit","_color_source_search","_bri_source_search","_lightjos","_coord_x","_coord_y","_coord_z"];

if (!hasInterface) exitWith {};

_ob_source_search 		= _this select 0;
_coord_search_lit		= _this select 1;
_color_source_search	= _this select 2;
_bri_source_search		= _this select 3;

//[[player,["lightOn", _ob_source_search]],"action",true,true] spawn BIS_fnc_MP;
//null=[[player,["lightOn", this]],"action",true,true] spawn BIS_fnc_MP;
//this setPilotLight true;

_coord_x = _coord_search_lit select 0;
_coord_y = _coord_search_lit select 1;
_coord_z = getPosATL _ob_source_search select 2;

/* block below simulates the light source of the searchlight if you want it to show just un-comment
_flash_light = "#lightpoint" createVehicle position _ob_source_search;  
_flash_light setLightAmbient [.9,.8,.5];  
_flash_light setLightColor [.9,.8,.5];
_flash_light setLightIntensity 500;
_flash_light setLightUseFlare true;
_flash_light setLightFlareSize 0.1;
_flash_light setLightFlareMaxDistance 500;
_flash_light setLightAttenuation [0.2,50,50,500,10,11]; 
_flash_light setLightDayLight true;
_flash_light attachTo [_ob_source_search, [0,2,-1]];
*/

_lightjos = "#lightpoint" createVehicle position _ob_source_search;  
_lightjos setLightAmbient [.9,.8,.5];  
_lightjos setLightColor [.9,.8,.5];
_lightjos setLightIntensity 1000;
_lightjos setLightUseFlare true;
_lightjos setLightFlareSize 0;
_lightjos setLightFlareMaxDistance 2000;
_lightjos setLightAttenuation [/*start*/ 2000, /*constant*/50, /*linear*/ 1, /*quadratic*/ 200, /*hardlimitstart*/50,/* hardlimitend*/60]; 
_lightjos setLightDayLight true;
_lightjos lightAttachObject [_ob_source_search, [_coord_x,_coord_y,-_coord_z]];

while {(!isNull _ob_source_search) and (canMove _ob_source_search)} do {
_lightjos lightAttachObject [_ob_source_search, [_coord_x,_coord_y,-_coord_z+5]];
sleep 5;
};

deleteVehicle _lightjos;