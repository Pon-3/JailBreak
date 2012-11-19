/*---------------------------------------------------------
------mmmm---mmmm-aaaaaaaa----ddddddddd---------------------------------------->
     mmmmmmmmmmmm aaaaaaaaa   dddddddddd	  Name: Mad Cows Weapons
     mmm mmmm mmm aaa    aaa  ddd     ddd	  Author: Worshipper
    mmm  mmm  mmm aaaaaaaaaaa ddd     ddd	  Project Start: October 23th, 2009
    mmm       mmm aaa     aaa dddddddddd	  File: mad_files.lua
---mmm--------mmm-aaa-----aaa-ddddddddd---------------------------------------->
---------------------------------------------------------*/

AddCSLuaFile("autorun/mad_physgun_limited.lua")
AddCSLuaFile("autorun/mad_shared.lua")
AddCSLuaFile("autorun/client/mad_client.lua")
AddCSLuaFile("autorun/client/mad_menu.lua")
//AddCSLuaFile("autorun/client/mad_view.lua")
AddCSLuaFile("autorun/mad_npcs.lua")
//AddCSLuaFile("autorun/mad_sounds.lua")

local PlayerMeta = FindMetaTable("Player")

/*---------------------------------------------------------
   Name: PlayerMeta:SendMessage()
   Desc: Custom messages
---------------------------------------------------------*/
function PlayerMeta:SendMessage(text, duration, color)

	local duration = duration or 3
	local color = color or Color(255, 255, 255, 255)

	umsg.Start("rp_sendmessage", self)
		umsg.String(text)
		umsg.Short(duration)
		umsg.String(color.r .. ", " .. color.g .. ", " .. color.b .. ", " .. color.a)
	umsg.End()
end

/*---------------------------------------------------------
   Name: SendMessageAll()
   Desc: Custom messages
---------------------------------------------------------*/
function SendMessageAll(text, duration, color)

	for k, v in pairs(player.GetAll()) do
		v:SendMessage(text, duration, color)
	end
end