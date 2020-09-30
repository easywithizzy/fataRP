ESX = nil

TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)
local DateSec = os.time(os.date('*t'))
local Date = ''

AddEventHandler('tac:playerLoaded', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	CheckBills(_source)
end)

Citizen.CreateThread(function()
	Wait(5000)
	while true do
		local xPlayers    = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			Wait(1000)
			--print("henkilö "..xPlayers[i])
			CheckBills(xPlayers[i])
		end
		Wait(1800000)
	end
end)

MySQL.ready(function()
	MySQL.Async.fetchAll(
		'SELECT * FROM billing WHERE aika = @aika',
		{
			['@aika'] =  0000000000
		},
		function(result)

			for i=1, #result, 1 do
				MySQL.Async.execute(
					'UPDATE billing SET aika = @aika WHERE id = @id',
					{
						['@aika'] = DateSec,
						['@id']   = result[i].id
					},
					function(rowsChanged)

						print("Laskutus: aikatietoja muutettiin tietokannassa!")

					end
				)
			end
		end
	)
end)


function CheckBills(target)
	local xPlayer = ESX.GetPlayerFromId(target)
	MySQL.Async.fetchAll(
		'SELECT * FROM billing WHERE identifier = @identifier',
		{
			['@identifier'] = xPlayer.identifier
		},
		function(result)
			print("laskuja henkilöllä: ".. xPlayer.name .." yht " .. #result)
			for i=1, #result, 1 do
				--print("Katsotaan lasku numero " .. result[i].id )
				--print("klo nyt: " ..DateSec .. " aikaa vielä " .. (DateSec - result[i].aika - 604800))
				if math.floor(DateSec - result[i].aika - 432000) > 0 then --604800 7pv  432000 5pv  259200 3pv 86400 1pv

					local maksaja     = ESX.GetPlayerFromIdentifier(result[i].identifier)
					local xPlayers    = ESX.GetPlayers()
					local foundPlayer = nil

					for o=1, #xPlayers, 1 do

						local xPlayer2 = ESX.GetPlayerFromId(xPlayers[o])
						
						if xPlayer2.identifier == result[i].sender then
							foundPlayer = xPlayer2
							break
						end
					end
					if result[i].target_type ~= 'player' then
						TriggerEvent('tac_addonaccount:getSharedAccount', result[i].target, function(account)
							MySQL.Async.execute(
								'DELETE from billing WHERE id = @id',
								{
									['@id'] = result[i].id
								},function(rowsChanged)
									local perintakulut = math.floor(result[i].amount * 0.20)
									maksaja.removeAccountMoney('bank:transfer', (result[i].amount))
									maksaja.removeAccountMoney('bank:transfer', perintakulut)
									account.addMoney(result[i].amount)
									account.addMoney(perintakulut/2)
									TriggerClientEvent('tac:showNotification', maksaja.source, "Pankki peri sinulta laskun summalla: ".. result[i].amount .. " + perintäkulut " .. perintakulut) 
									if foundPlayer ~= nil then
										TriggerClientEvent('tac:showNotification', foundPlayer.source, _U('received_payment', result[i].amount).." + perintäkuluista " .. math.floor(perintakulut/2))
									end
								end
							)
						end)
					end
				end
			end
		end
	)
end

RegisterServerEvent('tac_billing:sendBill')
AddEventHandler('tac_billing:sendBill', function(playerId, sharedAccountName, label, amount)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	TriggerEvent('tac_addonaccount:getSharedAccount', sharedAccountName, function(account)
	
		for i=1, #xPlayers, 1 do

			local xPlayer2 = ESX.GetPlayerFromId(xPlayers[i])

			if xPlayer2.source == playerId then
				if amount <= 0  or amount > 2000000 then
					local data = {
						msg1 = 'Uusi Tapahtuma (Virheellinen Lasku)',
						msg2 = xPlayer.name,
						msg3 = " yritti lähettää virheellisen laskun henkilölle ",
						msg4 = xPlayer2.name,
						msg5 = " suuruudelta: ",
						msg6 = amount,
						msg7 = "€ | Tekstinä: ",
						msg8 = label
					}
					TriggerEvent('discord:bill', data)
					print('esx_billing: ' .. GetPlayerName(_source) .. ' yritti lähettää virheellisen laskun! Määrä: '.. amount .. ' tekstinä: ' .. label)
					return
				end
				break
			end
		end
		if account == nil then

			for i=1, #xPlayers, 1 do

				local xPlayer2 = ESX.GetPlayerFromId(xPlayers[i])

				if xPlayer2.source == playerId then

						MySQL.Async.execute(
							'INSERT INTO billing (identifier, sender, target_type, target, label, amount, aika) VALUES (@identifier, @sender, @target_type, @target, @label, @amount, @aika)',
							{
								['@identifier']  = xPlayer2.identifier,
								['@sender']      = xPlayer.identifier,
								['@target_type'] = 'player',
								['@target']      = xPlayer.identifier,
								['@label']       = label,
								['@amount']      = amount,
								['@aika']		 = DateSec
							},
							function(rowsChanged)
								TriggerClientEvent('tac:showNotification', xPlayer2.source, "Sait ~r~laskun ~w~ pelaajalta " .. ESX.GetPlayerFromId(xPlayer.source))
								local data = { --discordiin menevä tieto laskuista
									msg1 = 'Uusi Tapahtuma (Lasku)',
									msg2 = xPlayer2.name,
									msg3 = " sai laskun henkilöltä: ",
									msg4 = xPlayer.name,
									msg5 = " suuruudelta: ",
									msg6 = amount,
									msg7 = "€ | Tekstinä: ",
									msg8 = label
								}
							
								TriggerEvent('discord:bill', data)
							end
						)

					break
				end
			end
		else
			for i=1, #xPlayers, 1 do

				local xPlayer2 = ESX.GetPlayerFromId(xPlayers[i])

				if xPlayer2.source == playerId then

						MySQL.Async.execute(
							'INSERT INTO billing (identifier, sender, target_type, target, label, amount, aika) VALUES (@identifier, @sender, @target_type, @target, @label, @amount, @aika)',
							{
								['@identifier']  = xPlayer2.identifier,
								['@sender']      = xPlayer.identifier,
								['@target_type'] = 'society',
								['@target']      = sharedAccountName,
								['@label']       = label,
								['@amount']      = amount,
								['@aika']		 = DateSec
							},
							function(rowsChanged)
								local data = { --discordiin menevä tieto laskuista
									msg1 = 'Laskutus',
									msg2 = xPlayer2.name,
									msg3 = " sai laskun henkilöltä: ",
									msg4 = xPlayer.name,
									msg5 = " suuruudelta: $",
									msg6 = amount,
									msg7 = " Tekstinä: ",
									msg8 = label,
									msg9 = " firmalle: ",
									msg10 = sharedAccountName
								}

								TriggerEvent('discord:billl', data)
								if xPlayer.source == xPlayer2.source then
									TriggerClientEvent('tac:showNotification', xPlayer2.source, _U('received_invoice'))
								else
									TriggerClientEvent('tac:showNotification', xPlayer2.source, "Sait ~r~laskun ~w~ pelaajalta " .. xPlayer.name)
								end
								
							end
						)

					break
				end
			end
		end
	end)

end)

ESX.RegisterServerCallback('tac_billing:getBills', function(source, cb)

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.fetchAll(
		'SELECT * FROM billing WHERE identifier = @identifier',
		{
			['@identifier'] = xPlayer.identifier
		},
		function(result)

			local bills = {}

			for i=1, #result, 1 do
				local s = dateConvo(result[i].aika)
				table.insert(bills, {
					id         = result[i].id,
					identifier = result[i].identifier,
					sender     = result[i].sender,
					targetType = result[i].target_type,
					target     = result[i].target,
					label      = s .. " ".. result[i].label,
					amount     = result[i].amount,
					aika 		= result[i].aika
				})
			end

			cb(bills)

		end
	)

end)

ESX.RegisterServerCallback('tac_billing:getTargetBills', function(source, cb, target)
	local xPlayer = ESX.GetPlayerFromId(target)

	MySQL.Async.fetchAll(
		'SELECT * FROM billing WHERE identifier = @identifier',
		{
			['@identifier'] = xPlayer.identifier
		},
		function(result)

			local bills = {}

			for i=1, #result, 1 do
				table.insert(bills, {
					id         = result[i].id,
					identifier = result[i].identifier,
					sender     = result[i].sender,
					targetType = result[i].target_type,
					target     = result[i].target,
					label      = result[i].label,
					amount     = result[i].amount,
					aika 		= result[i].aika
				})
			end

			cb(bills)

		end
	)

end)


ESX.RegisterServerCallback('tac_billing:payBill', function(source, cb, id)

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.fetchAll(
		'SELECT * FROM billing WHERE id = @id',
		{
			['@id'] = id
		},
		function(result)

			local sender      = result[1].sender
			local targetType  = result[1].target_type
			local target      = result[1].target
			local amount      = result[1].amount
			local xPlayers    = ESX.GetPlayers()
			local foundPlayer = nil

			for i=1, #xPlayers, 1 do

				local xPlayer2 = ESX.GetPlayerFromId(xPlayers[i])
				
				if xPlayer2.identifier == sender then
					foundPlayer = xPlayer2
					break
				end
			end

			if targetType == 'player' then

				if foundPlayer ~= nil then

					if xPlayer.get('money') >= amount then

						MySQL.Async.execute(
							'DELETE from billing WHERE id = @id',
							{
								['@id'] = id
							},
							function(rowsChanged)

								xPlayer.removeMoney(amount)
								foundPlayer.addMoney(amount)

								TriggerClientEvent('tac:showNotification', xPlayer.source, _U('paid_invoice', amount))
								TriggerClientEvent('tac:showNotification', foundPlayer.source, _U('received_payment', amount))

								cb()

							end
						)

					elseif xPlayer.getbank:transfer() >= amount then

						MySQL.Async.execute(
							'DELETE from billing WHERE id = @id',
							{
								['@id'] = id
							},
							function(rowsChanged)

								xPlayer.removeAccountMoney('bank:transfer', amount)
								foundPlayer.addbank:transfer(amount)

								TriggerClientEvent('tac:showNotification', xPlayer.source, _U('paid_invoice', amount))
								TriggerClientEvent('tac:showNotification', foundPlayer.source, _U('received_payment', amount))

								cb()

							end
						)

					else
						TriggerClientEvent('tac:showNotification', _source, _U('player_not_logged'))
						cb()
					end

				end

			else
				TriggerEvent('tac_addonaccount:getSharedAccount', target, function(account)
					if xPlayer.get('money') >= amount then
						MySQL.Async.execute(
							'DELETE from billing WHERE id = @id',
							{
								['@id'] = id
							},
								function(rowsChanged)
								xPlayer.removeMoney(amount)
								account.addMoney(amount)
								TriggerClientEvent('tac:showNotification', xPlayer.source, _U('paid_invoice', amount))
								if foundPlayer ~= nil then
									TriggerClientEvent('tac:showNotification', foundPlayer.source, _U('received_payment', amount))
								end
							cb()
						end)
					elseif xPlayer.getbank:transfer() >= amount then
						MySQL.Async.execute(
							'DELETE from billing WHERE id = @id',
							{
								['@id'] = id
							},
								function(rowsChanged)
								xPlayer.removeAccountMoney('bank:transfer', amount)
								account.addMoney(amount)
								TriggerClientEvent('tac:showNotification', xPlayer.source, _U('paid_invoice', amount))
								if foundPlayer ~= nil then
									TriggerClientEvent('tac:showNotification', foundPlayer.source, _U('received_payment', amount))
								end
							cb()
						end)
					else
						TriggerClientEvent('tac:showNotification', xPlayer.source, _U('no_money'))
						if foundPlayer ~= nil then
							TriggerClientEvent('tac:showNotification', foundPlayer.source, _U('target_no_money'))
						end
					end
				end)

			end

		end
	)

end)

ESX.RegisterServerCallback('tac_billing:ForcepayBill', function(source, cb, id)

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.fetchAll(
		'SELECT * FROM billing WHERE id = @id',
		{
			['@id'] = id
		},
		function(result)

			local sender      = result[1].sender
			local targetType  = result[1].target_type
			local target      = result[1].target
			local amount      = result[1].amount
			local maksaja     = ESX.GetPlayerFromIdentifier(result[1].identifier)
			local xPlayers    = ESX.GetPlayers()
			local foundPlayer = nil

			for i=1, #xPlayers, 1 do

				local xPlayer2 = ESX.GetPlayerFromId(xPlayers[i])
				
				if xPlayer2.identifier == sender then
					foundPlayer = xPlayer2
					break
				end
			end

			if targetType == 'player' then
				TriggerClientEvent('tac:showNotification', xPlayer.source, "Perintä toimii vain pelaajalta firmalle")
			else
				TriggerEvent('tac_addonaccount:getSharedAccount', target, function(account)
					MySQL.Async.execute(
						'DELETE from billing WHERE id = @id',
						{
							['@id'] = id
						},function(rowsChanged)
							maksaja.removeAccountMoney('bank:transfer', amount)
							account.addMoney(amount)
							if xPlayer.source ~= nil then
								TriggerClientEvent('tac:showNotification', xPlayer.source, "Perit juuri laskun summalla " .. amount)
							end
							TriggerClientEvent('tac:showNotification', maksaja.source, "Sinulta pakko lunastettiin tililtä yhteensä: ".. amount)
							if foundPlayer ~= nil then
								TriggerClientEvent('tac:showNotification', foundPlayer.source, _U('received_payment', amount))
							end
						cb()
					end)
				end)
			end
		end
	)
end)

Citizen.CreateThread(function() 
	while true do
		DateSec = os.time(os.date('*t'))
		
		Date = os.date('%d.%m.-%y %H:%M', DateSec)
		Date = Date:gsub(' 0',' ')
		Wait(1000)
	end
end)

function dateConvo(sec)
	D = os.date('%d.%m.-%y %H:%M', sec)
	D = D:gsub(' 0',' ')
	return(D)
end

RegisterServerEvent('tac_billing:annaarmorit')
AddEventHandler('tac_billing:annaarmorit', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.addInventoryItem('bulletproof', 1)
end)