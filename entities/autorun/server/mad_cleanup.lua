/*---------------------------------------------------------
------mmmm---mmmm-aaaaaaaa----ddddddddd---------------------------------------->
     mmmmmmmmmmmm aaaaaaaaa   dddddddddd	  Name: Mad Cows Weapons
     mmm mmmm mmm aaa    aaa  ddd     ddd	  Author: Worshipper
    mmm  mmm  mmm aaaaaaaaaaa ddd     ddd	  Project Start: October 23th, 2009
    mmm       mmm aaa     aaa dddddddddd	  File: mad_cleanup.lua
---mmm--------mmm-aaa-----aaa-ddddddddd---------------------------------------->
---------------------------------------------------------*/

// Shhhh! It's a secret script to clean up the map!

function MAD.CleanUp(ply, command, args)

	if ply:IsAdmin() then
		game.CleanUpMap()
	end
end
concommand.Add("mad_cleanup", MAD.CleanUp)