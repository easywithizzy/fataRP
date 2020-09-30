local holstered = true
local backpull = false
local weapons = {

	"WEAPON_KNIFE",
	"WEAPON_NIGHTSTICK",
	"WEAPON_HAMMER",
	"WEAPON_WRENCH",
	"WEAPON_BAT",
	"WEAPON_BATTLEAXE",
	"WEAPON_HATCHET",
	"WEAPON_GOLFCLUB",
	"WEAPON_BOTTLE",
	"WEAPON_DAGGER",
	"WEAPON_MACHETE",
	"WEAPON_FLASHLIGHT",
	"WEAPON_CROWBAR",
	"WEAPON_POOLCUE",

	"WEAPON_STUNGUN",
	"WEAPON_PISTOL",
	"WEAPON_PISTOL_MK2",
	"WEAPON_COMBATPISTOL",
	"WEAPON_SNSPISTOL",
	"WEAPON_SNSPISTOL_MK2",
	"WEAPON_PISTOL50" ,
	"WEAPON_HEAVYPISTOL" ,
	"WEAPON_VINTAGEPISTOL" ,
	"WEAPON_REVOLVER",
	"WEAPON_REVOLVER_MK2",
	"WEAPON_DOUBLEACTION",
	"WEAPON_APPISTOL",
	"WEAPON_MARKSMANPISTOL",

	"WEAPON_MICROSMG",
	"WEAPON_MINISMG",
	"WEAPON_SMG",
	"WEAPON_SMG_MK2",
	"WEAPON_ASSAULTSMG",
	"WEAPON_COMBATPDW",
	"WEAPON_GUSENBERG",
	"WEAPON_MACHINEPISTOL",
	"WEAPON_MG",
	"WEAPON_COMBATMG",
	"WEAPON_COMBATMG_MK2",

	"WEAPON_PUMPSHOTGUN",
	"WEAPON_PUMPSHOTGUN_MK2",
	"WEAPON_SAWNOFFSHOTGUN",
	"WEAPON_ASSAULTSHOTGUN",
	"WEAPON_BULLPUPSHOTGUN",
	"WEAPON_HEAVYSHOTGUN",
	"WEAPON_DBSHOTGUN",
	"WEAPON_AUTOSHOTGUN",
	"WEAPON_MUSKET",

	"WEAPON_ASSAULTRIFLE",
	"WEAPON_ASSAULTRIFLE_MK2",
	"WEAPON_CARBINERIFLE",
	"WEAPON_CARBINERIFLE_MK2",
	"WEAPON_ADVANCEDRIFLE",
	"WEAPON_SPECIALCARBINE",
	"WEAPON_BULLPUPRIFLE",
	"WEAPON_BULLPUPRIFLE_MK2",
	"WEAPON_COMPACTRIFLE",

	"WEAPON_MARKSMANRIFLE",
	"WEAPON_MARKSMANRIFLE_MK2",
	"WEAPON_SNIPERRIFLE",

	"WEAPON_GRENADE",
	"WEAPON_BZGAS",
	"WEAPON_MOLOTOV",
	"WEAPON_STICKYBOMB",
	"WEAPON_SMOKEGRENADE",

}



local fidgetspinner = {
	"WEAPON_STUNGUN",
	"WEAPON_PISTOL50",
	"WEAPON_REVOLVER",
	"WEAPON_REVOLVER_MK2",
	"WEAPON_DOUBLEACTION",
}



local police = {
	"WEAPON_STUNGUN",
	"WEAPON_COMBATPISTOL",
}

local dead = false

RegisterNetEvent('tac:onPlayerDeath')
AddEventHandler('tac:onPlayerDeath', function()
	dead = true
end)

RegisterNetEvent('tac_ambulancejob:revive')
AddEventHandler('tac_ambulancejob:revive', function()
	dead = false
end)

