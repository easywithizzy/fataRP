el1te_was_right = true
--ESX as usual--------------------------------------------------------
ESX = nil
PlayerData = nil
---
Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(1)
  end
end)

IsHandcuffed = false
local prevMaleVariation = 0
local prevFemaleVariation = 0
local femaleHash = GetHashKey("mp_f_freemode_01")
local maleHash = GetHashKey("mp_m_freemode_01")

--Handcuff disable actions thread
Citizen.CreateThread(function()
	while el1te_was_right do
		if IsHandcuffed then
		   DisableControlAction(0,21,true) -- disable sprint (can be exploited with jumping)
		   DisableControlAction(0,24,true) -- disable attack
		   DisableControlAction(0,25,true) -- disable aim
		   DisableControlAction(0,47,true) -- disable weapon
		   DisableControlAction(0,58,true) -- disable weapon
		   DisableControlAction(0,263,true) -- disable melee
		   DisableControlAction(0,264,true) -- disable melee
		   DisableControlAction(0,257,true) -- disable melee
		   DisableControlAction(0,140,true) -- disable melee
		   DisableControlAction(0,141,true) -- disable melee
		   DisableControlAction(0,142,true)
		   DisableControlAction(0,143,true) 
		   DisableControlAction(0,73,true) 
		   DisableControlAction(0,289,true) 
		   DisableControlAction(0,20,true) 
		   DisableControlAction(0,22,true)
		end
		Citizen.Wait(0)
	end
end)
--Usable handcuff event
RegisterNetEvent('tac_esx_cuffs:usedHandcuff')
AddEventHandler('tac_esx_cuffs:usedHandcuff', function(data) 
	local player, distance = ESX.Game.GetClosestPlayer()
    if distance ~= -1 and distance <= 3.0 then
		TriggerServerEvent('tac_esx_cuffs:handcuff', GetPlayerServerId(player))
		Citizen.Wait(100)
		RequestAnimDict("mp_arrest_paired")
		while not HasAnimDictLoaded("mp_arrest_paired") do
			Citizen.Wait(0)
		end
		TaskPlayAnim(GetPlayerPed(-1), "mp_arrest_paired", "cop_p2_back_right", 8.0, -8, -1, 48, 0, 0, 0, 0)
		Citizen.Wait(4000)
		ClearPedTasks(GetPlayerPed(-1))
	else
		ESX.ShowNotification('~r~Ei ketään lähistöllä')
	end
end)
--Usable key event
RegisterNetEvent('tac_esx_cuffs:usedKey')
AddEventHandler('tac_esx_cuffs:usedKey', function(data) 
	local player, distance = ESX.Game.GetClosestPlayer()
    if distance ~= -1 and distance <= 3.0 then
		RequestAnimDict("mp_arresting")
		while not HasAnimDictLoaded("mp_arresting") do
			Citizen.Wait(0)
		end
		TaskPlayAnim(GetPlayerPed(-1), "mp_arresting", "a_uncuff", 8.0, -8, -1, 49, 0, 0, 0, 0)
		Citizen.Wait(5000)
		ClearPedTasks(GetPlayerPed(-1))
		TriggerServerEvent('tac_esx_cuffs:unhandcuff', GetPlayerServerId(player))
	else
		ESX.ShowNotification('~r~Ei ketään lähistöllä')
	end
end)


Citizen.CreateThread(function()
	while el1te_was_right do
		if IsHandcuffed then		
			if not IsEntityPlayingAnim(GetPlayerPed(-1), "mp_arresting", "idle", 3) then
				if IsPedDeadOrDying(GetPlayerPed(-1), 1) then
					TriggerEvent('tac_esx_cuffs:removeHandcuffs', "futuredata?source?wut?")
				else
					ESX.ShowNotification('~r~Käsiraudoissa ei kikkailla...')
					TriggerEvent('tac_esx_cuffs:addHandcuffs', "futuredata?source?wut?")
				end
			end
			local ped = GetPlayerPed(-1)
			if GetPedInVehicleSeat(GetVehiclePedIsIn(ped, false), -1) == ped then
				TaskLeaveVehicle(ped, GetVehiclePedIsIn(ped), 16)
				ESX.ShowNotification('~r~Ilman käsiä on hankala ajaa...')
				Citizen.Wait(350)
				TriggerEvent('tac_esx_cuffs:addHandcuffs', "futuredata?source?wut?")
			end
			if IsPedRagdoll(GetPlayerPed(-1)) then
				if IsPedRagdoll(GetPlayerPed(-1)) then
					Citizen.Wait(2500)
					TriggerEvent('tac_esx_cuffs:addHandcuffs', "futuredata?source?wut?")
					Citizen.Wait(2500)
					TriggerEvent('tac_esx_cuffs:addHandcuffs', "futuredata?source?wut?")
					Citizen.Wait(2500)
					TriggerEvent('tac_esx_cuffs:addHandcuffs', "futuredata?source?wut?")
					Citizen.Wait(2500)
					TriggerEvent('tac_esx_cuffs:addHandcuffs', "futuredata?source?wut?")
				end
			end
			if IsPedBeingStunned(GetPlayerPed(-1)) then
				Citizen.Wait(2500)
				TriggerEvent('tac_esx_cuffs:addHandcuffs', "futuredata?source?wut?")
				Citizen.Wait(2500)
				TriggerEvent('tac_esx_cuffs:addHandcuffs', "futuredata?source?wut?")
				Citizen.Wait(2500)
				TriggerEvent('tac_esx_cuffs:addHandcuffs', "futuredata?source?wut?")
				Citizen.Wait(2500)
				TriggerEvent('tac_esx_cuffs:addHandcuffs', "futuredata?source?wut?")
			end
		end
		Citizen.Wait(100)
	end
end)


