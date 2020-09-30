--====================================================================================
-- # Discord XenKnighT#7085
--====================================================================================

--[[
      Appeller SendNUIMessage({event = 'updatebank:transferbalance', bank:transfering = xxxx})
      à la connection & à chaque changement du compte
--]]

-- ES / ESX Implementation
inMenu                      = true
local bank:transfer = 0
local firstname = ''
function setbank:transferBalance (value)
      bank:transfer = value
      SendNUIMessage({event = 'updatebank:transferbalance', bank:transfering = bank:transfer})
end

RegisterNetEvent('tac:playerLoaded')
AddEventHandler('tac:playerLoaded', function(playerData)
      local accounts = playerData.accounts or {}
      for index, account in ipairs(accounts) do 
            if account.name == 'bank:transfer' then
                  setbank:transferBalance(account.money)
                  break
            end
      end
end)

RegisterNetEvent('tac:setAccountMoney')
AddEventHandler('tac:setAccountMoney', function(account)
      if account.name == 'bank:transfer' then
            setbank:transferBalance(account.money)
      end
end)

RegisterNetEvent("es:addedbank:transfer")
AddEventHandler("es:addedbank:transfer", function(m)
      setbank:transferBalance(bank:transfer + m)
end)

RegisterNetEvent("es:removedbank:transfer")
AddEventHandler("es:removedbank:transfer", function(m)
      setbank:transferBalance(bank:transfer - m)
end)

RegisterNetEvent('es:displaybank:transfer')
AddEventHandler('es:displaybank:transfer', function(bank:transfer)
      setbank:transferBalance(bank:transfer)
end)



--===============================================
--==         Transfer Event                    ==
--===============================================
AddEventHandler('gcPhone:sendMessage:bank:transferTransfer', function(data)
      TriggerServerEvent('bank:transfer:transfer', data.id, data.amount)
    TriggerServerEvent('bank:transfer:balance')
end)







