ESX = nil

TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('tac_outlawalert:carJackInProgress')
AddEventHandler('tac_outlawalert:carJackInProgress', function(targetCoords, streetName, vehicleLabel, playerGender)
    mytype = 'police'
    data = {["code"] = '10-16', ["name"] = 'Autovarkaus  '   ..vehicleLabel..  '.', ["loc"] = streetName}
    length = 3500
    TriggerClientEvent('tac_outlawalert:outlawNotify', -1, mytype, data, length)
    TriggerClientEvent('tac_outlawalert:combatInProgress', -1, targetCoords)
    TriggerClientEvent('tac_outlawalert:carJackInProgress', -1, targetCoords)
end, false)

RegisterServerEvent('tac_outlawalert:combatInProgress')
AddEventHandler('tac_outlawalert:combatInProgress', function(targetCoords, streetName, playerGender)
	mytype = 'police'
    data = {["code"] = '10-10', ["name"] = 'Taistelu käynnissä', ["loc"] = streetName}
    length = 2500
    TriggerClientEvent('tac_outlawalert:outlawNotify', -1, mytype, data, length)
    TriggerClientEvent('tac_outlawalert:combatInProgress', -1, targetCoords)
end, false)

RegisterServerEvent('tac_outlawalert:gunshotInProgress')
AddEventHandler('tac_outlawalert:gunshotInProgress', function(targetCoords, streetName, playerGender)
	mytype = 'police'
    data = {["code"] = '10-11', ["name"] = 'Ammuskelu käynnissä', ["loc"] = streetName}
    length = 3500
    TriggerClientEvent('tac_outlawalert:outlawNotify', -1, mytype, data, length)
    TriggerClientEvent('tac_outlawalert:gunshotInProgress', -1, targetCoords)
end, false)

ESX.RegisterServerCallback('tac_outlawalert:isVehicleOwner', function(source, cb, plate)
	local identifier = GetPlayerIdentifier(source, 0)

	MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE owner = @owner AND plate = @plate', {
		['@owner'] = identifier,
		['@plate'] = plate
	}, function(result)
		if result[1] then
			cb(result[1].owner == identifier)
		else
			cb(false)
		end
	end)
end)
