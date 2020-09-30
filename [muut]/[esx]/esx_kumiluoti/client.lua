ESX                             = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)


local start = false
local inGas = false
local mask = false

RegisterNetEvent('tac_copweapon:mask')
AddEventHandler('tac_copweapon:mask', function()
  print(mask)
  if mask == false then
    SetPedComponentVariation(GetPlayerPed(-1), 1, 38, 0, 2)
    mask = true
  else
    SetPedComponentVariation(GetPlayerPed(-1), 1, 0, 0, 2)
    mask = false
  end
end)

function stunGun()
  local playerPed = GetPlayerPed(-1)
  RequestAnimSet("move_m@drunk@verydrunk")
  while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
    Citizen.Wait(0)
  end
  DoScreenFadeOut(1000)
  SetPedMinGroundTimeForStungun(GetPlayerPed(-1), 1000)
  SetPedMovementClipset(playerPed, "move_m@drunk@verydrunk", true)
  SetTimecycleModifier("spectator9")
  SetPedIsDrunk(playerPed, true)
  Wait(0)
  SetPedMotionBlur(playerPed, true)
  DoScreenFadeIn(1000)
  Wait(0)
  DoScreenFadeOut(1000)
  Wait(0)
  ClearTimecycleModifier()
  ResetScenarioTypesEnabled()
  ResetPedMovementClipset(playerPed, 0)
  SetPedIsDrunk(playerPed, false)
  SetPedMotionBlur(playerPed, false)
  DoScreenFadeIn(1000)
end

function caPique()
  start = true
    SetEntityProofs(GetPlayerPed(-1), false, false, false, false, false, false, false, true)
    if mask == false then
      local playerPed = GetPlayerPed(-1)
      RequestAnimSet("move_p_m_zero_slow")
      while not HasAnimSetLoaded("move_p_m_zero_slow") do
        Citizen.Wait(0)
      end
      SetPedMovementClipset(playerPed, "move_p_m_zero_slow", true)
      SetPedMotionBlur(playerPed, true)
      --SetTimecycleModifier("prologue_ending_fog")
    end
    Citizen.Wait(1000)
    ClearEntityLastDamageEntity(GetPlayerPed(-1))
    SetEntityProofs(GetPlayerPed(-1), false, false, false, false, false, false, false, false)
  start=false
end


Citizen.CreateThread(function()
   while true do
      local playerPed = GetPlayerPed(-1)
   	  ClearPedLastWeaponDamage(playerPed)
      if GetSelectedPedWeapon(playerPed)==GetHashKey("WEAPON_COMBATPISTOL") then
      	SetPedChanceOfFiringBlanks(playerPed, 1, 1)
      end
      if HasPedBeenDamagedByWeapon(GetPlayerPed(-1),GetHashKey("WEAPON_COMBATPISTOL"),0) then        --Miyuki Combatpistol edit wuups
         SetEntityInvincible(playerPed, true)
         local ForwardVector = GetEntityForwardVector(PlayerPedId())
         SetPedToRagdoll(playerPed, 25000, 8000, 0, true, true, false)
         Citizen.Wait(2)
         if start == false then
           caPique()
        end
        inGas = true
      else
        if mask == true then
          inGas = false
        end
        if inGas==true then
          inGas = false
          SetEntityHealth(playerPed, 200)
          SetTimecycleModifier("spectator9")
          Citizen.Wait(26000)
          ResetScenarioTypesEnabled()
          ClearTimecycleModifier()
          ResetPedMovementClipset(playerPed, 0)
          SetPedMotionBlur(playerPed, false)      
        end
      end
      if IsPedBeingStunned(GetPlayerPed(-1)) then
        stunGun()
      end
      SetEntityProofs(GetPlayerPed(-1), false, false, false, false, false, false, false, false)
      ClearEntityLastDamageEntity(GetPlayerPed(-1))
      SetEntityInvincible(playerPed, false)
      Citizen.Wait(0)
   end

end)
