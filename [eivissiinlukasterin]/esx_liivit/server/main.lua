ESX = nil
TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('bulletproof', function (source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('bulletproof', 1)

    TriggerClientEvent('cosasvariadas:kevlar', source)
    TriggerClientEvent('tac:showNotification', source, '~r~Laitoit liivit päälle!')
end)