ESX               = nil

TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)

----
ESX.RegisterUsableItem('handcuffs', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('handcuffs', 1)

	TriggerClientEvent('tac_esx_cuffs:usedHandcuff', source)
end)

RegisterServerEvent('tac_esx_cuffs:handcuff')
AddEventHandler('tac_esx_cuffs:handcuff', function(source)
  TriggerClientEvent('tac_esx_cuffs:addHandcuffs', source)
end)

----
ESX.RegisterUsableItem('key', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	--xPlayer.removeInventoryItem('key', 1)

	TriggerClientEvent('tac_esx_cuffs:usedKey', source)
end)

RegisterServerEvent('tac_esx_cuffs:unhandcuff')
AddEventHandler('tac_esx_cuffs:unhandcuff', function(source)
  TriggerClientEvent('tac_esx_cuffs:removeHandcuffs', source)
end)