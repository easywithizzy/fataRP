local rob = false
local robbers = {}
ESX = nil

TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('tac_holdupweapon:tooFar')
AddEventHandler('tac_holdupweapon:tooFar', function(currentStore)
	local _source = source
	local xPlayers = ESX.GetPlayers()
	rob = false

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		
		if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
			TriggerClientEvent('tac:showNotification', xPlayers[i], _U('robbery_cancelled_at', Stores[currentStore].nameOfStore))
			TriggerClientEvent('tac_holdupweapon:killBlip', xPlayers[i])
		end
	end

	if robbers[_source] then
		TriggerClientEvent('tac_holdupweapon:tooFar', _source)
		robbers[_source] = nil
		TriggerClientEvent('tac:showNotification', _source, _U('robbery_cancelled_at', Stores[currentStore].nameOfStore))
	end
end)

RegisterServerEvent('tac_holdupweapon:robberyStarted')
AddEventHandler('tac_holdupweapon:robberyStarted', function(currentStore)
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	if Stores[currentStore] then
		local store = Stores[currentStore]

		if (os.time() - store.lastRobbed) < Config.TimerBeforeNewRob and store.lastRobbed ~= 0 then
			TriggerClientEvent('tac:showNotification', _source, _U('recently_robbed', Config.TimerBeforeNewRob - (os.time() - store.lastRobbed)))
			return
		end

		local cops = 0
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
				cops = cops + 1
			end
		end

		if not rob then
			if cops >= Config.PoliceNumberRequired then
				rob = true

				for i=1, #xPlayers, 1 do
					local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
					if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
						TriggerClientEvent('tac:showNotification', xPlayers[i], _U('rob_in_prog', store.nameOfStore))
						TriggerClientEvent('tac_holdupweapon:setBlip', xPlayers[i], Stores[currentStore].position)
					end
				end

				TriggerClientEvent('tac:showNotification', _source, _U('started_to_rob', store.nameOfStore))
				TriggerClientEvent('tac:showNotification', _source, _U('alarm_triggered'))
				
				TriggerClientEvent('tac_holdupweapon:currentlyRobbing', _source, currentStore)
				TriggerClientEvent('tac_holdupweapon:startTimer', _source)
				
				Stores[currentStore].lastRobbed = os.time()
				robbers[_source] = currentStore

				SetTimeout(store.secondsRemaining * 1000, function()
					if robbers[_source] then
						rob = false
						if xPlayer then
							TriggerClientEvent('tac_holdupweapon:robberyComplete', _source)
								local number = math.random(1,12)
								local ammo = math.random(1,250)
								
								if number == 1 then
									xPlayer.addWeapon('weapon_switchblade', 1)
								elseif number == 2 then
									xPlayer.addWeapon('weapon_snspistol', ammo)
								elseif number == 3 then
									xPlayer.addWeapon('weapon_flashlight', 1)
								elseif number == 4 then
									xPlayer.addWeapon('weapon_microsmg', ammo)
				elseif number == 5 then
				xPlayer.addWeapon('weapon_snspistol_mk2', ammo)
				elseif number == 6 then
				xPlayer.addWeapon('weapon_vintagepistol', ammo)
				elseif number == 7 then
				xPlayer.addWeapon('weapon_combatpdw', ammo)
				elseif number == 8 then
				xPlayer.addWeapon('weapon_pistol_mk2', ammo)
				elseif number == 9 then
				xPlayer.addWeapon('weapon_pistol', ammo)
				elseif number == 10 then
				xPlayer.addWeapon('weapon_pistol50', ammo)
				elseif number == 11 then
                                    luckyShot = math.random(1,3)
                                if luckyShot == 1 then
                                    xPlayer.addWeapon('weapon_assaultrifle', ammo)
                                elseif luckyShot == 2 then
                                    xPlayer.addWeapon('weapon_specialcarbine', ammo)
                                elseif luckyShot == 3 then
                                    xPlayer.addWeapon('weapon_marksmanpistol', ammo)									
								elseif number == 12 then
                                ESX.ShowNotification('Et löytänyt mitään kaupasta! Pakene!')
								else
								ESX.ShowNotification('Et löytänyt mitään kaupasta! Pakene!')
								end
							
							local xPlayers, xPlayer = ESX.GetPlayers(), nil
							for i=1, #xPlayers, 1 do
								xPlayer = ESX.GetPlayerFromId(xPlayers[i])

								if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
									TriggerClientEvent('tac:showNotification', xPlayers[i], _U('robbery_complete_at', store.nameOfStore))
									TriggerClientEvent('tac_holdupweapon:killBlip', xPlayers[i])
                                                                      end
								end
							end
						end
					end
				end)
			else
			TriggerClientEvent('tac:showNotification', _source, _U('min_police', Config.PoliceNumberRequired))
			end
		else
			TriggerClientEvent('tac:showNotification', _source, _U('robbery_already'))
		end
	end
end)