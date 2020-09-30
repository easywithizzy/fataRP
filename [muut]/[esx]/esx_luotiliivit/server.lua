ESX = nil

TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('luotiliivi', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('luotiliivi', 1)
	
	if xPlayer.job.name == 'sheriff' then
		TriggerClientEvent('tac:showNotification', source, '~y~Laitoit sheriffien liivit.')
	elseif xPlayer.job.name == 'police' then
		TriggerClientEvent('tac:showNotification', source, '~y~Laitoit poliisien liivit.')
	else
		TriggerClientEvent('tac:showNotification', source, '~y~Laitoit luotiliivit.')
	end

		TriggerClientEvent('luotiliivit:addarmour', source)
end)

RegisterCommand("liivitpois", function(source, args, rawCommand)
    TriggerClientEvent('luotiliivit:liivitpois', source)
end, false)


RegisterNetEvent('luotiliivit:jokuvittu')
AddEventHandler('luotiliivit:jokuvittu', function(armoritaso, Liivitbool)
	if Liivitbool == false then
	TriggerClientEvent('tac:showNotification', source, '~r~Ei sulla ole liivejä...')
else
	if armoritaso >= Config.DiscardArmor then	
		local xPlayer = ESX.GetPlayerFromId(source)
		TriggerClientEvent('tac:showNotification', source, '~g~Pakkasit liivit.')
		xPlayer.addInventoryItem('luotiliivi', 1)
		else
		TriggerClientEvent('tac:showNotification', source, '~r~Heitit liivit pois.')	
	end

end
end)

RegisterNetEvent('luotiliivit:liivitrikki')
AddEventHandler('luotiliivit:liivitrikki', function(armoritaso, Liivitbool)
	TriggerClientEvent('tac:showNotification', source, '~r~Liivit meni rikki.')
end)