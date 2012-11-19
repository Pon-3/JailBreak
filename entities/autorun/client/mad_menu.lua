/*---------------------------------------------------------
------mmmm---mmmm-aaaaaaaa----ddddddddd---------------------------------------->
     mmmmmmmmmmmm aaaaaaaaa   dddddddddd	  Name: Mad Cows Weapons
     mmm mmmm mmm aaa    aaa  ddd     ddd	  Author: Worshipper
    mmm  mmm  mmm aaaaaaaaaaa ddd     ddd	  Project Start: October 23th, 2009
    mmm       mmm aaa     aaa dddddddddd	  File: mad_menu.lua
---mmm--------mmm-aaa-----aaa-ddddddddd---------------------------------------->
---------------------------------------------------------*/

/*---------------------------------------------------------
   Name: CrosshairOptions()
---------------------------------------------------------*/
local function CrosshairOptions(panel)

	local CrosshairOptions = {Options = {}, CVars = {}, Label = "#Presets", MenuButton = "1", Folder = "mad_cows_crosshair"}

	CrosshairOptions.Options["#Default"] = {	mad_crosshair_r =	"255",
								mad_crosshair_g =	"255",
								mad_crosshair_b =	"255",
								mad_crosshair_a =	"200",
								mad_crosshair_l =	"30",
								mad_crosshair_t =	"1"
							   }
									
	CrosshairOptions.CVars = { 	"mad_crosshair_r",
						"mad_crosshair_g",
						"mad_crosshair_b",
						"mad_crosshair_a",
						"mad_crosshair_l",
						"mad_crosshair_t"
					 }
						
	panel:AddControl("ComboBox", CrosshairOptions)

	panel:AddControl("CheckBox", {
		Label = "Enable Crosshair",
		Command = "mad_crosshair_t",
	})

	panel:AddControl("Color", {
		Label 	= "Crosshair Color",
		Red 		= "mad_crosshair_r",
		Green 	= "mad_crosshair_g",
		Blue 		= "mad_crosshair_b",
		Alpha 	= "mad_crosshair_a",
	})

	panel:AddControl("Slider", {
		Label 	= "Crosshair Lenght",
		Command 	= "mad_crosshair_l",
		Type 		= "Integer",
		Min 		= "5",
		Max 		= "100",
	})
end

