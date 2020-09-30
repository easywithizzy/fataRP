RegisterNetEvent("gcPhone:sendMessage:tchat_receive")
AddEventHandler("gcPhone:sendMessage:tchat_receive", function(message)
  SendNUIMessage({event = 'tchat_receive', message = message})
end)

RegisterNetEvent("gcPhone:sendMessage:tchat_channel")
AddEventHandler("gcPhone:sendMessage:tchat_channel", function(channel, messages)
  SendNUIMessage({event = 'tchat_channel', messages = messages})
end)

RegisterNUICallback('tchat_addMessage', function(data, cb)
  TriggerServerEvent('gcPhone:sendMessage:tchat_addMessage', data.channel, data.message)
end)

RegisterNUICallback('tchat_getChannel', function(data, cb)
  TriggerServerEvent('gcPhone:sendMessage:tchat_channel', data.channel)
end)
