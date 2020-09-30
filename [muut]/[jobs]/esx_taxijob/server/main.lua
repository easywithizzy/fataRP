ESX = nil

TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('tac_service:activateService', 'taxi:pay', Config.MaxInService)
end

TriggerEvent('tac_phone:registerNumber', 'taxi:pay', _U('taxi:pay_client'), true, true)
TriggerEvent('tac_society:registerSociety', 'taxi:pay', 'taxi:pay', 'society_taxi:pay', 'society_taxi:pay', 'society_taxi:pay', {type = 'public'})

RegisterServerEvent('tac_taxi:payjob:success')
AddEventHandler('tac_taxi:payjob:success', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name ~= 'taxi:pay' then
		print(('esx_taxi:payjob: %s attempted to trigger success!'):format(xPlayer.identifier))
		return
	end

	math.randomseed(os.time())

	local total = math.random(Config.NPCJobEarnings.min, Config.NPCJobEarnings.max)
	local societyAccount

	if xPlayer.job.grade >= 3 then
		total = total * 2
	end

	TriggerEvent('tac_addonaccount:getSharedAccount', 'society_taxi:pay', function(account)
		societyAccount = account
	end)

	if societyAccount then
		local playerMoney  = ESX.Math.Round(total / 100 * 30)
		local societyMoney = ESX.Math.Round(total / 100 * 70)

		xPlayer.addMoney(playerMoney)
		societyAccount.addMoney(societyMoney)

		TriggerClientEvent('tac:showNotification', xPlayer.source, _U('comp_earned', societyMoney, playerMoney))
	else
		xPlayer.addMoney(total)
		TriggerClientEvent('tac:showNotification', xPlayer.source, _U('have_earned', total))
	end

end)

RegisterServerEvent('tac_taxi:payjob:getStockItem')
AddEventHandler('tac_taxi:payjob:getStockItem', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name ~= 'taxi:pay' then
		print(('esx_taxi:payjob: %s attempted to trigger getStockItem!'):format(xPlayer.identifier))
		return
	end
	
	TriggerEvent('tac_addoninventory:getSharedInventory', 'society_taxi:pay', function(inventory)
		local item = inventory.getItem(itemName)
		local sourceItem = xPlayer.getInventoryItem(itemName)

		-- is there enough in the society?
		if count > 0 and item.count >= count then
		
			-- can the player carry the said amount of x item?
			if sourceItem.limit ~= -1 and (sourceItem.count + count) > sourceItem.limit then
				TriggerClientEvent('tac:showNotification', xPlayer.source, _U('player_cannot_hold'))
			else
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('tac:showNotification', xPlayer.source, _U('have_withdrawn', count, item.label))
			end
		else
			TriggerClientEvent('tac:showNotification', xPlayer.source, _U('quantity_invalid'))
		end
	end)
end)

ESX.RegisterServerCallback('tac_taxi:payjob:getStockItems', function(source, cb)
	TriggerEvent('tac_addoninventory:getSharedInventory', 'society_taxi:pay', function(inventory)
		cb(inventory.items)
	end)
end)

RegisterServerEvent('tac_taxi:payjob:putStockItems')
AddEventHandler('tac_taxi:payjob:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name ~= 'taxi:pay' then
		print(('esx_taxi:payjob: %s attempted to trigger putStockItems!'):format(xPlayer.identifier))
		return
	end

	TriggerEvent('tac_addoninventory:getSharedInventory', 'society_taxi:pay', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('tac:showNotification', xPlayer.source, _U('have_deposited', count, item.label))
		else
			TriggerClientEvent('tac:showNotification', xPlayer.source, _U('quantity_invalid'))
		end

	end)

end)

ESX.RegisterServerCallback('tac_taxi:payjob:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb( { items = items } )
end)
