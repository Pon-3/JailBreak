/*---------------------------------------------------------
------mmmm---mmmm-aaaaaaaa----ddddddddd---------------------------------------->
     mmmmmmmmmmmm aaaaaaaaa   dddddddddd	  Name: Mad Cows Weapons
     mmm mmmm mmm aaa    aaa  ddd     ddd	  Author: Worshipper
    mmm  mmm  mmm aaaaaaaaaaa ddd     ddd	  Project Start: October 23th, 2009
    mmm       mmm aaa     aaa dddddddddd	  File: mad_physgun_limited.lua
---mmm--------mmm-aaa-----aaa-ddddddddd---------------------------------------->
---------------------------------------------------------*/

/*---------------------------------------------------------
   Name: MadPhysgunPickup()
   Desc: Return true if player can pickup entity
---------------------------------------------------------*/
function MadPhysgunPickup(ply, ent)

	// Never pick up a grenade
	if (ent:GetClass() == "ent_mad_grenade") then return false end

	// Never pick up a grenade launcher
	if (ent:GetClass() == "ent_mad_grenadelauncher") then return false end

	// Never pick up a mine
	if (ent:GetClass() == "ent_mad_mine") then return false end

	// Never pick up a rocket
	if (ent:GetClass() == "ent_mad_rocket") then return false end

	// Never pick up a C4
	if (ent:GetClass() == "ent_mad_c4") then return false end

	// Never pick up a flare
	if (ent:GetClass() == "ent_mad_flare") then return false end

	// Never pick up a flash grenade
	if (ent:GetClass() == "ent_mad_flash") then return false end

	// Never pick up a smoke grenade
	if (ent:GetClass() == "ent_mad_smoke") then return false end
end
hook.Add("PhysgunPickup", "MadPhysgunPickup", MadPhysgunPickup)

/*---------------------------------------------------------
   Name: MadGravgunPickup()
   Desc: Return true if we're allowed to pickup entity
---------------------------------------------------------*/
function MadGravgunPickup(ply, ent)

	// Never pick up a grenade launcher
	if (ent:GetClass() == "ent_mad_grenadelauncher") then return false end

	// Never pick up a rocket
	if (ent:GetClass() == "ent_mad_rocket") then return false end

	// Never pick up a C4
	//if (ent:GetClass() == "ent_mad_c4") then return false end
end
hook.Add("GravGunPickupAllowed", "MadGravgunPickup", MadGravgunPickup)