/*---------------------------------------------------------
   Name: AdminOptions()
---------------------------------------------------------*/
local function AdminOptions(panel)

	panel:AddControl("Label", {Text = ""})
	
	panel:AddControl("Label", {
		Text = "Normal Weapon Settings:"
	})

	local AdminOptions = {Options = {}, CVars = {}, Label = "#Presets", MenuButton = "1", Folder = "mad_cows_weapon"}

	AdminOptions.Options["#Default"] = {  mad_recoilmul 	=	"1",
							   mad_damagemul 	=	"1",
						     }
									
	AdminOptions.CVars = { 	"mad_recoilmul",
					"mad_damagemul"
				   }
						
	panel:AddControl("ComboBox", AdminOptions)

	panel:AddControl("Slider", {
		Label 	= "Damage Multiplier",
		Command 	= "mad_damagemul",
		Type 		= "Float",
		Min 		= "0",
		Max 		= "10",
	})

	panel:AddControl("Slider", {
		Label 	= "Recoil Multiplier",
		Command 	= "mad_recoilmul",
		Type 		= "Float",
		Min 		= "0",
		Max 		= "10",
	})

	panel:AddControl("Label", {Text = ""})

	panel:AddControl("Label", {
		Text = "Admin Weapon Settings:"
	})

	local AdminWeaponOptions = {Options = {}, CVars = {}, Label = "#Presets", MenuButton = "1", Folder = "mad_cows_weapon"}

	AdminWeaponOptions.Options["#Default"] = {  mad_admin_sound 	=	"NPC_Sniper.FireBullet",
								  mad_admin_shell 	=	"effect_mad_shell_pistol",
								  mad_admin_recoil 	=	"0.1",
								  mad_admin_damage 	=	"100",
								  mad_admin_numshots 	=	"1",
								  mad_admin_cone 		=	"0",
								  mad_admin_delay 	=	"0.1",
								  mad_admin_maxricochet =	"10",
								  mad_admin_scopezooms 	=	"8"
							     }
									
	AdminWeaponOptions.CVars = { 	"mad_admin_sound",
						"mad_admin_shell",
						"mad_admin_recoil",
						"mad_admin_damage",
						"mad_admin_numshots",
						"mad_admin_cone",
						"mad_admin_delay",
						"mad_admin_maxricochet",
						"mad_admin_scopezooms"
					   }
						
	panel:AddControl("ComboBox", AdminWeaponOptions)

	local AdminWeaponSounds = {Label = "#admin_weapon_sound", MenuButton = 0, Options = {}, CVars = {}}
		AdminWeaponSounds["Options"]["#no sound"]		= {mad_admin_sound = ""}
		AdminWeaponSounds["Options"]["#pistol sound"]	= {mad_admin_sound = "Weapon_Pistol.Single"}
		AdminWeaponSounds["Options"]["#smg sound"]	= {mad_admin_sound = "Weapon_SMG1.Single"}
		AdminWeaponSounds["Options"]["#ar-2 sound"]	= {mad_admin_sound = "Weapon_AR2.Single"}
		AdminWeaponSounds["Options"]["#shotgun sound"]	= {mad_admin_sound = "Weapon_Shotgun.Single"}
		AdminWeaponSounds["Options"]["#turret sound"]	= {mad_admin_sound = "NPC_FloorTurret.Shoot"}
		AdminWeaponSounds["Options"]["#airboat sound"]	= {mad_admin_sound = "Airboat.FireGunHeavy"}
		AdminWeaponSounds["Options"]["#strider sound"]	= {mad_admin_sound = "NPC_Strider.FireMinigun"}
		AdminWeaponSounds["Options"]["#sniper sound"]	= {mad_admin_sound = "NPC_Sniper.FireBullet"}
		
	panel:AddControl("ComboBox", AdminWeaponSounds)

	local AdminShellEffects = {Label = "#admin_weapon_shell", MenuButton = 0, Options = {}, CVars = {}}
		AdminShellEffects["Options"]["#no shell"]			= {mad_admin_shell = ""}
		AdminShellEffects["Options"]["#pistol shell"]		= {mad_admin_shell = "effect_mad_shell_pistol"}
		AdminShellEffects["Options"]["#rifle shell"]		= {mad_admin_shell = "effect_mad_shell_rifle"}
		AdminShellEffects["Options"]["#shotgun shell"]		= {mad_admin_shell = "effect_mad_shell_shotgun"}
		
	panel:AddControl("ComboBox", AdminShellEffects)

	panel:AddControl("Slider", {
		Label 	= "Recoil",
		Command 	= "mad_admin_recoil",
		Type 		= "Float",
		Min 		= "0",
		Max 		= "10",
	})

	panel:AddControl("Slider", {
		Label 	= "Damage",
		Command 	= "mad_admin_damage",
		Type 		= "Integer",
		Min 		= "0",
		Max 		= "10000",
	})

	panel:AddControl("Slider", {
		Label 	= "Number of bullets per shot",
		Command 	= "mad_admin_numshots",
		Type 		= "Integer",
		Min 		= "1",
		Max 		= "20",
	})

	panel:AddControl("Slider", {
		Label 	= "Precision",
		Command 	= "mad_admin_cone",
		Type 		= "Float",
		Min 		= "0",
		Max 		= "1",
	})

	panel:AddControl("Slider", {
		Label 	= "Delay",
		Command 	= "mad_admin_delay",
		Type 		= "Float",
		Min 		= "0",
		Max 		= "1",
	})

	panel:AddControl("Slider", {
		Label 	= "Max ricochet on metal",
		Command 	= "mad_admin_maxricochet",
		Type 		= "Integer",
		Min 		= "0",
		Max 		= "100",
	})

	panel:AddControl("Slider", {
		Label 	= "Scope Zoom",
		Command 	= "mad_admin_scopezooms",
		Type 		= "Integer",
		Min 		= "2",
		Max 		= "25",
	})

	panel:AddControl("CheckBox", {
		Label = "Automatic",
		Command = "mad_admin_automatic",
	})
end

/*---------------------------------------------------------
   Name: MadCowsToolMenu()
---------------------------------------------------------*/
function MadCowsToolMenu()

	spawnmenu.AddToolMenuOption("Options", "Mad Cows Weapons", "Crosshair Options", "Crosshair Options", "", "", CrosshairOptions, {SwitchConVar = 'mad_crosshair_t'})
	spawnmenu.AddToolMenuOption("Options", "Mad Cows Weapons", "Admin Options", "Admin Options", "", "", AdminOptions)
end
hook.Add("PopulateToolMenu", "MadCowsToolMenu", MadCowsToolMenu)