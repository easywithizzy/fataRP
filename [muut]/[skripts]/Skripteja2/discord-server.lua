AddEventHandler('chatMessage', function(source, name, message)
  if message == nil or message == '' or message:sub(1, 1) == '/' then return FALSE end
  PerformHttpRequest('Discord_url', function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
end)
function sendToDiscord(name, message)
  if message == nil or message == '' or message:sub(1, 1) == '/' then return FALSE end
  PerformHttpRequest('Discord_url', function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
end
AddEventHandler('playerConnecting', function()
  sendToDiscord('SYSTEM', GetPlayerName(source) .. 'Joined. ')
end)

AddEventHandler('playerDropped', function(reason)
  sendToDiscord('SYSTEM', GetPlayerName(source) .. ' Left. (' .. reason .. ')')
end)
