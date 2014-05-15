// Debug

Debug_ChooseEnv = player addaction ["Change Environment Settings","settings\environment_settings.sqf","", 0,false,false,""];

// Custom Functions

// RandRange takes [low, high] as inputs and returns a random number within that range.
// Automatically corrects if the low and high values are switched.
RandRange = {
    private ["_low", "_high"];
    _low = _this select 0;
    _high = _this select 1;
    _returnValue = -1;    
    if (_low > _high) then {
        _returnValue = _high + random (_low - _high);
    } else { 
        _returnValue = _low + random (_high - _low); 
    };    
    _returnValue;
};