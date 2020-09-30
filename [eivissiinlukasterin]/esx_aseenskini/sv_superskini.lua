ESX               = nil

TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('superskini', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('tac_superskini:supervitunskini', source)

end)