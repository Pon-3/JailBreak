/*---------------------------------------------------------
------mmmm---mmmm-aaaaaaaa----ddddddddd---------------------------------------->
     mmmmmmmmmmmm aaaaaaaaa   dddddddddd	  Name: Mad Cows Weapons
     mmm mmmm mmm aaa    aaa  ddd     ddd	  Author: Worshipper
    mmm  mmm  mmm aaaaaaaaaaa ddd     ddd	  Project Start: October 23th, 2009
    mmm       mmm aaa     aaa dddddddddd	  File: mad_client.lua
---mmm--------mmm-aaa-----aaa-ddddddddd---------------------------------------->
---------------------------------------------------------*/

/*---------------------------------------------------------
   Name: GnomeView()
---------------------------------------------------------*/
local function CalcView(ply, origin, angles, fov)
   
	if ply:Alive() and ply:GetNWBool("Gnome") then
		local view = {
			origin = origin + Vector(0, 0, -40),
		}

		return view
	end
end
hook.Add("CalcView", "GnomeView", CalcView)