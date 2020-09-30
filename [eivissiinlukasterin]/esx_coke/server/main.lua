-- Esx_oranges Script modified by xFatalityh#8920 for coke!
-- Esx_oranges Script modified by xFatalityh#8920 for coke!
-- Esx_oranges Script modified by xFatalityh#8920 for coke!
-- Esx_oranges Script modified by xFatalityh#8920 for coke!
-- Esx_oranges Script modified by xFatalityh#8920 for coke!
-- Esx_oranges Script modified by xFatalityh#8920 for coke!
-- Esx_oranges Script modified by xFatalityh#8920 for coke!
ESX 						   = nil
local CopsConnected       	   = 0
local PlayersHarvestingCoke    = {}
local PlayersKuivaus           = {}
local PlayersProcess       = {}
local PlayersProcess2      = {}
local PlayersPacking       = {}


--[[
local CopsConnected       	   = 0
local PlayersHarvestingKoda    = {}
local PlayersProcess  = {}
local PlayersSellingKoda       = {}
--]]


TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)

function CountCops()
	local xPlayers = ESX.GetPlayers()

	CopsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' == 'sheriff' then
			CopsConnected = CopsConnected + 1
		end
	end

	SetTimeout(120 * 1000, CountCops)
end

CountCops()

--kodeina
local function HarvestKoda(source)

	SetTimeout(Config.TimeToFarm, function()
		if PlayersHarvestingCoke[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local koda = xPlayer.getInventoryItem('coca_leaf')

			if koda.limit ~= -1 and koda.count >= koda.limit then
				TriggerClientEvent('tac:showNotification', source, _U('bag_full'))
			else
				xPlayer.addInventoryItem('coca_leaf', 1)
				HarvestKoda(source)
			end
		end
	end)
end

RegisterServerEvent('tac_farmoranges:startHarvestKoda')
AddEventHandler('tac_farmoranges:startHarvestKoda', function()
	local _source = source

	if not PlayersHarvestingKoda[_source] then
		PlayersHarvestingKoda[_source] = true

		TriggerClientEvent('tac:showNotification', _source, _U('take_orage'))
		HarvestKoda(_source)
	else
		print(('esx_farmoranges: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('tac_farmoranges:stopHarvestKoda')
AddEventHandler('tac_farmoranges:stopHarvestKoda', function()
	local _source = source

	PlayersHarvestingKoda[_source] = false
end)

-----------------------------------------------------------------------------------------------------------

local function Kuivaus(source)

	SetTimeout(Config.TimeToProcess, function()
		if PlayersKuivaus[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local leafQuantity = xPlayer.getInventoryItem('coca_leaf').count
			local pooch1 = xPlayer.getInventoryItem('coca_dry')

			if pooch1.limit ~= -1 and pooch1.count >= pooch1.limit then
				TriggerClientEvent('tac:showNotification', source, _U('you_do_not_have_enough_oranges'))
			elseif kodaQuantity < 1 then
				TriggerClientEvent('tac:showNotification', source, _U('you_do_not_have_any_more_oranges'))
			else
				xPlayer.removeInventoryItem('coca_leaf', 1)
				xPlayer.addInventoryItem('coca_dry', 1)

				Kuivaus(source)
			end
		end
	end)
end

RegisterServerEvent('tac_farmoranges:startTransformKoda')
AddEventHandler('tac_farmoranges:startTransformKoda', function()
	local _source = source

	if not PlayersKuivaus[_source] then
		PlayersKuivaus[_source] = true

		TriggerClientEvent('tac:showNotification', _source, _U('transform_juice_orage'))
		Kuivaus(_source)
	else
		print(('esx_farmoranges: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('tac_farmoranges:stopTransformKoda')
AddEventHandler('tac_farmoranges:stopTransformKoda', function()
	local _source = source

	PlayersKuivaus[_source] = false
end)

-------------------------------------------------------------------------------------------------------------------------------------------------

local function Processing(source)

	SetTimeout(Config.TimeToProcess, function()
		if PlayersProcess[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local DryQuantity = xPlayer.getInventoryItem('coca_dry').count
			--local pooch2 = xPlayer.getInventoryItem('coca_paste')
			local valineet = xPlayer.getInventoryItem('valineet')

			if  DryQuantity < 1 then
				TriggerClientEvent('tac:showNotification', source, _U('you_do_not_have_any_more_oranges2'))
			elseif valineet < 1 then
                TriggerClientEvent('tac:showNotification', source, _U('NoValineet'))	
			else
				xPlayer.removeInventoryItem('coca_dry', 1)
				xPlayer.addInventoryItem('coca_paste', 1)

				Processing(source)
			end
		end
	end)
end

RegisterServerEvent('tac_coke:tahna')
AddEventHandler('tac_coke:tahna', function()
	local _source = source

	if not PlayersProcess[_source] then
		PlayersProcess[_source] = true

		TriggerClientEvent('tac:showNotification', _source, _U('transform_juice_orage'))
		Processing(_source)
	else
		print(('esx_farmoranges: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('tac_coke:stopTahna')
AddEventHandler('tac_coke:stopTahna', function()
	local _source = source

	PlayersProcess[_source] = false
end)

-----------------------------------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------------------------------------------

local function Processing2(source)

	SetTimeout(Config.TimeToProcess, function()
		if PlayersProcess2[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local PasteQuantity = xPlayer.getInventoryItem('coca_paste').count
			local Aine = xPlayer.getInventoryItem('aine')		
			if PasteQuantity < 1 then
				TriggerClientEvent('tac:showNotification', source, _U('you_do_not_have_any_more_oranges2'))
			elseif Aine < 1 then
                TriggerClientEvent('tac:showNotification', source, _U('NoAine'))	
			else
				xPlayer.removeInventoryItem('coca_paste', 1)
				xPlayer.removeInventoryItem('Valmistusaine', 1)
				xPlayer.addInventoryItem('coke', 1)

				Processing2(source)
			end
		end
	end)
end

RegisterServerEvent('tac_coke:kokaiini')
AddEventHandler('tac_coke:kokaiini', function()
	local _source = source

	if not PlayersProcess2[_source] then
		PlayersProcess2[_source] = true

		TriggerClientEvent('tac:showNotification', _source, _U('transform_juice_orage'))
		Processing2(_source)
	else
		print(('esx_farmoranges: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('tac_coke:stopCoke')
AddEventHandler('tac_coke:stopCoke', function()
	local _source = source

	PlayersProcess2[_source] = false
end)

-----------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------------------

local function Packing(source)

	SetTimeout(Config.TimeToProcess, function()
		if PlayersPacking[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local CokeQuantity = xPlayer.getInventoryItem('coke').count
			local pussi = xPlayer.getInventoryItem('mpussi')		
			if  CokeQuantity < 1 then
				TriggerClientEvent('tac:showNotification', source, _U('you_do_not_have_any_more_oranges2'))
			elseif pussi < 1 then
                TriggerClientEvent('tac:showNotification', source, _U('NoPussi'))	
			else
				xPlayer.removeInventoryItem('coke', 28)
				xPlayer.removeInventoryItem('mpussi', 1)
				xPlayer.addInventoryItem('coke_pooch', 1)

				Packing(source)
			end
		end
	end)
end

RegisterServerEvent('tac_packing:pakkaus')
AddEventHandler('tac_packing:pakkaus', function()
	local _source = source

	if not PlayersPacking[_source] then
		PlayersPacking[_source] = true

		TriggerClientEvent('tac:showNotification', _source, _U('transform_juice_orage'))
		Packing(_source)
	else
		print(('esx_farmoranges: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('tac_packing:Stoppakkaus')
AddEventHandler('tac_packing:Stoppakkaus', function()
	local _source = source

	PlayersPacking[_source] = false
end)

-----------------------------------------------------------------------------------------------------------------------------------------------


RegisterServerEvent('tac_farmoranges:GetUserInventory')
AddEventHandler('tac_farmoranges:GetUserInventory', function(currentZone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('tac_farmoranges:ReturnInventory',
		_source,
		xPlayer.getInventoryItem('coca_dry').count,
		xPlayer.getInventoryItem('coca_paste').count,
		xPlayer.getInventoryItem('coke').count,
		xPlayer.getInventoryItem('coke_pooch').count,
		xPlayer.getInventoryItem('coca_leaf').count,
		xPlayer.getInventoryItem('mpussi').count,
		xPlayer.getInventoryItem('valineet').count,
		xPlayer.getInventoryItem('coke_pooch').count,
		xPlayer.job.name,
		currentZone
	)
end)
