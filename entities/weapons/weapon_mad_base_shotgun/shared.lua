// Variables that are used on both client and server

SWEP.Base 				= "weapon_mad_base"

SWEP.Category			= "Mad Cows Weapons"

SWEP.MadCow = true
SWEP.ShellEffect			= "effect_mad_shell_shotgun"	// "effect_mad_shell_pistol" or "effect_mad_shell_rifle" or "effect_mad_shell_shotgun"
SWEP.ShellDelay			= 0

SWEP.HoldType = "shotgun"

SWEP.Pistol				= false
SWEP.Rifle				= false
SWEP.Shotgun			= true
SWEP.Sniper				= false

SWEP.Penetration			= false
SWEP.Ricochet			= false

/*---------------------------------------------------------
   Name: SWEP:Think()
   Desc: Called every frame.
---------------------------------------------------------*/
function SWEP:Think()
	if self.Weapon:Clip1() > self.Primary.ClipSize then
		self.Weapon:SetClip1(self.Primary.ClipSize)
	end

	if self.Weapon:GetNetworkedBool("Reloading") == true && IsFirstTimePredicted() then
		if self.Weapon:GetNetworkedInt("ReloadTime") < CurTime() then
			if (self.Weapon:Clip1() >= self.Primary.ClipSize or self.Owner:GetAmmoCount(self.Primary.Ammo) <= 0) then
				self.Weapon:SetNextPrimaryFire(CurTime() + self.ShotgunFinish)
				self.Weapon:SetNextSecondaryFire(CurTime() + self.ShotgunFinish)
				self.Weapon:SetNetworkedBool("Reloading", false)
				self.Weapon:SendWeaponAnim(ACT_SHOTGUN_RELOAD_FINISH)

				if (IsValid(self.Owner) and self.Owner:GetViewModel()) then
					self:IdleAnimation(self.Owner:GetViewModel():SequenceDuration())
				end
			else
				self.Weapon:SetNextPrimaryFire(CurTime() + 0.5)
				self.Weapon:SetNextSecondaryFire(CurTime() + 0.5)

				if (self.Weapon:Clip1() >= self.Primary.ClipSize or self.Owner:GetAmmoCount(self.Primary.Ammo) <= 0) then
					self.Weapon:SetNextPrimaryFire(CurTime() + 1.5)
					self.Weapon:SetNextSecondaryFire(CurTime() + 1.5)
				else
					self.Weapon:SetNextPrimaryFire(CurTime() + 0.5)
					self.Weapon:SetNextSecondaryFire(CurTime() + 0.5)
				end

				if SERVER then
					self.Owner:RemoveAmmo(1, self.Primary.Ammo, false)
					self.Weapon:SetClip1(self.Weapon:Clip1() + 1)
				end

				self.Weapon:SendWeaponAnim(ACT_VM_RELOAD)
				self.Weapon:EmitSound("weapons/shotgun/shotgun_reload3.wav", 100, 100)
				self.Weapon:SetNetworkedInt("ReloadTime", CurTime() + 0.5)
			end
		end
	end

	if (self.Owner:KeyPressed(IN_ATTACK)) and (self.Weapon:GetNWBool("Reloading", true)) then
		self.Weapon:SetNextPrimaryFire(CurTime() + self.ShotgunFinish)
		self.Weapon:SetNextPrimaryFire(CurTime() + self.ShotgunFinish)
		self.Weapon:SetNetworkedInt("ReloadTime", CurTime() + self.ShotgunFinish)
		self.Weapon:SetNetworkedBool("Reloading", false)

		timer.Simple(self.Owner:GetViewModel():SequenceDuration(), function()
			if not self.Owner then return end
			if CLIENT then self.Weapon:SendWeaponAnim(ACT_SHOTGUN_RELOAD_FINISH) end

			if (IsValid(self.Owner) and self.Owner:GetViewModel()) then
				self:IdleAnimation(self.Owner:GetViewModel():SequenceDuration())
			end
		end)
	end

	self:SecondThink()

	if self.IdleDelay < CurTime() and self.IdleApply and self.Weapon:Clip1() > 0 then
		local WeaponModel = self.Weapon:GetOwner():GetActiveWeapon():GetClass()

		if self.Weapon:GetOwner():GetActiveWeapon():GetClass() == WeaponModel and self.Owner:Alive() then
			if self.Weapon:GetDTBool(3) and self.Type == 2 then
				self.Weapon:SendWeaponAnim(ACT_VM_IDLE_SILENCED)
			else
				self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
			end

			if self.AllowPlaybackRate and not self.Weapon:GetDTBool(1) then
				self.Owner:GetViewModel():SetPlaybackRate(1)
			else
				self.Owner:GetViewModel():SetPlaybackRate(0)
			end	
		end

		self.IdleApply = false
	elseif self.Weapon:Clip1() <= 0 then
		self.IdleApply = false
	end

	if (self.Weapon:GetDTBool(1) or self.Weapon:GetDTBool(2)) and self.Owner:KeyDown(IN_SPEED) then
		self:SetIronsights(false)
	end

	// Burst fire mode
	if self.Weapon:GetDTBool(3) and self.Type == 3 then
		if self.BurstTimer + self.BurstDelay < CurTime() then
			if self.BurstCounter > 0 then
				self.BurstCounter = self.BurstCounter - 1
				self.BurstTimer = CurTime()
				
				if self:CanPrimaryAttack() then
					self.Weapon:EmitSound(self.Primary.Sound)
					self:ShootBulletInformation()
					self:TakePrimaryAmmo(1)
				end
			end
		end
	end

	if self.Owner:GetVelocity():Length() > 350 or self.Weapon:GetDTBool(0) then	
		if ( self.Owner:Crouching() and self.Owner:GetVelocity():Length() == 0 ) then
			self:SetWeaponHoldType( 'normal' )
		else
			self:SetWeaponHoldType( 'passive')
		end
	else
		self:SetWeaponHoldType(self.HoldType)
	end

	self:NextThink(CurTime())
