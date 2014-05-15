_handle = createDialog "SideSelect_Dialog";  
waitUntil {dialog};

// Side Selection
Player_US = lbAdd[1500, "US (default)"];
Player_FIA = lbAdd[1500, "FIA Guerilla"];
Player_CSAT = lbAdd[1500, "CSAT"];
lbSetCurSel [1500, Player_US];