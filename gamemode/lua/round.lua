include ( 'init.lua' )

function round_restart()
	for k,v in pairs(player.GetAll()) do
		v:Kill()
		v:Spawn()
	end
	newRound = 0
end

function round_timer()
	timer.Simple( 600, round_restart )
end