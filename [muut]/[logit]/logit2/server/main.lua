TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)

--Send the message to your discord server
function sendToDiscord (name,message,color)
  local DiscordWebHook = Config.webhook
  -- Modify here your discordWebHook username = name, content = message,embeds = embeds

	local embeds = {
		{
			["title"]=message,
			["type"]="rich",
			["color"] =color,
			["footer"]=  {
            ["text"]= os.date("%d.%m.%y Aika: %X"),
		},
		}
	}

  if message == nil or message == '' then return FALSE end
  PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

function sendToDiscord1 (name,message,color)
  local DiscordWebHook = Config.webhook1
  -- Modify here your discordWebHook username = name, content = message,embeds = embeds

	local embeds = {
		{
			["title"]=message,
			["type"]="rich",
			["color"] =color,
			["footer"]=  {
            ["text"]= "Uusi Tapahtuma (Itemi / Aseet)",
		},
		}
	}

  if message == nil or message == '' then return FALSE end
  PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

function sendToDiscord2 (name,message,color)
  local DiscordWebHook = Config.webhook2
  -- Modify here your discordWebHook username = name, content = message,embeds = embeds

	local embeds = {
		{
			["title"]=message,
			["type"]="rich",
			["color"] =color,
			["footer"]=  {
            ["text"]= "Uusi Tapahtuma (Laskut / Rahat)",
		},
		}
	}

  if message == nil or message == '' then return FALSE end
  PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

function sendToDiscord3 (name,message,color)
  local DiscordWebHook = Config.webhook3
  -- Modify here your discordWebHook username = name, content = message,embeds = embeds

	local embeds = {
		{
			["title"]=message,
			["type"]="rich",
			["color"] =color,
			["footer"]=  {
            ["text"]= "Uusi Tapahtuma (Kaappi / Kontti)",
		},
		}
	}

  if message == nil or message == '' then return FALSE end
  PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

function sendToDiscord4 (name,message,color)
  local DiscordWebHook = Config.webhook4
  -- Modify here your discordWebHook username = name, content = message,embeds = embeds

	local embeds = {
		{
			["title"]=message,
			["type"]="rich",
			["color"] =color,
			["footer"]=  {
            ["text"]= "Uusi Tapahtuma (Tuunaus)",
		},
		}
	}

  if message == nil or message == '' then return FALSE end
  PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

function sendToDiscord5 (name,message,color)
  local DiscordWebHook = Config.webhook5
  -- Modify here your discordWebHook username = name, content = message,embeds = embeds

	local embeds = {
		{
			["title"]=message,
			["type"]="rich",
			["color"] =color,
			["footer"]=  {
            ["text"]= "Uusi Tapahtuma (Kuolema)",
		},
		}
	}

  if message == nil or message == '' then return FALSE end
  PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

function sendToDiscord6 (name,message,color)
	local DiscordWebHook = Config.webhook6
	-- Modify here your discordWebHook username = name, content = message,embeds = embeds
  
	  local embeds = {
		  {
			  ["title"]=message,
			  ["type"]="rich",
			  ["color"] =color,
			  ["footer"]=  {
			  ["text"]= "Uusi Tapahtuma (Asunto kaappi)",
		  },
		  }
	  }
  
	if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

function sendToDiscord7 (name,message,color)
	local DiscordWebHook = Config.webhook7
	-- Modify here your discordWebHook username = name, content = message,embeds = embeds
  
	  local embeds = {
		  {
			  ["title"]=message,
			  ["type"]="rich",
			  ["color"] =color,
			  ["footer"]=  {
			  ["text"]= "Uusi Tapahtuma (Chat)",
		  },
		  }
	  }
  
	if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

function sendToDiscord8 (name,message,color)
	local DiscordWebHook = Config.webhook8
	-- Modify here your discordWebHook username = name, content = message,embeds = embeds
  
	  local embeds = {
		  {
			  ["title"]=message,
			  ["type"]="rich",
			  ["color"] =color,
			  ["footer"]=  {
			  ["text"]= "Uusi Tapahtuma (Anticheat)",
		  },
		  }
	  }
  
	if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

