// AAF Involvement

AAF_Involvement = lbCurSel 2103;
switch (AAF_Involvement) do {
    case AAF_Active: 
    {         
    };    
    
    case AAF_Inactive:       
    {         
    };    
};


// Season selection

Season = lbCurSel 2100;
_SeasonOffset = 0;      // Offset in fraction of a year, by season
_TimeOffsets = [0, 0];  // Offset to sunrise/sunset times (approximate)
switch (Season) do {
    case Season_Winter:
    {   _SeasonOffset = -0.1;
        _TimeOffsets = [2.1, -2.1];
    };
    
    case Season_Spring:
    {   _SeasonOffset = 0.15;
        _TimeOffsets = [1.15, -1.15];
    };      
    
    case Season_Summer:
    {   _SeasonOffset = 0.40;
        _TimeOffsets = [0, 0];
    };
    
    case Season_Fall:
    {   _SeasonOffset = 0.65; 
        _TimeOffsets = [1.05, -1.05];
    };    
};
_SeasonOffset = _SeasonOffset + random(0.25);
if (_SeasonOffset < 0) then {_SeasonOffset = _SeasonOffset + 1;};
_CurrentDate = numberToDate [2035, _SeasonOffset];


// Time of day selection
TimeSet = lbCurSel 2101;

_TimeVariance = 0.35;         // +/-, in hours
_TimeVarRand = random(_TimeVariance * 2) - _TimeVariance;
_NewHour = 0;

switch (TimeSet) do {
    case Time_Dawn: 
    { _NewHour = 5 + (_TimeOffsets select 0) + _TimeVarRand;      
    };
    
    case Time_Day:
    { _NewHour = 12 + (_TimeVarRand * 10);      // Wider variance  
    };
    
    case Time_Evening:
    { _NewHour = 18.5 + (_TimeOffsets select 1) + _TimeVarRand;      
    };      
    
    case Time_Night:
    { _NewHour = 1 + (_TimeVarRand * 10);       // Wider variance
    };
};

_NewMinute = floor((_NewHour % 1) * 60);
_NewHour = floor(_NewHour);

_CurrentDate set [3, _NewHour];
_CurrentDate set [4, _NewMinute];

setDate _CurrentDate;
[] execVM "scripts\ShowOSD\SITREP_Info.sqf";
_RR = [0.4, 0.2] call RandRange;
player globalchat format ["Test rand 0.2-0.4: %1", _RR];

// Weather type
player globalchat "Setting weather.";


Weather_Type = lbCurSel 2102;
//[] execVM "scripts\weather\dynamic_weather.sqf"

if (!WeatherActive) then {
    player globalchat "Initializing weather.";
    WeatherScript = [] execVM "scripts\Weather\dynamic_weather.sqf";}
else {
    player globalchat "Restarting weather script.";
    terminate WeatherScript;
    WeatherScript = [] execVM "scripts\Weather\dynamic_weather.sqf";
};

closeDialog 0;