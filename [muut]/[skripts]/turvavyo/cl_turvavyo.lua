local isUiOpen = false
local speedBuffer  = {}
local velBuffer    = {}
local beltOn       = false
local wasInCar     = false
ESX                = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

IsCar = function(veh)
		    local vc = GetVehicleClass(veh)
		    return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
        end	

Fwv = function (entity)
		    local hr = GetEntityHeading(entity) + 90.0
		    if hr < 0.0 then hr = 360.0 + hr end
		    hr = hr * 0.0174533
		    return { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
      end

Citizen.CreateThread(function()
	Citizen.Wait(25)
	while true do
		
		local ped = GetPlayerPed(-1)
		local car = GetVehiclePedIsIn(ped)
		
		if car ~= 0 and ((not wasInCar and IsCar(car)) or wasInCar) then
		
			wasInCar = true
			
            if isUiOpen == false and not IsPlayerDead(PlayerId()) then
                SendNUIMessage({
            	   displayWindow = 'true'
            	   })
                isUiOpen = true 			
            end
			
			if beltOn then DisableControlAction(0, 75) end
			
			speedBuffer[2] = speedBuffer[1]
			speedBuffer[1] = GetEntitySpeed(car)
			
			if speedBuffer[2] ~= nil 
			   and GetEntitySpeedVector(car, true).y > 1.0  
			   and speedBuffer[2] > 15.25
			   and (speedBuffer[2] - speedBuffer[1]) > (speedBuffer[2] * 0.255) 
			   and not beltOn
			   or
			   speedBuffer[2] ~= nil 
			   and GetEntitySpeedVector(car, true).y > 1.0  
			   and speedBuffer[2] > 55.50
			   and (speedBuffer[2] - speedBuffer[1]) > (speedBuffer[2] * 0.255)
			   and (GetPedInVehicleSeat(car, -1) == GetPlayerPed(-1))
			   then
			   
				local co = GetEntityCoords(ped)
				local fw = Fwv(ped)
				SetEntityCoords(ped, co.x + fw.x, co.y + fw.y, co.z - 0.47, true, true, true)
				SetEntityVelocity(ped, velBuffer[2].x, velBuffer[2].y, velBuffer[2].z)
				Citizen.Wait(1)
				SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
				Citizen.Wait(1500)
				ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", 2.0)
				RequestAnimSet("move_m@injured")
				while not HasAnimSetLoaded("move_m@injured") do
					Citizen.Wait(0)
				end
				SetPedMovementClipset(GetPlayerPed(-1), "move_m@injured", true)
				DoScreenFadeOut(250)
				Citizen.Wait(3000)
				DoScreenFadeIn(250)
				Citizen.Wait(1000)
				DoScreenFadeOut(250)
				Citizen.Wait(2000)
				DoScreenFadeIn(250)
				Citizen.Wait(2000)
				DoScreenFadeOut(250)
				Citizen.Wait(1500)
				DoScreenFadeIn(250)
				Citizen.Wait(3000)
				DoScreenFadeOut(250)
				Citizen.Wait(1000)
				ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", 1.0)
				DoScreenFadeIn(250)
				Citizen.Wait(2000)
				StopGameplayCamShaking( true )
			end
							
			velBuffer[2] = velBuffer[1]
			velBuffer[1] = GetEntityVelocity(car)
				
			if IsControlJustReleased(0, 29) and not IsControlPressed(0, 36) and GetLastInputMethod(0) then
				beltOn = not beltOn				  
						if beltOn then 
		  ESX.ShowNotification("Turvavyö: ~g~Lukittu")
		  SendNUIMessage({
		    displayWindow = 'false'
		    })
		  isUiOpen = true 
						else 
		  ESX.ShowNotification("Turvavyö: ~r~Avattu")
		  SendNUIMessage({
		     displayWindow = 'true'
		     })
		  isUiOpen = true  
						end
			end
			
		elseif wasInCar then
			wasInCar = false
			beltOn = false
			speedBuffer[1], speedBuffer[2] = 0.0, 0.0
			if isUiOpen == true and not IsPlayerDead(PlayerId()) then
                SendNUIMessage({
            	   displayWindow = 'false'
            	   })
                isUiOpen = false 
            end
		end
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        if IsPlayerDead(PlayerId()) and isUiOpen == true then
            SendNUIMessage({
                    displayWindow = 'false'
               })
            isUiOpen = false
        end    

    end
end)   