function sendToDiscord9 (name,message,color)
	local DiscordWebHook = Config.webhook9
	-- Modify here your discordWebHook username = name, content = message,embeds = embeds
  
	  local embeds = {
		  {
			  ["title"]=message,
			  ["type"]="rich",
			  ["color"] =color,
			  ["footer"]=  {
			  ["text"]= "[Kaappi]",
		  },
		  }
	  }
  
	if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
  end

  function sendToDiscord10 (name,message,color)
	local DiscordWebHook = Config.webhook10
	-- Modify here your discordWebHook username = name, content = message,embeds = embeds
  
	  local embeds = {
		  {
			  ["title"]=message,
			  ["type"]="rich",
			  ["color"] =color,
			  ["footer"]=  {
			  ["text"]= "[TRUNK]",
		  },
		  }
	  }
  
	if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
  end

  function sendToDiscord11 (name,message,color)
	local DiscordWebHook = Config.webhook11
	-- Modify here your discordWebHook username = name, content = message,embeds = embeds
  
	  local embeds = {
		  {
			  ["title"]=message,
			  ["type"]="rich",
			  ["color"] =color,
			  ["footer"]=  {
			  ["text"]= "[ASEKAUPAN OSTO]",
		  },
		  }
	  }
  
	if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
  end

  function sendToDiscord12 (name,message,color)
	local DiscordWebHook = Config.webhook12
	-- Modify here your discordWebHook username = name, content = message,embeds = embeds
  
	  local embeds = {
		  {
			  ["title"]=message,
			  ["type"]="rich",
			  ["color"] =color,
			  ["footer"]=  {
			  ["text"]= "[Amarillot]",
		  },
		  }
	  }
  
	if message == nil or message == '' then return FALSE end
	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
  end

-- Serverin chat
AddEventHandler('chatMessage', function(author, color, message)
	if(settings.LogChatServer)then
		local player = ESX.GetPlayerFromId(author)
	   sendToDiscord7(_U('server_chat'), player.name .." : "..message,Config.grey)
	end
end)

-- Itemi logit
RegisterServerEvent("tac:giveitemalert")
AddEventHandler("tac:giveitemalert", function(name,nametarget,itemname,amount)
   if(settings.LogItemTransfer)then
    sendToDiscord1(_U('server_item_transfer'),name.." ".._('user_gives_to').." "..nametarget.." "..amount .." "..itemname,Config.orange)
   end

end)

-- Raha logit
RegisterServerEvent("tac:givemoneyalert")
AddEventHandler("tac:givemoneyalert", function(name,nametarget,amount)
  if(settings.LogMoneyTransfer)then
    sendToDiscord5(_U('server_money_transfer'),name.." ".._('user_gives_to').." "..nametarget.." "..amount .." euroa",Config.orange)
  end

end)

RegisterServerEvent("discord:confiscate")
AddEventHandler("discord:confiscate", function(data)
	msg1 = data.msg1
	msg2 = data.msg2
	msg3 = data.msg3
	msg4 = data.msg4
	msg5 = data.msg5
	msg6 = data.msg6
	msg7 = data.msg7
	sendToDiscord1(msg1, msg2.. " ".. msg3 .." ".. msg4 .. " " ..msg5 .." ".. msg6 .." ".. msg7,Config.red)
end)

-- Raha (Pankki) logit
RegisterServerEvent("tac:givemoneybank:transferalert")
AddEventHandler("tac:givemoneybank:transferalert", function(name,nametarget,amount)
  if(settings.LogMoneybank:transferTransfert)then
   sendToDiscord5(_U('server_moneybank:transfer_transfer'),name.." ".. _('user_gives_to') .." "..nametarget.." "..amount .." euroa",Config.orange)
  end

end)

-- Ase logit
RegisterServerEvent("tac:giveweaponalert")
AddEventHandler("tac:giveweaponalert", function(name,nametarget,weaponlabel)
  if(settings.LogWeaponTransfer)then
    sendToDiscord1(_U('server_weapon_transfer'),name.." ".._('user_gives_to').." "..nametarget.." "..weaponlabel,Config.purple)
  end

end)

-- Kontti ase laitto
RegisterServerEvent("tac_vehicletrunk:giveWeapon")
AddEventHandler("tac_vehicletrunk:giveWeapon", function(weapon,ammo)
  sendToDiscord10('Takakontti ASE LAITTO',weapon.." "..ammo.." laitettiin takakonttiin henkilön:   | Kello: "..os.date("%X"),Config.green)
end)

