ESX = nil

TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('tac:playerLoaded', function(source)
	TriggerEvent('tac_license:getLicenses', source, function(licenses)
		TriggerClientEvent('tac_dmv:successschool:loadLicenses', source, licenses)
	end)
end)

RegisterNetEvent('tac_dmv:successschool:addLicense')
AddEventHandler('tac_dmv:successschool:addLicense', function(type)
	local _source = source

	TriggerEvent('tac_license:addLicense', _source, type, function()
		TriggerEvent('tac_license:getLicenses', _source, function(licenses)
			TriggerClientEvent('tac_dmv:successschool:loadLicenses', _source, licenses)
		end)
	end)
end)

RegisterNetEvent('tac_dmv:successschool:pay')
AddEventHandler('tac_dmv:successschool:pay', function(price)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeMoney(price)
	TriggerClientEvent('tac:showNotification', _source, _U('you_paid', ESX.Math.GroupDigits(price)))
end)
