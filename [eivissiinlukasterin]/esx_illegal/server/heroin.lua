local playersProcessingPoppyResin = {}

RegisterServerEvent('tac_illegal:pickedUpPoppy')
AddEventHandler('tac_illegal:pickedUpPoppy', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('poppyresin')

	if xItem.limit ~= -1 and (xItem.count + 1) > xItem.limit then
		TriggerClientEvent('tac:showNotification', _source, _U('poppy_inventoryfull'))
	else
		xPlayer.addInventoryItem(xItem.name, 3)
	end
end)

RegisterServerEvent('tac_illegal:processPoppyResin')
AddEventHandler('tac_illegal:processPoppyResin', function()
	if not playersProcessingPoppyResin[source] then
		local _source = source

		playersProcessingPoppyResin[_source] = ESX.SetTimeout(Config.Delays.HeroinProcessing, function()
			local xPlayer = ESX.GetPlayerFromId(_source)
			local xPoppyResin, xHeroin = xPlayer.getInventoryItem('poppyresin'), xPlayer.getInventoryItem('heroin')

			if xHeroin.limit ~= -1 and (xHeroin.count + 1) > xHeroin.limit then
				TriggerClientEvent('tac:showNotification', _source, _U('heroin_processingfull'))
			elseif xPoppyResin.count < 1 then
				TriggerClientEvent('tac:showNotification', _source, _U('heroin_processingenough'))
			else
				xPlayer.removeInventoryItem('poppyresin', 1)
				xPlayer.addInventoryItem('heroin', 1)

				TriggerClientEvent('tac:showNotification', _source, _U('heroin_processed'))
			end

			playersProcessingPoppyResin[_source] = nil
		end)
	else
		print(('esx_illegal: %s attempted to exploit heroin processing!'):format(GetPlayerIdentifiers(source)[1]))
	end
end)

function CancelProcessing(playerID)
	if playersProcessingPoppyResin[playerID] then
		ESX.ClearTimeout(playersProcessingPoppyResin[playerID])
		playersProcessingPoppyResin[playerID] = nil
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