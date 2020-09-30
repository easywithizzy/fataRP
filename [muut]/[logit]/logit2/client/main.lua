ESX                    = nil

local PlayerData       = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('tac:playerLoaded')
AddEventHandler('tac:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
	TriggerServerEvent("tac:playerconnected")


end)

RegisterNetEvent('tac:setJob')
AddEventHandler('tac:setJob', function(job)
  PlayerData.job = job
end)

local isJacking = true
local isStolen = true
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if(IsPedInAnyVehicle(GetPlayerPed(-1)))then
			local playerPed = GetPlayerPed(-1)
			local coords    = GetEntityCoords(playerPed)
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 7.0, 0, 70)
			if(IsVehicleStolen(vehicle) and isStolen )then
				Wait(1000)
				TriggerServerEvent("tac:jackingcar",GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
				isStolen = false
			end
		else
			isStolen = true
			vehicle = nil
		end

		if(IsPedJacking(GetPlayerPed(-1))) then
				if(settings.LogPedJacking == true and isJacking) then
					local playerPed = GetPlayerPed(-1)
					local coords    = GetEntityCoords(playerPed)

					local vehicle = nil

					if IsPedInAnyVehicle(playerPed) then
						vehicle = GetVehiclePedIsIn(playerPed)

					else
						vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 7.0, 0, 70)

					end
					Wait(1000)
					TriggerServerEvent("tac:jackingcar",GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))

					isJacking = false
					vehicle = nil

				end
		else
			isJacking = true
		end
	end
end)

local isIncarPolice = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if(IsPedInAnyPoliceVehicle(GetPlayerPed(-1))) then
				if(settings.LogEnterPoliceVehicle == true and not isIncarPolice and PlayerData.job.name ~= "police") then
					TriggerServerEvent("tac:enterpolicecar",GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1), 0))))
					isIncarPolice = true
				end

		else
			isIncarPolice = false
		end

	end
end)

local isIncar = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)


		if(IsPedInAnyVehicle(GetPlayerPed(-1)) and not IsPedInAnyPoliceVehicle(GetPlayerPed(-1))) then

				if(settings.LogEnterPoliceVehicle == true and not isIncar) then

					for i=1, #blacklistedModels, 1 do

						if(blacklistedModels[i] == GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1), 0))))then
							TriggerServerEvent("tac:enterblacklistedcar",GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1), 0))))
							isIncar = true
						end
					end
				end
		else
			isIncar = false
		end

	end
end)

function GetPlayerByEntityID(id)
	for i=0,255 do
		if(NetworkIsPlayerActive(i) and GetPlayerPed(i) == id) then return i end
	end
	return nil
end
