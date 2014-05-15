class SideSelect_Dialog
{
    idd = -1;
	movingenable = false;
    
    class controls 
    {
        class Background: RscText
        {
            idc = 1400;
            x = 11.5 * GUI_GRID_W + GUI_GRID_X;
            y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 18 * GUI_GRID_W;
            h = 7.5 * GUI_GRID_H;
            colorBackground[] = {0,0,0,0.3};
        };
    
        class SideSelectFrame: RscFrame
        {
            idc = 1800;
            text = "Choose your side:"; 
            x = 11.5 * GUI_GRID_W + GUI_GRID_X;
            y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 18 * GUI_GRID_W;
            h = 7.5 * GUI_GRID_H;
        };
        class SideSelectList: RscCombo
        {
            idc = 1500;
            x = 12.5 * GUI_GRID_W + GUI_GRID_X;
            y = 9 * GUI_GRID_H + GUI_GRID_Y;
            w = 15.5 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            tooltip = "Choose the side you are playing."; 
        };
        class SideSelectButton: RscButton
        {
            idc = 1600;
            text = "OK"; 
            x = 18.5 * GUI_GRID_W + GUI_GRID_X;
            y = 12 * GUI_GRID_H + GUI_GRID_Y;
            w = 4 * GUI_GRID_W;
            h = 2 * GUI_GRID_H;
            action = "_nul = [] execvm ""settings\set_player_side.sqf""";
        };
    };
};