--voimapihdit
RegisterNetEvent('tac_esx_cuffs:voimapihit_kaytetty')
AddEventHandler('tac_esx_cuffs:voimapihit_kaytetty', function(data) 
	local player, distance = ESX.Game.GetClosestPlayer()
    if distance ~= -1 and distance <= 2.5 then
		RequestAnimDict( "amb@prop_human_bum_bin@idle_b" )
		Wait(100)
		TaskPlayAnim(PlayerPedId(),"amb@prop_human_bum_bin@idle_b","idle_d",100.0, 200.0, 2.0, 0, 0.2, 0, 0, 0)
		Wait(8000)
		TriggerServerEvent('tac_policejob:unrestrain', GetPlayerServerId(player))
	else
		ESX.ShowNotification('~r~Ei ketään lähistöllä')
	end
end)

--Actual handcuff event
RegisterNetEvent('tac_esx_cuffs:addHandcuffs')
AddEventHandler('tac_esx_cuffs:addHandcuffs', function(data)
	local playerPed = GetPlayerPed(-1)
	Citizen.CreateThread(function()
		if not IsHandcuffed then
			if GetEntityModel(playerPed) == femaleHash then
				prevFemaleVariation = GetPedDrawableVariation(playerPed, 7)
				SetPedComponentVariation(playerPed, 7, 25, 0, 0)
			elseif GetEntityModel(playerPed) == maleHash then
				prevMaleVariation = GetPedDrawableVariation(playerPed, 7)
				SetPedComponentVariation(playerPed, 7, 41, 0, 0)
			end
			RequestAnimDict("mp_arrest_paired")
			while not HasAnimDictLoaded("mp_arrest_paired") do
				Citizen.Wait(0)
			end
			TaskPlayAnim(playerPed, "mp_arrest_paired", "crook_p2_back_right", 8.0, -8, -1, 32, 0, 0, 0, 0)
		end
		SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_UNARMED"), true)
		SetEnableHandcuffs(playerPed, true)
		Citizen.Wait(5000)
--		ClearPedTasks(playerPed)
		SetPedCanPlayGestureAnims(playerPed, false)
		RequestAnimDict("mp_arresting")
		while not HasAnimDictLoaded("mp_arresting") do
			Citizen.Wait(0)
		end
		TaskPlayAnim(playerPed, "mp_arresting", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
		IsHandcuffed = true
	end)
	ESX.ShowNotification('~r~ Olet käsiraudoissa')
end)

--Actual key event
RegisterNetEvent('tac_esx_cuffs:removeHandcuffs')
AddEventHandler('tac_esx_cuffs:removeHandcuffs', function(data) --C&P from esx_policejob
	 local playerPed = GetPlayerPed(-1)

	Citizen.CreateThread(function()
	   if IsHandcuffed then
	   
			if GetEntityModel(playerPed) == femaleHash then -- mp female
				SetPedComponentVariation(playerPed, 7, prevFemaleVariation, 0, 0)
			elseif GetEntityModel(playerPed) == maleHash then -- mp male
				SetPedComponentVariation(playerPed, 7, prevMaleVariation, 0, 0)
			end

			IsHandcuffed = false
			ClearPedSecondaryTask(playerPed)
			SetEnableHandcuffs(playerPed, false)
			SetPedCanPlayGestureAnims(playerPed,  true)
			SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_UNARMED"), true)
			--FreezeEntityPosition(playerPed, false) --just in case
	   end
	end)
	ESX.ShowNotification('~g~ Käsiraudat avattu')
end)

function IsInDriverSeat()
	return GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), -1) == GetPlayerPed(-1)
end





