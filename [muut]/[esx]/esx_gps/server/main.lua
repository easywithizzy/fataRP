ESX = nil

TriggerEvent('tac:getSharedObject', function(obj)
	ESX = obj
end)

AddEventHandler('tac:onAddInventoryItem', function(source, item, count)
	if item.name == 'gps' then
		TriggerClientEvent('tac_gps:addGPS', source)
	end
end)

AddEventHandler('tac:onRemoveInventoryItem', function(source, item, count)
	if item.name == 'gps' and item.count < 1 then
		TriggerClientEvent('tac_gps:removeGPS', source)
	end
end)