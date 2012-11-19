// Variables that are used on both client and server



SWEP.Category			= "Mad Cows Weapons"

SWEP.Base 				= "weapon_mad_base_shotgun"

SWEP.ViewModel			= "models/weapons/v_shotgun.mdl"
SWEP.WorldModel			= "models/weapons/w_shotgun.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false

SWEP.Primary.Sound 		= Sound("weapons/shotgun/shotgun_fire7.wav")
SWEP.Primary.Recoil		= 5
SWEP.Primary.Damage		= 11
SWEP.Primary.NumShots		= 8
SWEP.Primary.Cone			= 0.05
SWEP.Primary.Delay 		= 1

SWEP.Primary.ClipSize		= 6					// Size of a clip
SWEP.Primary.DefaultClip	= 6					// Default number of bullets in a clip
SWEP.Primary.Automatic		= false				// Automatic/Semi Auto
SWEP.Primary.Ammo			= "Buckshot"

SWEP.Secondary.ClipSize		= -1					// Size of a clip
SWEP.Secondary.DefaultClip	= -1					// Default number of bullets in a clip
SWEP.Secondary.Automatic	= false				// Automatic/Semi Auto
SWEP.Secondary.Ammo		= "none"

SWEP.ShellDelay			= 0.1

SWEP.IronSightsPos = Vector (-6.8668, -8.0102, 4.0102)
SWEP.IronSightsAng = Vector (0, 0, 0)
//SWEP.RunArmOffset 		= Vector (-2.6657, 0, 3.5)
//SWEP.RunArmAngle 			= Vector (-20.0824, -20.5693, 0)
SWEP.RunArmOffset = Vector (-0.9895, 0, 4.4566)
SWEP.RunArmAngle = Vector (-18.0546, -1.6176, 0)


SWEP.ShotgunReloading		= false
SWEP.ShotgunFinish		= 0.3
SWEP.ShotgunBeginReload		= 0.5

/*---------------------------------------------------------
   Name: SWEP:Precache()
   Desc: Use this function to precache stuff.
---------------------------------------------------------*/
function SWEP:Precache()
    util.PrecacheSound("weapons/shotgun/shotgun_fire7.wav")
end