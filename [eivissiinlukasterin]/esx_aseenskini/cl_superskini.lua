ESX              = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('tac_superskini:supervitunskini')
AddEventHandler('tac_superskini:supervitunskini', function(h)
	if IsPedArmed(PlayerPedId(), 7) then
		local tintit = GetWeaponTintCount(GetSelectedPedWeapon(PlayerPedId()))
		SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), -1)
		local yolo = 0
		local elements = {}
		table.insert(elements, {label = "Vakio", value = yolo})
		for i=1,tintit do
			yolo = yolo + 1
			table.insert(elements, {label = yolo, value = yolo})
		end
		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'hahaa21',
			{
				title    = "Skinit",
				align    = 'bottom-left',
				elements = elements,
			}, 
		function(data, menu)
	
			local action = data.current.value
	
			if action ~= nil then
				SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), action)
			end
	
		end, function(data, menu)
			menu.close()
		end)
	else
		ESX.ShowNotification('Sinulla ei ole asetta kädessä')
	end
end)
