function round_restart( newR )
	for k,v in pairs(player.GetAll()) do
		v:Kill()
		v:Spawn()
	end

	newR = 0
end

function round_timer( newR )
	timer.Simple( 600, round_restart, newR )
end
