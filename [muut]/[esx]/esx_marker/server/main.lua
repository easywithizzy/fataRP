ESX               = nil

TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('tac_marker:getUsergroup', function(source, cb)
  local xPlayer = ESX.GetPlayerFromId(source)
  local group = xPlayer.getGroup()
  cb(group)
end)