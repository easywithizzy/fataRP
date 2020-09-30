ESX = nil
local PlayerData		= {}
local Liivitbool = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('tac:playerLoaded')
AddEventHandler('tac:playerLoaded', function(xPlayer)
  PlayerData = xPlayer 
end)

RegisterNetEvent('tac:setJob')
AddEventHandler('tac:setJob', function(job)
	PlayerData.job = job
end)

RegisterNetEvent('luotiliivit:addarmour')
AddEventHandler('luotiliivit:addarmour', function(source,liivit)
 SetPedArmour(PlayerPedId(-1), Config.MaxArmor)
 Liivitbool = true 
	TriggerEvent('skinchanger:getSkin', function(skin)

		print(liiviarvo)
	 if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
	 	if skin.sex == 0 then
			TriggerEvent('skinchanger:loadClothes', skin,Config.Liivit.poliisi.mies)
		elseif skin.sex == 1 then
			TriggerEvent('skinchanger:loadClothes', skin,Config.Liivit.poliisi.nainen)
		end
	elseif PlayerData.job ~= nil and PlayerData.job.name == 'sheriff' then
	 	if skin.sex == 0 then
			TriggerEvent('skinchanger:loadClothes', skin,Config.Liivit.sheriffi.mies)
		elseif skin.sex == 1 then
			TriggerEvent('skinchanger:loadClothes', skin,Config.Liivit.sheriffi.nainen)
		end
	elseif PlayerData.job ~= nil and PlayerData.job.name == 'fib' then
	 	if skin.sex == 0 then
			TriggerEvent('skinchanger:loadClothes', skin,Config.Liivit.fib.mies)
		elseif skin.sex == 1 then
			TriggerEvent('skinchanger:loadClothes', skin,Config.Liivit.fib.nainen)
		end
	elseif PlayerData.job ~= nil and PlayerData.job.name ~= 'sheriff' and PlayerData.job.name ~= 'police' then
		if skin.sex == 0 then
			TriggerEvent('skinchanger:loadClothes', skin,Config.Liivit.perusjamppa.mies)
		elseif skin.sex == 1 then
			TriggerEvent('skinchanger:loadClothes', skin,Config.Liivit.perusjamppa.nainen)
		end
	end
		
		
	end)
end)

RegisterNetEvent('luotiliivit:liivitpois')
AddEventHandler('luotiliivit:liivitpois', function(source)
	TriggerEvent('skinchanger:getSkin', function(skin)
		TriggerEvent('skinchanger:loadClothes',skin, {['bproof_1'] = 0,  ['bproof_2'] = 0})
		
		local armoritaso = GetPedArmour(GetPlayerPed(-1))
		TriggerServerEvent('luotiliivit:jokuvittu',armoritaso, Liivitbool)
		SetPedArmour(GetPlayerPed(-1), 0)
		Liivitbool = false
	end)
end)

Citizen.CreateThread(function()
		while true do
			Citizen.Wait(3000)
			
			local armoritaso = GetPedArmour(GetPlayerPed(-1))
			if armoritaso <= 0 and Liivitbool == true then
				TriggerEvent('skinchanger:getSkin', function(skin)
					TriggerEvent('skinchanger:loadClothes',skin, {['bproof_1'] = 0,  ['bproof_2'] = 0})
					TriggerServerEvent('luotiliivit:liivitrikki')
					Liivitbool = false
				end)
			end
		end		
end)