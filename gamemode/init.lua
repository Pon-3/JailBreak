AddCSLuaFile( "cl_init.lua" ) -- Tell the server that the client need to download cl_init.lua 
AddCSLuaFile( "shared.lua" ) --  Tell the server that the client need to download shared.lua
 
 include( 'shared.lua' ) -- Tell the server to load shared.lua
 include( 'lua/round.lua' ) -- Tell the server to load round.lua

 newRound = 0
 rTimer = round_timer( newRound )
 
 function GM:PlayerInitialSpawn( ply ) -- When the player first joins the server and spawns" function 
     ply:ConCommand( "team_menu" ) -- Run the console command when the player first spawns
	 
	 if newRound == 0 then
		newRound = 1
		rTimer
	end
 
 end -- End the "when player first joins server and spawn" function 
 
 function GM:PlayerLoadout(ply) --"The weapons/items that the player spawns with" function

	ply:StripWeapons() -- This command strips all weapons from the player.
 
	if ply:Team() == 1 then --If the player is on team "Prisoner"...
		ply:Give("fists_weapon") -- ...then give them fists.
 
	elseif ply:Team() == 2 then -- Otherwise, if the player is on team "Guard"...
		ply:Give("weapon_m42") -- ...then give them the Phys Gun.
		ply:Give("weapon_deagle2")
		ply:Give("weapon_pumpshotgun2")
		ply:Give("fists_weapon")
	end -- This ends the if/elseif.
 
end -- This ends the function.
 
 function team_1( ply ) 
 
     ply:SetTeam( 1 ) //Make the player join team 1 
	 ply:Spawn()
 end 
 
 function team_2( ply ) 
 
     ply:SetTeam( 2 ) //Make the player join team 2 
	 ply:Spawn()
 end 
 
 concommand.Add( "team_1", team_1 ) //Add the command to set the players team to team 1 
 concommand.Add( "team_2", team_2 ) //Add the command to set the players team to team 2 
 