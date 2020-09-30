ESX = nil
local PlayerData = {}
local onkoradio = false
local radiotaajuus = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while PlayerData.job == nil do
		Citizen.Wait(1000)
		PlayerData = ESX.GetPlayerData()
	end
end)

RegisterNetEvent('tac:setJob')
AddEventHandler('tac:setJob', function(job)
  PlayerData.job = job
end)

function OpenRadioMenu()

	local elements = {}
		
	if PlayerData.job.name == 'police' then --jos poliisi niin
		table.insert(elements, { label = 'Poliisi', value = 1}) -- tässä value 1 se radiotaajuus 1
		table.insert(elements, { label = 'Valmiusyksikkö 1', value = 5})
		table.insert(elements, { label = 'Valmiusyksikkö 2', value = 6})
		table.insert(elements, { label = 'Sheriffi', value = 7})
		table.insert(elements, { label = 'Ensihoito', value = 2})-- tässä value 2 se radiotajuus
	elseif PlayerData.job.name == 'sheriff' then --jos lanssi niin
		table.insert(elements, { label = 'Sheriffi', value = 7})
	elseif PlayerData.job.name == 'ambulance' then --jos lanssi niin
		table.insert(elements, { label = 'Ensihoito', value = 2})-- tässä value 2 se radiotajuus
		table.insert(elements, { label = 'Sheriffi', value = 7})
		table.insert(elements, { label = 'Poliisi', value = 1}) -- tässä value 1 se radiotaajuus 1
	elseif PlayerData.job.name == 'mechanic' then
		table.insert(elements, { label = 'Mekaanikko', value = 3})
	elseif PlayerData.job.name == 'taxi:pay' then
		table.insert(elements, { label = 'Taksi', value = 4})
	elseif PlayerData.job.name == 'fib' then
		table.insert(elements, { label = 'Poliisi', value = 1})
		table.insert(elements, { label = 'Ensihoito', value = 2})
		table.insert(elements, { label = 'Mekaanikko', value = 3})
		table.insert(elements, { label = 'Taksi', value = 4})
		table.insert(elements, { label = 'Valmiusyksikkö 1', value = 5})
		table.insert(elements, { label = 'Valmiusyksikkö 2', value = 6})
		table.insert(elements, { label = 'Valmiusyksikkö 3', value = 7})
	end
		
	table.insert(elements, { label = 'Liity avoimelle taajuudelle', value = 'avoin'}) 
	table.insert(elements, { label = 'Poistu radiotaajuudelta', value = 'poistu'}) 
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'radio',
		{
		title    = 'Radiotaajuus',
		align    = 'bottom-right',
		elements = elements,
		},

		function(data, menu)
		
		menu.close()
		
		if radiotaajuus ~= nil then
			exports.tokovoip_script:removePlayerFromRadio(radiotaajuus)
			radiotaajuus = nil
		end
		
		if data.current.value == 'avoin' then
			AddTextEntry('FMMC_KEY_TIP8', "Taajuus 11.1-99.9")
			DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "", "", "", "", 4)
			while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
				Citizen.Wait(0)
			end
			local kokeilu = GetOnscreenKeyboardResult()
			kokeilu = tonumber(kokeilu)
--			kokeilu = math.floor(kokeilu)
			Citizen.Wait(150)
			if kokeilu ~= nil and kokeilu > 11 and kokeilu < 100 then
				radiotaajuus = kokeilu
				exports.tokovoip_script:addPlayerToRadio(radiotaajuus, true)
				ESX.ShowNotification('~g~Liityit radiotaajuudelle~w~ '..radiotaajuus)
			else
				ESX.ShowNotification('~r~Virheellinen radiotaajuus')
			end
		elseif data.current.value == 'poistu' then
		else
			radiotaajuus = data.current.value
			exports.tokovoip_script:addPlayerToRadio(radiotaajuus, true)
		end
		
		CurrentAction     = 'radio'
		CurrentActionMsg  = 'Radiotaajuus'
		CurrentActionData = {}

		end,
	
	function(data, menu)

		menu.close()

		CurrentAction     = 'radio'
		CurrentActionMsg  = 'Radiotaajuus'
		CurrentActionData = {}
	end)
end

RegisterNetEvent('tac_tokovoippi:onkoradio')
AddEventHandler('tac_tokovoippi:onkoradio', function(onkovaiei)
	onkoradio = onkovaiei
	if not onkoradio then
		if radiotaajuus ~= nil then
--			if PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'mecano' or PlayerData.job.name == 'taxi:pay' then
--			else
				exports.tokovoip_script:removePlayerFromRadio(radiotaajuus)
				radiotaajuus = nil
--			end
		end
	end
end)

RegisterNetEvent('tac_tokovoippi:radio')
AddEventHandler('tac_tokovoippi:radio', function()
	OpenRadioMenu()
end)

RegisterNetEvent('tac:onPlayerDeath')
AddEventHandler('tac:onPlayerDeath', function()
	if radiotaajuus ~= nil then
	exports.tokovoip_script:removePlayerFromRadio(radiotaajuus)
		radiotaajuus = nil
	end
end)