end
/* function SWEP:Think()

	if self.Weapon:Clip1() > self.Primary.ClipSize then
		self.Weapon:SetClip1(self.Primary.ClipSize)
	end

	if self.Weapon:GetNetworkedBool("Reloading") == true then
		if self.Weapon:GetNetworkedInt("ReloadTime") < CurTime() then
			if (self.Weapon:Clip1() >= self.Primary.ClipSize or self.Owner:GetAmmoCount(self.Primary.Ammo) <= 0) then
				self.Weapon:SetNextPrimaryFire(CurTime() + self.ShotgunFinish)
				self.Weapon:SetNextSecondaryFire(CurTime() + self.ShotgunFinish)
				self.Weapon:SetNetworkedBool("Reloading", false)
				self.Weapon:SendWeaponAnim(ACT_SHOTGUN_RELOAD_FINISH)

				if (IsValid(self.Owner) and self.Owner:GetViewModel()) then
					self:IdleAnimation(self.Owner:GetViewModel():SequenceDuration())
				end
			else
				self.Weapon:SetNetworkedInt("ReloadTime", CurTime() + 0.45)
				self.Weapon:SendWeaponAnim(ACT_VM_RELOAD)
				self.Owner:RemoveAmmo(1, self.Primary.Ammo, false)
				self.Weapon:SetClip1(self.Weapon:Clip1() + 1)
				MsgN("Clip1: " .. self.Weapon:Clip1())
				self.Weapon:EmitSound("weapons/shotgun/shotgun_reload3.wav", 100, 100)
				self.Weapon:SetNextPrimaryFire(CurTime() + 0.5)
				self.Weapon:SetNextSecondaryFire(CurTime() + 0.5)

				if (self.Weapon:Clip1() >= self.Primary.ClipSize or self.Owner:GetAmmoCount(self.Primary.Ammo) <= 0) then
					self.Weapon:SetNextPrimaryFire(CurTime() + 1.5)
					self.Weapon:SetNextSecondaryFire(CurTime() + 1.5)
				else
					self.Weapon:SetNextPrimaryFire(CurTime() + 0.5)
					self.Weapon:SetNextSecondaryFire(CurTime() + 0.5)
				end
			end
		end
	end

	if (self.Owner:KeyPressed(IN_ATTACK)) and (self.Weapon:GetNWBool("Reloading", true)) then
		self.Weapon:SetNextPrimaryFire(CurTime() + self.ShotgunFinish)
		self.Weapon:SetNextPrimaryFire(CurTime() + self.ShotgunFinish)
		self.Weapon:SetNetworkedInt("ReloadTime", CurTime() + self.ShotgunFinish)
		self.Weapon:SetNetworkedBool("Reloading", false)

		timer.Simple(self.Owner:GetViewModel():SequenceDuration(), function()
			if not self.Owner then return end
			self.Weapon:SendWeaponAnim(ACT_SHOTGUN_RELOAD_FINISH)

			if (IsValid(self.Owner) and self.Owner:GetViewModel()) then
				self:IdleAnimation(self.Owner:GetViewModel():SequenceDuration())
			end
		end)
	end

	self:SecondThink()

	if self.IdleDelay < CurTime() and self.IdleApply and self.Weapon:Clip1() > 0 then
		local WeaponModel = self.Weapon:GetOwner():GetActiveWeapon():GetClass()

		if self.Weapon:GetOwner():GetActiveWeapon():GetClass() == WeaponModel and self.Owner:Alive() then
			if self.Weapon:GetDTBool(3) and self.Type == 2 then
				self.Weapon:SendWeaponAnim(ACT_VM_IDLE_SILENCED)
			else
				self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
			end

			if self.AllowPlaybackRate and not self.Weapon:GetDTBool(1) then
				self.Owner:GetViewModel():SetPlaybackRate(1)
			else
				self.Owner:GetViewModel():SetPlaybackRate(0)
			end	
		end

		self.IdleApply = false
	elseif self.Weapon:Clip1() <= 0 then
		self.IdleApply = false
	end

	if self.Weapon:GetDTBool(2) and self.Owner:KeyDown(IN_SPEED) then
		self:SetIronsights(false)
	end

	// Burst fire mode
	if self.Weapon:GetDTBool(3) and self.Type == 3 then
		if self.BurstTimer + self.BurstDelay < CurTime() then
			if self.BurstCounter > 0 then
				self.BurstCounter = self.BurstCounter - 1
				self.BurstTimer = CurTime()
				
				if self:CanPrimaryAttack() then
					self.Weapon:EmitSound(self.Primary.Sound)
					self:ShootBulletInformation()
					self:TakePrimaryAmmo(1)
				end
			end
		end
	end

	if self.Owner:GetVelocity():Length() > 350 or self.Weapon:GetDTBool(0) then	
		if self.Rifle or self.Sniper or self.Shotgun then
			if ( self.Owner:Crouching() and self.Owner:GetVelocity():Length() == 0 ) then
				self:SetWeaponHoldType( 'normal' )
			else
				self:SetWeaponHoldType( 'passive')
			end
		elseif self.Pistol then
			self:SetWeaponHoldType( 'normal' )
		end
	else
		self:SetWeaponHoldType(self.HoldType)
	end

	self:NextThink(CurTime())
end */

