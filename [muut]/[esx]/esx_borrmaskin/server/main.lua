ESX               = nil

TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('drill', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local drill = xPlayer.getInventoryItem('drill')

    xPlayer.removeInventoryItem('drill', 1)
    TriggerClientEvent('tac_borrmaskin:startDrill', source)
end)
