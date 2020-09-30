ESX = nil


TriggerEvent('tac:getSharedObject', function(obj)
	ESX = obj
end)

ESX.RegisterUsableItem('weed', function(source)
        
        local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeInventoryItem('weed', 1)

	TriggerClientEvent('tac_status:add', _source, 'drug', 166000)
	TriggerClientEvent('tac_drugeffects:onWeed', source)
end)

ESX.RegisterUsableItem('opium', function(source)
       
        local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('opium', 1)

	TriggerClientEvent('tac_status:add', _source, 'drug', 15000)
	TriggerClientEvent('tac_drugeffects:onOpium', source)
end)

ESX.RegisterUsableItem('meth', function(source)
        
        local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('meth', 1)

	TriggerClientEvent('tac_status:add', _source, 'drug', 333000)
	TriggerClientEvent('tac_drugeffects:onMeth', source)
end)

ESX.RegisterUsableItem('coke', function(source)
        
        local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('coke', 1)

	TriggerClientEvent('tac_status:add', _source, 'drug', 499000)
	TriggerClientEvent('tac_drugeffects:onCoke', source)
end)


ESX.RegisterUsableItem('lsd', function(source)
        
        local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('lsd', 1)

	TriggerClientEvent('tac_status:add', _source, 'drug', 499000)
	TriggerClientEvent('tac_drugeffects:onLsd', source)
end)

ESX.RegisterUsableItem('beer', function(source)
        
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('beer', 1)
    TriggerClientEvent('tac_drugeffects:onBeer', source)
    TriggerClientEvent('tac_status:add', _source, 'drug', 249000)
end)














