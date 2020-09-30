
ESX                       = nil
local PhoneNumbers        = {}

-- PhoneNumbers = {
--   police = {
--     type  = "police",
--     sources = {
--        ['3'] = true
--     }
--   }
-- }

TriggerEvent('tac:getSharedObject', function(obj)
  ESX = obj
end)


function notifyAlertSMS (number, alert, listSrc)
  if PhoneNumbers[number] ~= nil then
    for k, _ in pairs(listSrc) do
      getPhoneNumber(tonumber(k), function (n)
        if n ~= nil then
          TriggerEvent('gcPhone:sendMessage:_internalAddMessage', number, n, '#' .. alert.numero  .. ' : ' .. alert.message, 0, function (smsMess)
            TriggerClientEvent("gcPhone:sendMessage:receiveMessage", tonumber(k), smsMess)
          end)
          if alert.coords ~= nil then
            TriggerEvent('gcPhone:sendMessage:_internalAddMessage', number, n, 'GPS: ' .. alert.coords.x .. ', ' .. alert.coords.y, 0, function (smsMess)
              TriggerClientEvent("gcPhone:sendMessage:receiveMessage", tonumber(k), smsMess)
            end)
          end
        end
      end)
    end
  end
end



AddEventHandler('tac_phone:registerNumber', function(number, type, sharePos, hasDispatch, hideNumber, hidePosIfAnon)
  print('==== Enregistrement du telephone ' .. number .. ' => ' .. type)
	local hideNumber    = hideNumber    or false
	local hidePosIfAnon = hidePosIfAnon or false

	PhoneNumbers[number] = {
		type          = type,
    sources       = {},
    alerts        = {}
	}
end)


AddEventHandler('tac:setJob', function(source, job, lastJob)
  if PhoneNumbers[lastJob.name] ~= nil then
    TriggerEvent('tac_addons_gcPhone:sendMessage:removeSource', lastJob.name, source)
  end

  if PhoneNumbers[job.name] ~= nil then
    TriggerEvent('tac_addons_gcPhone:sendMessage:addSource', job.name, source)
  end
end)

AddEventHandler('tac_addons_gcPhone:sendMessage:addSource', function(number, source)
	PhoneNumbers[number].sources[tostring(source)] = true
end)

AddEventHandler('tac_addons_gcPhone:sendMessage:removeSource', function(number, source)
	PhoneNumbers[number].sources[tostring(source)] = nil
end)


RegisterServerEvent('tac_addons_gcPhone:sendMessage:startCall')
AddEventHandler('tac_addons_gcPhone:sendMessage:startCall', function (number, message, coords)
  local source = source

  if PhoneNumbers[number] ~= nil then
  if number == 'taxi:pay' then
    if message == 'cancel' then
      TriggerClientEvent('tac_aitaxi:pay:canceltaxi:pay', source, true)
    else
      TriggerClientEvent('tac_aitaxi:pay:calltaxi:pay', source, coords)
    end
  else
    getPhoneNumber(source, function (phone) 
      notifyAlertSMS(number, {
      message = message,
      coords = coords,
      numero = phone,
      }, PhoneNumbers[number].sources)
    end)
  end
  else
    print('Appels sur un service non enregistre => numero : ' .. number)
  end
end)


AddEventHandler('tac:playerLoaded', function(source)

  local xPlayer = ESX.GetPlayerFromId(source)

  MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',{
    ['@identifier'] = xPlayer.identifier
  }, function(result)

    local phoneNumber = result[1].phone_number
    xPlayer.set('phoneNumber', phoneNumber)

    if PhoneNumbers[xPlayer.job.name] ~= nil then
      TriggerEvent('tac_addons_gcPhone:sendMessage:addSource', xPlayer.job.name, source)
    end
  end)

end)


AddEventHandler('tac:playerDropped', function(source)
  local source = source
  local xPlayer = ESX.GetPlayerFromId(source)
  if PhoneNumbers[xPlayer.job.name] ~= nil then
    TriggerEvent('tac_addons_gcPhone:sendMessage:removeSource', xPlayer.job.name, source)
  end
end)


function getPhoneNumber (source, callback) 
  print('get phone to ' .. source)
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer == nil then
    print('esx_addons_gcPhone:sendMessage. source null ???')
    callback(nil)
  end
  MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',{
    ['@identifier'] = xPlayer.identifier
  }, function(result)
    callback(result[1].phone_number)
  end)
end