Citizen.CreateThread(function()
local weapon = nil
	while true do
		Citizen.Wait(50)
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(PlayerPedId(), true) and not dead then
			loadAnimDict( "reaction@intimidation@1h" )
			loadAnimDict( "anim@weapons@pistol@doubleaction_holster" )
			loadAnimDict( "rcmjosh4" )
			if CheckWeapon(ped) then
				if holstered then
					if GetEntityHeightAboveGround(GetPlayerPed(-1)) > 6 then
						holstered = false
					else
						backpull = true
						SetPedCanSwitchWeapon(ped, false)
						if CheckPolice(ped) then
							weapon = GetSelectedPedWeapon(ped)
							SetCurrentPedWeapon(ped, 0xA2719263, 1)
							TaskPlayAnim(ped, "rcmjosh4", "josh_leadout_cop2", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
							Citizen.Wait(500)
							SetCurrentPedWeapon(ped, weapon, 1)
							Citizen.Wait(750)
						else
							weapon = GetSelectedPedWeapon(ped)
							SetCurrentPedWeapon(ped, 0xA2719263, 1)
							TaskPlayAnim(ped, "reaction@intimidation@1h", "intro", 1.0, -1.0, -1, 48, 1, 0, 0, 0 )
							Citizen.Wait(500)
							SetCurrentPedWeapon(ped, weapon, 1)
							Citizen.Wait(2000)
						end
						ClearPedTasks(ped)
						holstered = false
						if IsPedArmed(ped, 6) then
							Citizen.Wait(1000)
						end
						SetPedCanSwitchWeapon(ped, true)
						backpull = false
					end
				end
			elseif not CheckWeapon(ped) then
				if not holstered then
					if GetEntityHeightAboveGround(GetPlayerPed(-1)) > 6 then
						holstered = true
					else
						backpull = true
						SetPedCanSwitchWeapon(ped, false)
						SetCurrentPedWeapon(ped, weapon, 1)
						if Checkfidgetspinner(ped) then
							TaskPlayAnim(ped, "anim@weapons@pistol@doubleaction_holster", "holster", 1.0, -1.0, -1, 48, 1, 0, 0, 0 )
						else							
							TaskPlayAnim(ped, "reaction@intimidation@1h", "outro", 1.0, -1.0, -1, 48, 1, 0, 0, 0 )
						end
						if CheckPolice(ped) then
							SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
							TaskPlayAnim(ped, "rcmjosh4", "josh_leadout_cop2", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
									Citizen.Wait(500)
								TaskPlayAnim(ped, "reaction@intimidation@cop@unarmed", "outro", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
							SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
							ClearPedTasks(ped)
						end
						Citizen.Wait(2000)
						SetCurrentPedWeapon(ped, 0xA2719263, 1)
						ClearPedTasks(ped)
						holstered = true
						SetPedCanSwitchWeapon(ped, true)
						backpull = false
					end
				end
			end
			if not holstered then
				weapon = GetSelectedPedWeapon(ped)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		if backpull then
			DisablePlayerFiring(ped, true)
			DisableControlAction(2, 24, true) -- Attack
			DisableControlAction(2, 257, true) -- Attack 2
			DisableControlAction(2, 263, true) -- Melee Attack 1
			DisableControlAction(2, 45, true) -- Reload
			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
		end
	end
end)

function CheckWeapon(ped)
	for i = 1, #weapons do
		if GetHashKey(weapons[i]) == GetSelectedPedWeapon(ped) then
			return true
		end
	end
	return false
end

function Checkfidgetspinner(ped)
	for i = 1, #fidgetspinner do
		if GetHashKey(fidgetspinner[i]) == GetSelectedPedWeapon(ped) then
			return true
		end
	end
	return false
end

function CheckPolice(ped)
	for i = 1, #police do
		if GetHashKey(police[i]) == GetSelectedPedWeapon(ped) then
			return true
		end
	end
	return false
end

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(0)
	end
end