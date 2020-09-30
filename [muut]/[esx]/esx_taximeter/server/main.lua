ESX = nil

TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('tac_taxi:paymeter:updatePassengerMeters')
AddEventHandler('tac_taxi:paymeter:updatePassengerMeters', function(player, meterAttrs)
  TriggerClientEvent('tac_taxi:paymeter:updatePassenger', player, meterAttrs)
end)


RegisterServerEvent('tac_taxi:paymeter:resetPassengerMeters')
AddEventHandler('tac_taxi:paymeter:resetPassengerMeters', function(player)
  TriggerClientEvent('tac_taxi:paymeter:resetMeter', player)
end)

RegisterServerEvent('tac_taxi:paymeter:updatePassengerLocation')
AddEventHandler('tac_taxi:paymeter:updatePassengerLocation', function(player)
  TriggerClientEvent('tac_taxi:paymeter:updateLocation', player)
end)
