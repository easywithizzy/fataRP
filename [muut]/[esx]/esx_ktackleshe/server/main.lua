-- 2018 Henric 'Kekke' Johansson

ESX = nil

TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('tac_kekke_tackle:tryTackle')
AddEventHandler('tac_kekke_tackle:tryTackle', function(target)
	local targetPlayer = ESX.GetPlayerFromId(target)

	TriggerClientEvent('tac_kekke_tackle:getTackled', targetPlayer.source, source)
	TriggerClientEvent('tac_kekke_tackle:playTackle', source)
end)