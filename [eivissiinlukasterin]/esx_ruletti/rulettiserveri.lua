ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local tulos22 = math.random(0, 37)
local rahattanne = 0
local voitto = false
RegisterServerEvent('tac_ruletti:lahella')
AddEventHandler('tac_ruletti:lahella', function()
	Citizen.Wait(15000)
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		TriggerClientEvent('tac:ruletti:tulos', xPlayers[i], tulos22)
		local identifier = GetPlayerIdentifiers(xPlayers[i])[1]
		MySQL.Async.fetchAll('SELECT * FROM ruletti WHERE identifier =@identifier', {['@identifier'] = identifier}, function(result)
			if result[1] ~= nil then
				for j=1, #result do	
					rahattanne = 0
					voitto = false
					if tulos22 == 0 and result[j].vari == "V" then
						rahattanne = result[j].maksu*35
						voitto = true
					elseif tulos22 <= 18 and tulos22 ~= 0 and result[j].vari == "P" then
						rahattanne = result[j].maksu*2
						voitto = true
					elseif tulos22 > 18 and result[j].vari == "M" then
						rahattanne = result[j].maksu*2
						voitto = true
					elseif tulos22 == result[j].vari then
						rahattanne = result[j].maksu*35
						voitto = true
					end
					Citizen.Wait(10000)					
					local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
					if voitto  then
						xPlayer.addMoney(rahattanne)
						TriggerClientEvent('tac:showNotification', xPlayers[i], '~g~Voitit ~s~'..rahattanne.."€")
					else						
						TriggerClientEvent('tac:showNotification', xPlayers[i], '~r~Hävisit ~s~'..result[j].maksu.."€")
					end
				end	
				MySQL.Async.execute("DELETE FROM ruletti WHERE identifier=@identifier", {['@identifier'] = identifier})
			end
		end)
	end
end)

RegisterServerEvent('tac_ruletti:osallistuminen')
AddEventHandler('tac_ruletti:osallistuminen', function(osallistumismaksu, vari)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getMoney() + 0.0 >= osallistumismaksu then	
		xPlayer.removeMoney(osallistumismaksu)
		local identifier = GetPlayerIdentifiers(source)[1]
		MySQL.Async.execute('INSERT INTO ruletti (identifier,maksu,vari) VALUES (@identifier ,@maksu,@vari)', {
			['@identifier'] = identifier,
			['@maksu'] = osallistumismaksu,
			['@vari'] = vari,
		})
	else
		TriggerClientEvent('tac:showNotification', source, '~r~Sinulla ei ole tarpeeksi rahaa!')
	end
end)
