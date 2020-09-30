ESX               = nil

TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('pendrive', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local pendrive = xPlayer.getInventoryItem('pendrive')

    xPlayer.removeInventoryItem('pendrive', 1)
    TriggerClientEvent('tac_borrmaskin_humane:startpendrive', source)
end)
