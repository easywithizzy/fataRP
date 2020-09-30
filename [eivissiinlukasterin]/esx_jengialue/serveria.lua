ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)
local sellane={}

MySQL.ready(function()
	MySQL.Async.fetchAll("SELECT * FROM `alueet`",
	{},
	function(result)
	
		sellane = {
		{omistaja = result[1]['omistaja']},
		{omistaja = result[2]['omistaja']},
		{omistaja = result[3]['omistaja']},
		{omistaja = result[4]['omistaja']},
		{omistaja = result[5]['omistaja']},
		{omistaja = result[6]['omistaja']},
		{omistaja = result[7]['omistaja']},
		{omistaja = result[8]['omistaja']}
		}
	end)
end)

Citizen.CreateThread(function()
  while true do
	MySQL.Async.fetchAll("SELECT * FROM `alueet`",
	{},
	function(result)	
		for i=1, #result do
			local rahattiskiin = result[i].rahamaara + Config.Tikkipalkansuuruus
			MySQL.Async.execute("UPDATE alueet SET `rahamaara` = @rahoja WHERE alue = @numero",{["@numero"] = i,["@rahoja"] = rahattiskiin})
		end			
	end)
	Citizen.Wait(Config.Tikkipalkkansaanninaika * 60000)
  end
end)

RegisterServerEvent('tac_jengialueet:toofar')
AddEventHandler('tac_jengialueet:toofar', function(alue)
	TriggerClientEvent('tac_jengialueet:toofarlocal', source)
	local xPlayers = ESX.GetPlayers()
	if sellane[alue].omistaja ~= "" then
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if sellane[alue].omistaja == xPlayer.job.name then
				TriggerClientEvent('tac_jengialueet:killblip', xPlayers[i], alue)
			end
		end
	end
end)

RegisterServerEvent('tac_jengialueet:rostoohi')
AddEventHandler('tac_jengialueet:rostoohi', function(tyo)
	TriggerClientEvent('tac_jengialueet:claimcomplete', source)
	local vanhatomistajat = sellane[tyo].omistaja
	local xPlayer = ESX.GetPlayerFromId(source)
	local tyoukko = xPlayer.job.name
	local xPlayers = ESX.GetPlayers()
	for i = 1, #Jobit, 1 do
		if xPlayer.job.name == Jobit[i] then
			MySQL.Async.execute("UPDATE alueet SET `omistaja` = @ukontyo WHERE alue = @tyo",{['@tyo'] = tyo, ['@ukontyo']    = xPlayer.job.name})
			MySQL.Async.fetchAll("SELECT * FROM `alueet`",
			{},
			function(result)
			
				sellane = {
				{omistaja = result[1]['omistaja']},
				{omistaja = result[2]['omistaja']},
				{omistaja = result[3]['omistaja']},
				{omistaja = result[4]['omistaja']},
				{omistaja = result[5]['omistaja']},
				{omistaja = result[6]['omistaja']},
				{omistaja = result[7]['omistaja']},
				{omistaja = result[8]['omistaja']}
				}
			end)
			for i=1, #xPlayers, 1 do
				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
				if tyoukko == xPlayer.job.name then
					TriggerClientEvent('tac_jengialueet:muille', xPlayers[i], tyo)
				end
			end
			if vanhatomistajat ~= "" then
				for i=1, #xPlayers, 1 do
					local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
					if vanhatomistajat == xPlayer.job.name then
						TriggerClientEvent('tac_jengialueet:menetetty', xPlayers[i], alue)
						TriggerClientEvent("tac_jengialueet:valloitusilmoitus", xPlayers[i], alue)				
					end
				end
			end
		end
	end

end)



RegisterServerEvent('tac_jengialueet:fetchmestat')
AddEventHandler('tac_jengialueet:fetchmestat', function()
	TriggerClientEvent('tac_jengialueet:mestat', source, sellane)
end)
RegisterServerEvent('tac_jengialueet:claim')
AddEventHandler('tac_jengialueet:claim', function(k)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	if sellane[k].omistaja == xPlayer.job.name then
		MySQL.Async.fetchAll("SELECT * FROM `alueet`",
		{},
		function(result)
			xPlayer.addAccountMoney('black_money', tonumber(result[k].rahamaara))
			MySQL.Async.execute("UPDATE alueet SET `rahamaara` = @rahoja WHERE alue = @numero",{["@numero"] = k,["@rahoja"] = 0})
		end)
	else
		local xPlayers = ESX.GetPlayers()
		local cops = 0
		local omistajiapaikalla = 0
	
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'police' then
					cops = cops + 1
			end
		end
		if sellane.omistaja ~= "" then
			for i=1, #xPlayers, 1 do
				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
				if sellane[k].omistaja == xPlayer.job.name then
					omistajiapaikalla = omistajiapaikalla + 1
				end
			end
		end
		if cops >= Config.TarvittavatPoliisitAloitukseen then
			if omistajiapaikalla >= Config.TarvittavatOmistajatAloitukseen or sellane[k].omistaja == "" then
				TriggerClientEvent("tac_jengialueet:starttimer", source)
				TriggerClientEvent("tac_jengialueet:currentlyclaiming", source, k)
				if sellane[k].omistaja ~= "" then
					for i=1, #xPlayers, 1 do
						local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
						if sellane[k].omistaja == xPlayer.job.name then
							TriggerClientEvent("tac_jengialueet:valloitusilmoitus", xPlayers[i], k)
							TriggerClientEvent('tac_jengialueet:setblip', xPlayers[i], k)
						end
					end
				end
			else
				TriggerClientEvent('tac:showNotification', source, "Kaupungissa pitää olla vähintää ~y~ "..Config.TarvittavatOmistajatAloitukseen.." alueen omistajaa~s~ paikalla valtauksen aloitukseen.")
			end
		else
			TriggerClientEvent('tac:showNotification', source, "Kaupungissa pitää olla vähintää ~b~"..Config.TarvittavatPoliisitAloitukseen.." poliisia~s~ paikalla valtauksen aloitukseen.")
		end
	end
end)




