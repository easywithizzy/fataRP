local rob = false
local robbers = {}
ESX = nil

TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)

function get3DDistance(x1, y1, z1, x2, y2, z2)
	return math.sqrt(math.pow(x1 - x2, 2) + math.pow(y1 - y2, 2) + math.pow(z1 - z2, 2))
end

RegisterServerEvent('tac_holdupbank:transfer:toofar')
AddEventHandler('tac_holdupbank:transfer:toofar', function(robb)
	local source = source
	local xPlayers = ESX.GetPlayers()
	rob = false
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
			TriggerClientEvent('tac:showNotification', xPlayers[i], _U('robbery_cancelled_at') .. bank:transfers[robb].nameofbank:transfer)
			TriggerClientEvent('tac_holdupbank:transfer:killblip', xPlayers[i])
		end
	end
	if(robbers[source])then
		TriggerClientEvent('tac_holdupbank:transfer:toofarlocal', source)
		robbers[source] = nil
		TriggerClientEvent('tac:showNotification', source, _U('robbery_has_cancelled') .. bank:transfers[robb].nameofbank:transfer)
	end
end)

RegisterServerEvent('tac_holdupbank:transfer:rob')
AddEventHandler('tac_holdupbank:transfer:rob', function(robb)

	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local drill = xPlayer.getInventoryItem('drill')
	local xPlayers = ESX.GetPlayers()
	
	if bank:transfers[robb] then

		local bank:transfer = bank:transfers[robb]

		if (os.time() - bank:transfer.lastrobbed) < 83200 and bank:transfer.lastrobbed ~= 0 then

			TriggerClientEvent('tac:showNotification', source, _U('already_robbed') .. (2 - (os.time() - bank:transfer.lastrobbed)) .. _U('seconds'))
			return
		end


		local cops = 0
		for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		 if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
				cops = cops + 1
			end
		end


		if rob == false then
		   
		  if xPlayer.getInventoryItem('drill').count >= 1 then
		     xPlayer.removeInventoryItem('drill', 1)

			if(cops >= Config.NumberOfCopsRequired)then

				rob = true
				for i=1, #xPlayers, 1 do
					local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
					if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
							TriggerClientEvent('tac:showNotification', xPlayers[i], _U('rob_in_prog') .. bank:transfer.nameofbank:transfer)
							TriggerClientEvent('tac_holdupbank:transfer:setblip', xPlayers[i], bank:transfers[robb].position)
					end
				end

				TriggerClientEvent('tac:showNotification', source, _U('started_to_rob') .. bank:transfer.nameofbank:transfer .. _U('do_not_move'))
				TriggerClientEvent('tac:showNotification', source, _U('alarm_triggered'))
				TriggerClientEvent('tac:showNotification', source, _U('hold_pos'))
				TriggerClientEvent('tac_borrmaskin:startDrill', source)
				TriggerClientEvent('tac_holdupbank:transfer:currentlyrobbing', source, robb)
				bank:transfers[robb].lastrobbed = os.time()
				robbers[source] = robb
				local savedSource = source
				SetTimeout(600000, function()

					if(robbers[savedSource])then

						rob = false
						TriggerClientEvent('tac_holdupbank:transfer:robberycomplete', savedSource, job)
						if(xPlayer)then

							xPlayer.addAccountMoney('black_money', bank:transfer.reward)
							local xPlayers = ESX.GetPlayers()
							for i=1, #xPlayers, 1 do
								local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
								if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
										TriggerClientEvent('tac:showNotification', xPlayers[i], _U('robbery_complete_at') .. bank:transfer.nameofbank:transfer)
										TriggerClientEvent('tac_holdupbank:transfer:killblip', xPlayers[i])
								end
							end
						end
					end
				end)
			else
				TriggerClientEvent('tac:showNotification', source, _U('min_two_police') .. Config.NumberOfCopsRequired)
			end
		end
		else
			TriggerClientEvent('tac:showNotification', source, _U('robbery_already'))
		end
	end
end)
