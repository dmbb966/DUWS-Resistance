_MaxWeatherDuration = 180 * 60;      // Time between weather shifts (seconds)
_MaxFogTransition = 60 * 60;         // Fog fade in time (seconds)
_MaxOvercastTransition = 20 * 60;    // Overcast fade in time (seconds)  
WeatherActive = true;

// Weather_Type is set in set_environment.sqf

switch (Weather_Type) do {
    case Weather_Arid: 
    {        
        FogIntensity = [0.01, 0.01];
        MaxFogAltitude = 0.01;        
        FogDecayRange = [0.1, 0.1];
        FogChance = 0;
        
        OvercastIntensity = [0.0, 0.3];
    };
    
    case Weather_Med:
    {
        FogIntensity = [0.0, 0.5];
        MaxFogAltitude = 10;
        FogDecayRange = [0.075, 0.125];
        FogChance = 0.2;
        
        OvercastIntensity = [0.0, 0.6];    
    };
    
    case Weather_Temp:
    {
        FogIntensity = [0.0, 0.8];
        MaxFogAltitude = 15;
        FogDecayRange = [0.065, 0.135];
        FogChance = 0.3;
        
        OvercastIntensity = [0.3, 0.8];
    };
        
    case Weather_Tropical:
    {
        FogIntensity = [0.3, 0.9];
        MaxFogAltitude = 20;
        FogDecayRange = [0.05, 0.15];
        FogChance = 0.3;
        
        OvercastIntensity = [0.0, 1.0];
    };
    
    case Weather_None:
    {   
        WeatherActive = false;
    };       
};

while {WeatherActive} do {  
    _WeatherDuration = random _MaxWeatherDuration;
    _FogTransition = random _MaxFogTransition;
    _FogIntensity = FogIntensity call RandRange;
    _FogDecay = FogDecayRange call RandRange;
    _FogAltitude = random MaxFogAltitude;       
    
    _OvercastTransition = random _MaxOvercastTransition;
    _OvercastIntensity = OvercastIntensity call RandRange;
    
    if (random 1 > FogChance) then {
        _FogTransition setFog [0, 0, 0];
        hint "No fog.";
    }
    else { 
        _FogTransition setFog [_FogIntensity, _FogDecay, _FogAltitude];
    };
    _OvercastTransition setOvercast _OvercastIntensity;
      
    player globalchat format ["Weather change: FogArray %1, Overcast %2, WeatherDuration %3, FogTransition %4, OTransition %5", [_FogIntensity, _FogDecay, _FogAltitude], _OvercastIntensity, _WeatherDuration, _FogTransition, _OvercastTransition];
    
    sleep (_WeatherDuration + _FogTransition);       
};