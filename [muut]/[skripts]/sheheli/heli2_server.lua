-- FiveM Helikopterin lämpökamera [LUKASTERI][TIMANTTIRP]
-- Versio 1.0 | 14.7.2020

RegisterServerEvent('heli:spotlight')
AddEventHandler('heli:spotlight', function(state)
	local serverID = source
	TriggerClientEvent('heli:spotlight', -1, serverID, state)
end)