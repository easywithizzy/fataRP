ESX = nil

TriggerEvent('tac:getSharedObject', function(obj)
	ESX = obj
end)

ESX.RegisterUsableItem('beer', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('beer', 1)

	TriggerClientEvent('tac_status:add', source, 'drunk', 50000)
	TriggerClientEvent('tac_status:add', source, 'thirst', 80000)
	TriggerClientEvent('tac_optionalneeds:onDrink', source, 'prop_amb_beer_bottle')
	TriggerClientEvent('tac:showNotification', source, _U('used_beer'))

end)

ESX.RegisterUsableItem('longdrink', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('longdrink', 1)

	TriggerClientEvent('tac_status:add', source, 'drunk', 50000)
	TriggerClientEvent('tac_status:add', source, 'thirst', 80000)
	TriggerClientEvent('tac_optionalneeds:onDrink', source, 'prop_orang_can_01')
	TriggerClientEvent('tac:showNotification', source, _U('used_longdrink'))

end)

ESX.RegisterUsableItem('siideri', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('siideri', 1)

	TriggerClientEvent('tac_status:add', source, 'drunk', 50000)
	TriggerClientEvent('tac_status:add', source, 'thirst', 80000)
	TriggerClientEvent('tac_optionalneeds:onDrink', source, 'prop_ld_can_01')
	TriggerClientEvent('tac:showNotification', source, _U('used_siideri'))

end)

ESX.RegisterUsableItem('jager', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('jager', 1)

	TriggerClientEvent('tac_status:add', source, 'drunk', 230000)
	TriggerClientEvent('tac_optionalneeds:onShot', source)
	TriggerClientEvent('tac:showNotification', source, _U('used_jager'))

end)

ESX.RegisterUsableItem('vodka', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vodka', 1)

	TriggerClientEvent('tac_status:add', source, 'drunk', 230000)
	TriggerClientEvent('tac_optionalneeds:onShot', source, 'p_cs_shot_glass_s')
	TriggerClientEvent('tac:showNotification', source, _U('used_vodka'))

end)

ESX.RegisterUsableItem('rhum', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('rhum', 1)

	TriggerClientEvent('tac_status:add', source, 'drunk', 230000)
	TriggerClientEvent('tac_optionalneeds:onShot', source)
	TriggerClientEvent('tac:showNotification', source, _U('used_rhum'))

end)

ESX.RegisterUsableItem('whisky', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('whisky', 1)

	TriggerClientEvent('tac_status:add', source, 'drunk', 230000)
	TriggerClientEvent('tac_optionalneeds:onShot', source)
	TriggerClientEvent('tac:showNotification', source, _U('used_whisky'))

end)

ESX.RegisterUsableItem('tequila', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('tequila', 1)

	TriggerClientEvent('tac_status:add', source, 'drunk', 240000)
	TriggerClientEvent('tac_optionalneeds:onShot', source)
	TriggerClientEvent('tac:showNotification', source, _U('used_tequila'))

end)

ESX.RegisterUsableItem('martini', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('martini', 1)

	TriggerClientEvent('tac_status:add', source, 'drunk', 250000)
	TriggerClientEvent('tac_optionalneeds:onShot', source)
	TriggerClientEvent('tac:showNotification', source, _U('used_martini'))

end)

ESX.RegisterUsableItem('jagerbomb', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('jagerbomb', 1)

    TriggerClientEvent('tac_status:add', source, 'drunk', 280000)
    TriggerClientEvent('tac_optionalneeds:onShot', source)
    TriggerClientEvent('tac:showNotification', source, _U('used_jagerbomb'))

end)

ESX.RegisterUsableItem('golem', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('golem', 1)

	TriggerClientEvent('tac_status:add', source, 'drunk', 250000)
	TriggerClientEvent('tac_optionalneeds:onShot', source)
	TriggerClientEvent('tac:showNotification', source, _U('used_golem'))

end)

ESX.RegisterUsableItem('whiskycoca', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('whiskycoca', 1)

	TriggerClientEvent('tac_status:add', source, 'drunk', 220000)
	TriggerClientEvent('tac_optionalneeds:onShot', source)
	TriggerClientEvent('tac:showNotification', source, _U('used_whiskycoca'))

end)

ESX.RegisterUsableItem('vodkaenergy', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vodkaenergy', 1)

	TriggerClientEvent('tac_status:add', source, 'drunk', 250000)
	TriggerClientEvent('tac_optionalneeds:onShot', source)
	TriggerClientEvent('tac:showNotification', source, _U('used_vodkaenergy'))

end)

ESX.RegisterUsableItem('vodkafruit', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vodkafruit', 1)

	TriggerClientEvent('tac_status:add', source, 'drunk', 250000)
	TriggerClientEvent('tac_optionalneeds:onShot', source)
	TriggerClientEvent('tac:showNotification', source, _U('used_vodkafruit'))

end)

ESX.RegisterUsableItem('rhumfruit', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('rhumfruit', 1)

	TriggerClientEvent('tac_status:add', source, 'drunk', 250000)
	TriggerClientEvent('tac_optionalneeds:onShot', source)
	TriggerClientEvent('tac:showNotification', source, _U('used_rhumfruit'))

end)

ESX.RegisterUsableItem('teqpaf', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('teqpaf', 1)

	TriggerClientEvent('tac_status:add', source, 'drunk', 310000)
	TriggerClientEvent('tac_optionalneeds:onShot', source)
	TriggerClientEvent('tac:showNotification', source, _U('used_teqpaf'))

end)

ESX.RegisterUsableItem('rhumcoca', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('rhumcoca', 1)

	TriggerClientEvent('tac_status:add', source, 'drunk', 220000)
	TriggerClientEvent('tac_optionalneeds:onShot', source)
	TriggerClientEvent('tac:showNotification', source, _U('used_rhumcoca'))

end)

ESX.RegisterUsableItem('mojito', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('mojito', 1)

	TriggerClientEvent('tac_status:add', source, 'drunk', 220000)
	TriggerClientEvent('tac_optionalneeds:onShot', source)
	TriggerClientEvent('tac:showNotification', source, _U('used_mojito'))

end)

ESX.RegisterUsableItem('metreshooter', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('metreshooter', 1)

	TriggerClientEvent('tac_status:add', source, 'drunk', 350000)
	TriggerClientEvent('tac_optionalneeds:onShot', source)
	TriggerClientEvent('tac:showNotification', source, _U('used_metreshooter'))

end)

ESX.RegisterUsableItem('jagercerbere', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('jagercerbere', 1)

    TriggerClientEvent('tac_status:add', source, 'drunk', 290000)
    TriggerClientEvent('tac_optionalneeds:onShot', source)
    TriggerClientEvent('tac:showNotification', source, _U('used_jagercerbere'))

end)


