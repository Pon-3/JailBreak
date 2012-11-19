/*---------------------------------------------------------
------mmmm---mmmm-aaaaaaaa----ddddddddd---------------------------------------->
     mmmmmmmmmmmm aaaaaaaaa   dddddddddd	  Name: Mad Cows Weapons
     mmm mmmm mmm aaa    aaa  ddd     ddd	  Author: Worshipper
    mmm  mmm  mmm aaaaaaaaaaa ddd     ddd	  Project Start: October 23th, 2009
    mmm       mmm aaa     aaa dddddddddd	  File: mad_getpos.lua
---mmm--------mmm-aaa-----aaa-ddddddddd---------------------------------------->
---------------------------------------------------------*/

// Shhhh! It's a secret script to find your position or an entity's position!

function MAD.GetPlayerPosition(ply, command, args)

	ply:ChatPrint("Position : " .. math.Round(ply:GetPos().x) .. " " .. math.Round(ply:GetPos().y) .. " " .. math.Round(ply:GetPos().z))
	ply:ChatPrint("Angle : " .. math.Round(ply:GetAngles().p) .. " " .. math.Round(ply:GetAngles().y) .. " " .. math.Round(ply:GetAngles().r))
end
concommand.Add("mad_ply_getpos", MAD.GetPlayerPosition)

function MAD.GetEntityPosition(ply, command, args)

	local trace = ply:GetEyeTrace().Entity

	ply:ChatPrint("Position : " .. math.Round(trace:GetPos().x) .. " " .. math.Round(trace:GetPos().y) .. " " .. math.Round(trace:GetPos().z))
	ply:ChatPrint("Angle : " .. math.Round(trace:GetAngles().p) .. " " .. math.Round(trace:GetAngles().y) .. " " .. math.Round(trace:GetAngles().r))
end
concommand.Add("mad_ent_getpos", MAD.GetEntityPosition)