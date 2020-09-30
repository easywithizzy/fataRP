ESX = nil

TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('itemmyynti:sell')
AddEventHandler('itemmyynti:sell', function()
    _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local itemAmount = xPlayer.getInventoryItem('Romu').count
	if itemAmount > 0 then
		xPlayer.removeInventoryItem('Romu', itemAmount)
	local price = itemAmount*math.random(35,450)
		xPlayer.addMoney(price)
	end
end)