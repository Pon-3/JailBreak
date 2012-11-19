/*---------------------------------------------------------
------mmmm---mmmm-aaaaaaaa----ddddddddd---------------------------------------->
     mmmmmmmmmmmm aaaaaaaaa   dddddddddd	  Name: Mad Cows Weapons
     mmm mmmm mmm aaa    aaa  ddd     ddd	  Author: Worshipper
    mmm  mmm  mmm aaaaaaaaaaa ddd     ddd	  Project Start: October 23th, 2009
    mmm       mmm aaa     aaa dddddddddd	  File: mad_time.lua
---mmm--------mmm-aaa-----aaa-ddddddddd---------------------------------------->
---------------------------------------------------------*/

// Shhhh! It's a secret script to slow the time (if sv_cheats is on)!

Slow = {}

function MAD.Slowon()

	game.ConsoleCommand("host_timescale 0.2\n")
end
concommand.Add("+mad_slow", MAD.Slowon)

function MAD.Slowoff()

	game.ConsoleCommand("host_timescale 1\n")
end
concommand.Add("-mad_slow", MAD.Slowoff)