-- Kontti ase otto
RegisterServerEvent("tac_vehicletrunk:removeWeapon")
AddEventHandler("tac_vehicletrunk:removeWeapon", function(weapon)
  sendToDiscord10('Takakontti ASE POISTO',weapon.." otettiin takakontista henkilön: | "..os.date("%X"),Config.red)
end)

-- Kontti item otto
RegisterServerEvent("tac_vehicletrunk:removeItem")
AddEventHandler("tac_vehicletrunk:removeItem", function(item,count)
  sendToDiscord10('Takakontti ITEM OTTO',item.." "..count.." otettiin takakontista henkilön:   | Kello: "..os.date("%X"),Config.green)
end)

-- Kontti item laitto
RegisterServerEvent("tac_vehicletrunk:giveItem")
AddEventHandler("tac_vehicletrunk:giveItem", function(item,count)
  sendToDiscord10('Takakontti ITEM LAITTO',item.." "..count.." laitettiin takakonttiin henkilön:  | "..os.date("%X"),Config.red)
end)

-- Asekauppa
RegisterServerEvent("tac_weaponshop:buyWeapon")
AddEventHandler("tac_weaponshop:buyWeapon", function(source, cb, weaponName, zone)
  sendToDiscord11('ASEKAUPPA OSTO!',source.." "..cb.." "..weaponName.." "..zone.." | "..os.date("%X"),Config.red)
end)

-- Rillot
RegisterServerEvent("tac_amarillo:putStockItems")
AddEventHandler("tac_amarillo:putStockItems", function(itemName,name,count)
  sendToDiscord12('Amarillo!',itemName.." "..name.." Tavara otetttiin kaapista määrällä "..count.." kello: "..os.date("%X"),Config.green)
end)

-- Rillot
RegisterServerEvent("tac_amarillo:getStockItem")
AddEventHandler("tac_amarillo:getStockItem", function(itemName,name,count)
  sendToDiscord12('Amarillo!',itemName.." "..name.." Tavara laitettiin kaappiin määrällä "..count.." kello: "..os.date("%X"),Config.red)
end)

-- Rillot
RegisterServerEvent("tac_amarillo:giveWeapon")
AddEventHandler("tac_amarillo:giveWeapon", function(weapon, ammo)
  sendToDiscord12('Amarillo!',weapon.." "..ammo.."  laitettiin kaappiin kello: "..os.date("%X"),Config.green)
end)

-- Rillot
RegisterServerEvent("tac_amarillo:addArmoryWeapon")
AddEventHandler("tac_amarillo:addArmoryWeapon", function(weaponName)
  sendToDiscord12('Amarillo!',weaponName.." Ase laitettiin kaappiin kello: "..os.date("%X"),Config.green)
end)

-- Rillot
RegisterServerEvent("tac_amarillo:removeArmoryWeapon")
AddEventHandler("tac_amarillo:removeArmoryWeapon", function(weaponName)
  sendToDiscord12('Amarillo!',weaponName.." Ase otettiin kaappista kello: "..os.date("%X"),Config.red)
end)

-- Varasto (Laitto)
RegisterServerEvent("tac:kaappilaitto")
AddEventHandler("tac:kaappilaitto", function(name,job,weaponName)
  sendToDiscord3('Uusi Tapahtuma (Kaappi laitto)',name.." | laittoi kaappiin | "..job.." | "..weaponName.." | Kello: "..os.date("%X"),Config.green)
end)

-- Varasto (Otto)
RegisterServerEvent("tac:kaappiotto")
AddEventHandler("tac:kaappiotto", function(name,job,weaponName)
  sendToDiscord3('Uusi Tapahtuma (Kaappi otto)',name.." | otti kaapista | "..job.." | "..weaponName.." | Kello: "..os.date("%X"),Config.red)
end)



-- Asunto kaappi laitto
RegisterServerEvent("tac_property:putItem")
AddEventHandler("tac_property:putItem", function(xPlayer,xPlayerOwner,item)
  sendToDiscord9('Laittoi kaappiin!)',"Pelaaja: " ..xPlayer.. " laittoi tavaran: " ..xPlayerOwner.. " kaappiin tavaran: " ..item.. " | Kello: "..os.date("%X"),Config.green)
end)

