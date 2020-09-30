
ESX = nil

TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('mask', function(source)
 	TriggerClientEvent('tac_copweapon:mask',source)
end)
