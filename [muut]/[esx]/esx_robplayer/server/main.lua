ESX 				= nil
local Users         = {}

TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('tac_robplayer:getValue', function(source, cb, targetSID)
    if Users[targetSID] then
        cb(Users[targetSID])
    else
        cb({value = false, time = 0})
    end
end)

ESX.RegisterServerCallback('tac_robplayer:getOtherPlayerData', function(source, cb, target)

  local _target = target
  local xPlayer = ESX.GetPlayerFromId(_target)

    local data = {
		name        = GetPlayerName(target),
		inventory   = xPlayer.inventory,
		accounts    = xPlayer.accounts,
		money       = xPlayer.get('money'),
		weapons 	= xPlayer.getLoadout()

    }

      cb(data)

end)


RegisterServerEvent('tac_robplayer:stealPlayerItem')
AddEventHandler('tac_robplayer:stealPlayerItem', function(target, itemType, itemName, amount)

    local _source = source
    local _target = target
    local sourceXPlayer = ESX.GetPlayerFromId(_source)
    local targetXPlayer = ESX.GetPlayerFromId(_target)

    if itemType == 'item_standard' then

        local label = sourceXPlayer.getInventoryItem(itemName).label
        local itemLimit = sourceXPlayer.getInventoryItem(itemName).limit
        local sourceItemCount = sourceXPlayer.getInventoryItem(itemName).count
        local targetItemCount = targetXPlayer.getInventoryItem(itemName).count

        if amount > 0 and targetItemCount >= amount then
    
            if itemLimit ~= -1 and (sourceItemCount + amount) > itemLimit then
                TriggerClientEvent('tac:showNotification', targetXPlayer.source, _U('ex_inv_lim_target'))
                TriggerClientEvent('tac:showNotification', sourceXPlayer.source, _U('ex_inv_lim_source'))
            else
				local data = {
					msg1 = 'Uusi Tapahtuma (Ryöstö)',
					msg2 = sourceXPlayer.name,
					msg3 = " Varasti henkilöltä: ",
					msg4 = targetXPlayer.name,
					msg5 = " tavaran ",
					msg6 = itemName,
					msg7 = amount
				}

				TriggerEvent('discord:confiscate', data)
                targetXPlayer.removeInventoryItem(itemName, amount)
                sourceXPlayer.addInventoryItem(itemName, amount)

                TriggerClientEvent('tac:showNotification', sourceXPlayer.source, _U('you_stole') .. ' ~g~x' .. amount .. ' ' .. label .. ' ~w~' .. _U('from_your_target') )
                TriggerClientEvent('tac:showNotification', targetXPlayer.source, _U('someone_stole') .. ' ~r~x'  .. amount .. ' ' .. label )

            end

        else
             TriggerClientEvent('tac:showNotification', _source, _U('invalid_quantity'))
        end
	elseif itemType == 'weapons' then
		if amount == nil then amount = 0 end
		targetXPlayer.removeWeapon(itemName, amount)
		sourceXPlayer.addWeapon(itemName, amount)
		local data = {
			msg1 = 'Uusi Tapahtuma (Ryöstö)',
			msg2 = sourceXPlayer.name,
			msg3 = " Varasti henkilöltä: ",
			msg4 = targetXPlayer.name,
			msg5 = " aseen ",
			msg6 = itemName,
			msg7 = amount
		}

		TriggerEvent('discord:confiscate', data)
		TriggerClientEvent('tac:showNotification', sourceXPlayer.source, _U('you_stole_weapon') .. ' ~g~' .. ESX.GetWeaponLabel(itemName) .. ' ~w~' )
		TriggerClientEvent('tac:showNotification', targetXPlayer.source, _U('someone_stole_weapon') .. ' ~r~'  .. ESX.GetWeaponLabel(itemName) .. ' ~w~' )

  elseif itemType == 'item_money' then

    if amount > 0 and targetXPlayer.get('money') >= amount then

      targetXPlayer.removeMoney(amount)
      sourceXPlayer.addMoney(amount)
		local data = {
			msg1 = 'Uusi Tapahtuma (Ryöstö)',
			msg2 = sourceXPlayer.name,
			msg3 = " Varasti henkilöltä: ",
			msg4 = targetXPlayer.name,
			msg5 = " käteistä ",
			msg6 = " ",
			msg7 = amount
		}

		TriggerEvent('discord:confiscate', data)
      TriggerClientEvent('tac:showNotification', sourceXPlayer.source, _U('you_stole') .. ' ~g~€' .. amount .. ' ~w~' .. _U('from_your_target') )
      TriggerClientEvent('tac:showNotification', targetXPlayer.source, _U('someone_stole') .. ' ~r~€'  .. amount )

    else
      TriggerClientEvent('tac:showNotification', _source, _U('imp_invalid_amount'))
    end


  elseif itemType == 'item_account' then

    if amount > 0 and targetXPlayer.getAccount(itemName).money >= amount then

        targetXPlayer.removeAccountMoney(itemName, amount)
        sourceXPlayer.addAccountMoney(itemName, amount)
		local data = {
			msg1 = 'Uusi Tapahtuma (Ryöstö)',
			msg2 = sourceXPlayer.name,
			msg3 = " Varasti henkilöltä: ",
			msg4 = targetXPlayer.name,
			msg5 = " likaista rahaa ",
			msg6 = itemName .. " ",
			msg7 = amount
		}

		TriggerEvent('discord:confiscate', data)
        TriggerClientEvent('tac:showNotification', sourceXPlayer.source, _U('you_stole') .. ' ~g~$' .. amount .. ' ~w~' .. _U('of_black_money') .. ' ' .. _U('from_your_target') )
        TriggerClientEvent('tac:showNotification', targetXPlayer.source, _U('someone_stole') .. ' ~r~$'  .. amount .. ' ~w~' .. _U('of_black_money') )

    else
        TriggerClientEvent('tac:showNotification', _source, _U('imp_invalid_amount'))
    end

  end

end)

RegisterServerEvent("tac_robplayer:update")
AddEventHandler("tac_robplayer:update", function(bool)
	local _source = source
	Users[_source] = {value = bool, time = os.time()}
end)

RegisterServerEvent("tac_robplayer:getValue")
AddEventHandler("tac_robplayer:getValue", function(targetSID)
    local _source = source
	if Users[targetSID] then
		TriggerClientEvent("tac_robplayer:returnValue", _source, Users[targetSID])
	else
		TriggerClientEvent("tac_robplayer:returnValue", _source, Users[targetSID])
	end
end)