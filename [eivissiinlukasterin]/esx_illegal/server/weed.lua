local playersProcessingCannabis = {}

RegisterServerEvent('tac_illegal:pickedUpCannabis')
AddEventHandler('tac_illegal:pickedUpCannabis', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('cannabis')

	if xItem.limit ~= -1 and (xItem.count + 1) > xItem.limit then
		TriggerClientEvent('tac:showNotification', _source, _U('weed_inventoryfull'))
	else
		xPlayer.addInventoryItem(xItem.name, 1)
	end
end)

RegisterServerEvent('tac_illegal:processCannabis')
AddEventHandler('tac_illegal:processCannabis', function()
	if not playersProcessingCannabis[source] then
		local _source = source

		playersProcessingCannabis[_source] = ESX.SetTimeout(Config.Delays.WeedProcessing, function()
			local xPlayer = ESX.GetPlayerFromId(_source)
			local xCannabis, xMarijuana = xPlayer.getInventoryItem('cannabis'), xPlayer.getInventoryItem('marijuana')

			if xMarijuana.limit ~= -1 and (xMarijuana.count + 1) > xMarijuana.limit then
				TriggerClientEvent('tac:showNotification', _source, _U('weed_processingfull'))
			elseif xCannabis.count < 1 then
				TriggerClientEvent('tac:showNotification', _source, _U('weed_processingenough'))
			else
				xPlayer.removeInventoryItem('cannabis', 1)
				xPlayer.addInventoryItem('marijuana', 1)

				TriggerClientEvent('tac:showNotification', _source, _U('weed_processed'))
			end

			playersProcessingCannabis[_source] = nil
		end)
	else
		print(('esx_illegal: %s attempted to exploit weed processing!'):format(GetPlayerIdentifiers(source)[1]))
	end
end)

function CancelProcessing(playerID)
	if playersProcessingCannabis[playerID] then
		ESX.ClearTimeout(playersProcessingCannabis[playerID])
		playersProcessingCannabis[playerID] = nil
	end
end

RegisterServerEvent('tac_illegal:cancelProcessing')
AddEventHandler('tac_illegal:cancelProcessing', function()
	CancelProcessing(source)
end)

AddEventHandler('tac:playerDropped', function(playerID, reason)
	CancelProcessing(playerID)
end)

RegisterServerEvent('tac:onPlayerDeath')
AddEventHandler('tac:onPlayerDeath', function(data)
	CancelProcessing(source)
end)