-- Asunto kaappi otto
RegisterServerEvent("tac_property:getItem")
AddEventHandler("tac_property:getItem", function(xPlayer,xPlayerOwner,weaponName)
  sendToDiscord9('Otti kaapista!)',"Pelaaja: " ..xPlayer.. " otti tavaran: " ..xPlayerOwner.. " kaapista tavaran: " ..weaponName.. " | Kello: "..os.date("%X"),Config.red)
end)

-- Event when a player is in a blacklisted vehicle
RegisterServerEvent("tac:enterblacklistedcar")
AddEventHandler("tac:enterblacklistedcar", function(model)
   local xPlayer = ESX.GetPlayerFromId(source)
   sendToDiscord(_U('server_blacklistedvehicle'),xPlayer.name.." ".._('user_entered_in').." ".. model ,Config.red)

end)

-- Event when a player (not policeman) is in a police vehicle
RegisterServerEvent("tac:enterpolicecar")
AddEventHandler("tac:enterpolicecar", function(model)
 	 local xPlayer = ESX.GetPlayerFromId(source)
 	 sendToDiscord(_U('server_policecar'),xPlayer.name.." ".._('user_entered_in').." ".. model , Config.blue)
end)

RegisterServerEvent("discord:autokauppa")
AddEventHandler("discord:autokauppa", function(data)
	msg1 = data.msg1
	msg2 = data.msg2
	msg3 = data.msg3
	sendToDiscord4(msg1, GetPlayerName(source) .." myi ajoneuvon: " ..msg2 .. " hintaan " .. msg3,Config.purple)
end)

RegisterServerEvent("discord:import")
AddEventHandler("discord:import", function(data)
	msg1 = data.msg1
	msg2 = data.msg2
	msg3 = data.msg3
	msg4 = data.msg4
	sendToDiscord8(msg1, GetPlayerName(source) .." sai paljon rahaa: " ..msg2 .. " vanha " .. msg3 .. " uusi: " .. msg4,Config.red)
end)

RegisterServerEvent("discord:bill")
AddEventHandler("discord:bill", function(data)
	msg1 = data.msg1
	msg2 = data.msg2
	msg3 = data.msg3
	msg4 = data.msg4
	msg5 = data.msg5
	msg6 = data.msg6
	msg7 = data.msg7
	msg8 = data.msg8
	sendToDiscord2(msg1, msg2.. msg3 .. msg4 .. msg5 .. msg6 .. msg7 .. msg8,Config.orange)
end)

RegisterServerEvent("discord:billl")
AddEventHandler("discord:billl", function(data)
	msg1 = data.msg1
	msg2 = data.msg2
	msg3 = data.msg3
	msg4 = data.msg4
	msg5 = data.msg5
	msg6 = data.msg6
	msg7 = data.msg7
	msg8 = data.msg8
	msg9 = data.msg9
	msg10 = data.msg10
	sendToDiscord2(msg1, msg2.. msg3 .. msg4 .. msg5 .. msg6 .. msg7 .. msg8 .. msg9 .. msg10,Config.orange)
end)

RegisterServerEvent("discord:lscustom")
AddEventHandler("discord:lscustom", function(data)
    msg1 = data.msg1
    msg2 = data.msg2
    msg3 = data.msg3
    msg4 = data.msg4
    msg5 = data.msg5
    msg6 = data.msg6
    msg7 = data.msg7
    sendToDiscord4(msg1, msg2.. " ".. msg3 .." ".. msg4 .. " " ..msg5 .." ".. msg6 .." ".. msg7,Config.orange)
end)

RegisterServerEvent("discord:autopaja")
AddEventHandler("discord:autopaja", function(data)
    msg1 = data.msg1
    msg2 = data.msg2
    msg3 = data.msg3
    msg4 = data.msg4
    msg5 = data.msg5
    msg6 = data.msg6
    msg7 = data.msg7
    sendToDiscord4(msg1, msg2.. " ".. msg3 .." ".. msg4 .. " " ..msg5 .." ".. msg6 .." ".. msg7,Config.blue)
end)
