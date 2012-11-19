function round_restart( newR )
	for k,v in pairs(player.GetAll()) do
		v:KillSilent()
		v:Spawn()
                v:SetDeaths( 0 )
	end

        if ply:Team == 3 then
            ply:SetTeam( 2 )
        end
    
	newR = 0
     	ply:ConCommand( "team_menu" ) -- Run the console command
end

function round_timer( newR )
	timer.Simple( 600, round_restart, newR )
end
