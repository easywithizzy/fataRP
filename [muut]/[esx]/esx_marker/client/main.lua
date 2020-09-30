ESX               = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('tac:playerLoaded')
AddEventHandler('tac:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterCommand("mene", function(source)
    tpTillMarker()
end, false)

function tpTillMarker()
  
  ESX.TriggerServerCallback('tac_marker:getUsergroup', function(group)
    playergroup = group
    
    if playergroup == 'admin' or playergroup == 'superadmin' or playergroup == 'mod' then
      local playerPed = GetPlayerPed(-1)
      local WaypointHandle = GetFirstBlipInfoId(8)
      if DoesBlipExist(WaypointHandle) then
        local coord = Citizen.InvokeNative(0xFA7C7F0AADF25D09, WaypointHandle, Citizen.ResultAsVector())
        SetEntityCoordsNoOffset(playerPed, coord.x, coord.y, -199.5, false, false, false, true)
        ESX.ShowNotification('Ja taas mennää!')
      else
        ESX.ShowNotification('Katoppa uusiksi löytyykö markkeri kartassa?')
      end
    end
    
  end)
end