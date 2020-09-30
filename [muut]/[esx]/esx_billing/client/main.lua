local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX          = nil
local GUI    = {}
local isDead = false
GUI.Time     = 0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function ShowBillsMenu()

	ESX.TriggerServerCallback('tac_billing:getBills', function(bills)

		ESX.UI.Menu.CloseAll()

		local elements = {}

		for i=1, #bills, 1 do
			table.insert(elements, {label = bills[i].label .. ' €' .. bills[i].amount, value = bills[i].id})
		end

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'billing',
			{
				title    = _U('invoices'),
				align = 'bottom-right',
				css = 'laskut',
				elements = elements
			},
			function(data, menu)

				menu.close()

				local billId = data.current.value

				ESX.TriggerServerCallback('tac_billing:payBill', function()
					ShowBillsMenu()
				end, billId)

			end,
			function(data, menu)
				menu.close()
			end
		)

	end)

end

function basemenu()
		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'el1te_hallitsee_lol',
			{
				title    = "",
				align    = 'bottom-right',
				elements = {
					{ label = "Laskut", value = "laskut" },
					{label = 'Katso ajokorttiasi', value = 'katso'},
					{label = 'Näytä ajokorttisi', value = 'näytä'},
					{ label = 'Poista luotiliivit', value = 'poistaluotiliivi' },
				}
			}, 
		function(data, menu)

			local action = data.current.value

			if action == "laskut" then
				ShowBillsMenu()

			elseif data.current.value == 'poistaluotiliivi' then
			
				if GetPedArmour(GetPlayerPed(-1)) > 50 then
					SetPedArmour(GetPlayerPed(-1), 0)
					TriggerServerEvent('tac_billing:annaarmorit')
					ESX.ShowNotification('Otit luotiliivit pois päältäsi')
				else
					ESX.ShowNotification('Luotiliivisi ovat vaurioituneet tai sinulla ei ole luotiliivejä')
				end

			elseif action == 'katso' then
					TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
			elseif action == 'näytä' then
				local player, distance = ESX.Game.GetClosestPlayer()
				
				if distance ~= -1 and distance <= 3.0 then
					TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'driver')
				else
					ESX.ShowNotification('Ei pelaajia lähettyvillä')
				end
			end

		end, function(data, menu)
			menu.close()
		end)
end

-- Key controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(25)
		if IsControlPressed(0, Keys["F5"]) and IsInputDisabled(0) and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'billing') and (GetGameTimer() - GUI.Time) > 150 then
			basemenu()
			GUI.Time = GetGameTimer()
		end
	end
end)

AddEventHandler('tac:onPlayerDeath', function(data)
	isDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
	isDead = false
end)