/*---------------------------------------------------------
   Name: SWEP:Reload()
   Desc: Reload is being pressed.
---------------------------------------------------------*/
function SWEP:Reload()

	if (self.ActionDelay > CurTime()) then return end 

	if (self.Weapon:GetNWBool("Reloading") or self.ShotgunReloading) then return end

	if (self.Weapon:Clip1() < self.Primary.ClipSize and self.Owner:GetAmmoCount(self.Primary.Ammo) > 0) then
		self.ShotgunReloading = true
		self.Weapon:SetNextPrimaryFire(CurTime() + self.ShotgunBeginReload + 0.1)
		self.Weapon:SetNextSecondaryFire(CurTime() + self.ShotgunBeginReload + 0.1)
		self.Weapon:SendWeaponAnim(ACT_SHOTGUN_RELOAD_START)
		self.Owner:SetAnimation(PLAYER_RELOAD)

		timer.Simple(self.ShotgunBeginReload, function()
			self.ShotgunReloading = false
			self.Weapon:SetNetworkedBool("Reloading", true)
			self.Weapon:SetVar("ReloadTime", CurTime() + 1)
			self.Weapon:SetNextPrimaryFire(CurTime() + 0.5)
			self.Weapon:SetNextSecondaryFire(CurTime() + 0.5)
		end)

		if (SERVER) then
			self.Owner:SetFOV( 0, 0.15 )
			self:SetIronsights(false)
		end
	end
end

/*---------------------------------------------------------
   Name: SWEP:Deploy()
   Desc: Whip it out.
---------------------------------------------------------*/
function SWEP:Deploy()

	self.ShotgunReloading = false
	self.Weapon:SetNetworkedBool("Reloading", false)

	self.Weapon:SendWeaponAnim(ACT_VM_DRAW)

	self.Weapon:SetNextPrimaryFire(CurTime() + self.DeployDelay)
	self.Weapon:SetNextSecondaryFire(CurTime() + self.DeployDelay)
	self.ActionDelay = (CurTime() + self.DeployDelay)

	if (SERVER) then
		self:SetIronsights(false)
	end

	if (IsValid(self.Owner) and self.Owner:GetViewModel()) then
		self:IdleAnimation(self.Owner:GetViewModel():SequenceDuration())
	end

	return true
end

/*---------------------------------------------------------
   Name: SWEP:PrimaryAttack()
   Desc: Hey man, shit happens.
---------------------------------------------------------*/
function SWEP:PrimaryAttack()

	// Holst/Deploy your fucking weapon
	if (not self.Owner:IsNPC() and self.Owner:KeyDown(IN_USE)) then
		bHolsted = !self.Weapon:GetDTBool(0)
		self:SetHolsted(bHolsted)

		self.Weapon:SetNextPrimaryFire(CurTime() + 0.3)
		self.Weapon:SetNextSecondaryFire(CurTime() + 0.3)

		self:SetIronsights(false)

		return
	end

	if (not self:CanPrimaryAttack()) then return end

	self.ActionDelay = (CurTime() + self.Primary.Delay + 0.05)
	self.Weapon:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
	self.Weapon:SetNextSecondaryFire(CurTime() + self.Primary.Delay)

	// If the burst mode is activated, it's going to shoot the three bullets (or more if you're dumb and put 4 or 5 bullets for your burst mode)
	if self.Weapon:GetDTBool(3) and self.Type == 3 then
		self.BurstTimer 	= CurTime()
		self.BurstCounter = self.BurstShots - 1
		self.Weapon:SetNextPrimaryFire(CurTime() + 0.5)
	end

	self.Weapon:EmitSound(self.Primary.Sound)

	self:TakePrimaryAmmo(1)

	self:ShootBulletInformation()

	timer.Simple(.4, function()
	self.Weapon:SendWeaponAnim(ACT_SHOTGUN_PUMP)
	if CLIENT then self.Weapon:EmitSound("weapons/shotgun/shotgun_cock.wav") end
	end)
	
end