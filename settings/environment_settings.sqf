_handle = createDialog "Environment_Settings_Dialog";  
waitUntil {dialog};

// Season selection
Season_Winter = lbAdd[2100, "Winter"];
Season_Spring = lbAdd[2100, "Spring"];
Season_Summer = lbAdd[2100, "Summer (default)"];
Season_Fall = lbAdd[2100, "Fall"];
lbSetCurSel [2100, Season_Summer];

// Time of day selection
Time_Dawn = lbAdd[2101, "Dawn (default)"];
Time_Day = lbAdd[2101, "Day"];
Time_Evening = lbAdd[2101, "Evening"];
Time_Night = lbAdd[2101, "Night"];
lbSetCurSel [2101, Time_Dawn];

// Weather type selection
Weather_Arid = lbAdd[2102, "Arid"];
Weather_Med = lbAdd[2102, "Mediterranean (default)"];
Weather_Temp = lbAdd[2102, "Temperate"];
Weather_Tropical = lbAdd[2102, "Tropical"];
Weather_None = lbAdd[2102, "Disable dynamic weather"];
lbSetCurSel [2102, Weather_Med];

// AAF involvement
AAF_Active = lbAdd[2103, "Active (default)"];
AAF_Inactive = lbAdd[2103, "Inactive"];
lbSetCurSel [2103, AAF_Active];
