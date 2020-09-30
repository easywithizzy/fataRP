
RegisterNUICallback('reddit_postChanell', function(data, cb)
  TriggerServerEvent('gcPhone:sendMessage:reddit_postChanell', data.redgkit)
end)


RegisterNetEvent("gcPhone:sendMessage:reddit_getChanells")
AddEventHandler("gcPhone:sendMessage:reddit_getChanells", function(channnels)
  SendNUIMessage({event = 'reddit_chanells', channnels = channnels})
end)

RegisterNUICallback('reddit_getChanells', function(data, cb)
  TriggerServerEvent('gcPhone:sendMessage:reddit_getChanells', data.redgkit)
end)

RegisterNetEvent("gcPhone:sendMessage:reddit_receive")
AddEventHandler("gcPhone:sendMessage:reddit_receive", function(reditsage)
  SendNUIMessage({event = 'reddit_receive', reditsage = reditsage})
end)

RegisterNetEvent("gcPhone:sendMessage:reddit_channel")
AddEventHandler("gcPhone:sendMessage:reddit_channel", function(redgkit, reditsages)
  SendNUIMessage({event = 'reddit_channel', reditsages = reditsages})
end)

RegisterNUICallback('reddit_addMessage', function(data, cb)
  TriggerServerEvent('gcPhone:sendMessage:reddit_addMessage', data.redgkit, data.reditsage)
end)

RegisterNUICallback('reddit_getChannel', function(data, cb)
  TriggerServerEvent('gcPhone:sendMessage:reddit_channel', data.redgkit)
end)
