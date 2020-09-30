local playersProcessingCocaLeaf = {}

RegisterServerEvent('tac_illegal:pickedUpCocaLeaf')
AddEventHandler('tac_illegal:pickedUpCocaLeaf', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('coca_leaf')

	if xItem.limit ~= -1 and (xItem.count + 1) > xItem.limit then
		TriggerClientEvent('tac:showNotification', _source, _U('coca_leaf_inventoryfull'))
	else
		xPlayer.addInventoryItem(xItem.name, 3)
	end
end)

RegisterServerEvent('tac_illegal:processCocaLeaf')
AddEventHandler('tac_illegal:processCocaLeaf', function()
	if not playersProcessingCocaLeaf[source] then
		local _source = source

		playersProcessingCocaLeaf[_source] = ESX.SetTimeout(Config.Delays.CokeProcessing, function()
			local xPlayer = ESX.GetPlayerFromId(_source)
			local xCocaLeaf, xCoke = xPlayer.getInventoryItem('coca_leaf'), xPlayer.getInventoryItem('coke')

			if xCoke.limit ~= -1 and (xCoke.count + 1) > xCoke.limit then
				TriggerClientEvent('tac:showNotification', _source, _U('coke_processingfull'))
			elseif xCocaLeaf.count < 1 then
				TriggerClientEvent('tac:showNotification', _source, _U('coke_processingenough'))
			else
				xPlayer.removeInventoryItem('coca_leaf', 1)
				xPlayer.addInventoryItem('coke', 1)

				TriggerClientEvent('tac:showNotification', _source, _U('coke_processed'))
			end

			playersProcessingCocaLeaf[_source] = nil
		end)
	else
		print(('esx_illegal: %s attempted to exploit coke processing!'):format(GetPlayerIdentifiers(source)[1]))
	end
end)

function CancelProcessing(playerID)
	if playersProcessingCocaLeaf[playerID] then
		ESX.ClearTimeout(playersProcessingCocaLeaf[playerID])
		playersProcessingCocaLeaf[playerID] = nil
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