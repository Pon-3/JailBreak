include( "shared.lua" )
 
 function set_team() 
 
 frame = vgui.Create( "DFrame" ) 
 frame:SetPos( 100, ScrH() / 2 ) //Set the window in the middle of the players screen/game window 
 frame:SetSize( 200, 210 ) //Set the size 
 frame:SetTitle( "Change Team" ) //Set title 
 frame:SetVisible( true ) 
 frame:SetDraggable( false ) 
 frame:ShowCloseButton( true ) 
 frame:MakePopup() 
 
 team_1 = vgui.Create( "DButton", frame ) 
 team_1:SetPos( 30, 30 )
 team_1:SetSize( 100, 50 ) 
 team_1:SetText( "Join Prisoners" ) 
 team_1.DoClick = function() //Make the player join team 1 
 
     RunConsoleCommand( "team_1" ) 
 
 end 
 
 team_2 = vgui.Create( "DButton", frame ) 
 team_2:SetPos( 30, 85 ) //Place it next to our previous one 
 team_2:SetSize( 100, 50 ) 
 team_2:SetText( "Join Guards" ) 
 team_2.DoClick = function() //Make the player join team 2 
 
     RunConsoleCommand( "team_2" ) 
 
 end 
 
 end 
 concommand.Add( "team_menu", set_team )