ESX 				= nil
local defaultsecs   = 300
local maxsecs 		= 1000

-----------------------------

--ESX base
TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)

local xPlayers 		= ESX.GetPlayers()

AddEventHandler('chatMessage', function(source, n, message)
	cm = stringsplit(message, " ")
	local xPlayer = ESX.GetPlayerFromId(source)
		
		if cm[1] == "/unputka" then
			if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
				CancelEvent()
				local tPID = tonumber(cm[2])
				if GetPlayerName(tPID) ~= nil then
					print("Vapautetaan ".. GetPlayerName(tPID).. " - vapautuksen antoi ".. GetPlayerName(source))
					TriggerClientEvent("UnJP", tPID)
				end
			else
				TriggerClientEvent('chatMessage', -1, 'SYSTEM', { 0, 0, 0 }, "Sinulla ei ole oikeutta vapauttaa ihmisiä!")
			end
		elseif cm[1] == "/putka1" then
			if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
				CancelEvent()
				local tPID = tonumber(cm[2])
				local jT = defaultsecs
					if cm[3] ~= nil then
						jT = tonumber(cm[3])				
					end
				if jT > maxsecs then
					jT = maxsecs
				end
				if GetPlayerName(tPID) ~= nil then
					print("".. GetPlayerName(tPID).. " tuomittiin ".. jT .." sekunniksi - tuomion antoi ".. GetPlayerName(source))
					TriggerClientEvent("JP1", tPID, jT)
					TriggerClientEvent('chatMessage', -1, 'TUOMARI', { 0, 0, 0 }, GetPlayerName(tPID) ..' tuomittiin '.. jT ..' sekunniksi')
				end
			else
				TriggerClientEvent('chatMessage', -1, 'SYSTEM', { 0, 0, 0 }, "Sinulla ei ole oikeutta laittaa ihmisiä vankilaan!")
			end
		elseif cm[1] == "/putka2" then
			if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
				CancelEvent()
				local tPID = tonumber(cm[2])
				local jT = defaultsecs
					if cm[3] ~= nil then
						jT = tonumber(cm[3])				
					end
				if jT > maxsecs then
					jT = maxsecs
				end
				if GetPlayerName(tPID) ~= nil then
					print("".. GetPlayerName(tPID).. " tuomittiin ".. jT .." sekunniksi - tuomion antoi ".. GetPlayerName(source))
					TriggerClientEvent("JP2", tPID, jT)
					TriggerClientEvent('chatMessage', -1, 'TUOMARI', { 0, 0, 0 }, GetPlayerName(tPID) ..' tuomittiin '.. jT ..' sekunniksi')
				end
			else
				TriggerClientEvent('chatMessage', -1, 'SYSTEM', { 0, 0, 0 }, "Sinulla ei ole oikeutta laittaa ihmisiä vankilaan!")
			end
		elseif cm[1] == "/putka3" then
			if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
				CancelEvent()
				local tPID = tonumber(cm[2])
				local jT = defaultsecs
					if cm[3] ~= nil then
						jT = tonumber(cm[3])				
					end
				if jT > maxsecs then
					jT = maxsecs
				end
				if GetPlayerName(tPID) ~= nil then
					print("".. GetPlayerName(tPID).. " tuomittiin ".. jT .." sekunniksi - tuomion antoi ".. GetPlayerName(source))
					TriggerClientEvent("JP3", tPID, jT)
					TriggerClientEvent('chatMessage', -1, 'TUOMARI', { 0, 0, 0 }, GetPlayerName(tPID) ..' tuomittiin '.. jT ..' sekunniksi')
				end
			else
				TriggerClientEvent('chatMessage', -1, 'SYSTEM', { 0, 0, 0 }, "Sinulla ei ole oikeutta laittaa ihmisiä vankilaan!")
			end
		end
end)


function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end