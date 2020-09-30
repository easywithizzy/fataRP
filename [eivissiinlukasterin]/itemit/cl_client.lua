Citizen.CreateThread(function()
    while true do
        Wait(10)
        local ped = GetPlayerPed(-1)
		if IsPedInAnyVehicle(ped, false) then
			if IsControlPressed(2,75) then
				local veh = GetVehiclePedIsIn(ped, false)
				if GetIsVehicleEngineRunning(veh) then
					Wait(1000)
					SetVehicleEngineOn(veh, true, true, true)
				end
			end
		else
			Wait(100)
		end
	end
end)

Citizen.CreateThread(function()
	local ampuminen = true
	local nopeus = 0
	local alfa = false
		while true do
			Citizen.Wait(100)
	
			if IsPedInAnyVehicle(PlayerPedId(), true) then
				nopeus = GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false))
				if nopeus > 22 and ampuminen then
					SetPlayerCanDoDriveBy(PlayerId(), false)
					ampuminen = false
				elseif nopeus < 22 and not ampuminen then
					SetPlayerCanDoDriveBy(PlayerId(), true)
					ampuminen = true
				end
				if nopeus > 10 and IsPedDoingDriveby(PlayerPedId()) and not alfa then
					ShakeGameplayCam("ROAD_VIBRATION_SHAKE", 10.0)
					alfa = true
				elseif not IsPedDoingDriveby(PlayerPedId()) and alfa then
					StopGameplayCamShaking( true )
					alfa = false
				end
			else
				Citizen.Wait(2000)
			end
		end
	end)

Citizen.CreateThread(function()

  while true do
    Citizen.Wait(1)

    RemoveAllPickupsOfType(0xDF711959) -- Karbiini
    RemoveAllPickupsOfType(0xF9AFB48F) -- Pistooli
    RemoveAllPickupsOfType(0xA9355DCD) -- Pumppuhaulikko
	RemoveAllPickupsOfType(0x88EAACA7) -- Golfmaila
	DisablePlayerVehicleRewards(PlayerId())

  end
end)
-- HYPPYSPAMESTO

Citizen.CreateThread(function()
	local ragdoll_chance = 0.6 
	while true do
		Citizen.Wait(100)

		local ped = PlayerPedId()
		if IsPedOnFoot(ped) and not IsPedSwimming(ped) and (IsPedRunning(ped) or IsPedSprinting(ped)) and not IsPedClimbing(ped) and IsPedJumping(ped) and not IsPedRagdoll(ped) then
			local chance_result = math.random()
			if chance_result < ragdoll_chance then 
				Citizen.Wait(600)
                ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.01)
				SetPedToRagdoll(ped, 200, 200, 2, false, false, false)
			else
				Citizen.Wait(2000)
			end
		end
	end
end)

-- TAZER

--(Pidempi ragdoll)--
Citizen.CreateThread(function()

	Citizen.Wait(30000)
	SetPedConfigFlag(GetPlayerPed(-1), 429, true)
	while true do

		SetPedMinGroundTimeForStungun(GetPlayerPed(-1), 8000)
		SetPedConfigFlag(GetPlayerPed(-1), 35, false)
		SetPedConfigFlag(GetPlayerPed(-1), 184, true)
		Citizen.Wait(30000)

	end
end)

Citizen.CreateThread(function()
	local status = 0
	while true do
		if IsControlJustPressed(0,344) then
			status = status + 1
			if status > 3  then
				status = 0
			end
			if status == 0 then
				DisplayRadar(true)
				SetBigmapActive(false, false)
				SetRadarZoom(1000)
			elseif status == 1 then
				SetBigmapActive(true, false)
				SetRadarZoom(0)
			elseif status == 2 then
				SetBigmapActive(true, false)
				SetRadarZoom(1000)
			elseif status == 3 then
				DisplayRadar(false)
			end
		end
		Wait(0)
	end
end)


Citizen.CreateThread(function()
	if IsPedInAnyVehicle(PlayerPedId(), true) then
		if IsControlJustPressed(0, 38) then
			SetPedConfigFlag(GetPlayerPed(-1), 184, false)
			Wait(1000)
			SetPedConfigFlag(GetPlayerPed(-1), 184, true)
		end
	end
end)
-- KYYKKY

Citizen.CreateThread(function()

	local prone = false
	local crouch = false

	while true do
		Citizen.Wait(5)

		local ped = GetPlayerPed(-1)

		if IsControlPressed(0, 19) then
			DisableControlAction(0, 26, true)
			if IsControlJustPressed(0, 253) then

				if not crouch then
					RequestAnimSet("move_ped_crouched")
					while not HasAnimSetLoaded("move_ped_crouched") do
						Citizen.Wait(1)
					end
					SetPedMovementClipset(ped, "move_ped_crouched", true)
					crouch = true
				else
					ResetPedMovementClipset(ped, 0.0)
					crouch = false
				end
			end
		end

		if IsControlPressed(0, 19) and IsControlJustPressed(0, 186) then
			if not prone then
				Citizen.Wait(100)
				prone = true
				RequestAnimSet( "move_crawl" )
				while ( not HasAnimSetLoaded( "move_crawl" ) ) do 
					Citizen.Wait( 1 )
				end
				ClearPedTasks(ped)
				if IsPedSprinting(ped) or IsPedRunning(ped) or GetEntitySpeed(ped) > 5 then
					TaskPlayAnim(ped, "move_jump", "dive_start_run", 8.0, 1.0, -1, 0, 0.0, 0, 0, 0)
					Citizen.Wait(1000)
				end
				TaskPlayAnimAdvanced(ped, "move_crawl", "onfront_fwd", GetEntityCoords(ped), 0.0, 0.0, GetEntityHeading(ped), 1.0, 1.0, 1.0, 46, 1.0, 0, 0)
			else
				prone = false
				ClearPedTasks(ped)
			end
		end
		if prone then
			DisablePlayerFiring(ped, true)
			if IsControlJustPressed(0, 32) and not movefwd then
				movefwd = true
				TaskPlayAnimAdvanced(ped, "move_crawl", "onfront_fwd", GetEntityCoords(ped), 1.0, 0.0, GetEntityHeading(ped), 1.0, 1.0, 1.0, 47, 1.0, 0, 0)
			elseif IsControlJustReleased(0, 32) and movefwd then
				TaskPlayAnimAdvanced(ped, "move_crawl", "onfront_fwd", GetEntityCoords(ped), 1.0, 0.0, GetEntityHeading(ped), 1.0, 1.0, 1.0, 46, 1.0, 0, 0)
				movefwd = false
			end		
			if IsControlJustPressed(0, 33) and not movebwd then
				movebwd = true
				TaskPlayAnimAdvanced(ped, "move_crawl", "onfront_bwd", GetEntityCoords(ped), 1.0, 0.0, GetEntityHeading(ped), 1.0, 1.0, 1.0, 47, 1.0, 0, 0)
			elseif IsControlJustReleased(0, 33) and movebwd then 
				TaskPlayAnimAdvanced(ped, "move_crawl", "onfront_bwd", GetEntityCoords(ped), 1.0, 0.0, GetEntityHeading(ped), 1.0, 1.0, 1.0, 46, 1.0, 0, 0)
				movebwd = false
			end
		end
	end
end)


-- OSOTTAMINEN

local mp_pointing = false
local keyPressed = false
local function startPointing()

    local ped = GetPlayerPed(-1)
    RequestAnimDict("anim@mp_point")
    while not HasAnimDictLoaded("anim@mp_point") do
        Wait(10)
    end
    SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
    SetPedConfigFlag(ped, 36, 1)
    Citizen.InvokeNative(0x2D537BA194896636, ped, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
    RemoveAnimDict("anim@mp_point")
end

local function stopPointing()
    local ped = GetPlayerPed(-1)
    Citizen.InvokeNative(0xD01015C7316AE176, ped, "Stop")
    if not IsPedInjured(ped) then
        ClearPedSecondaryTask(ped)
    end
    if not IsPedInAnyVehicle(ped, 1) then
        SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
    end
    SetPedConfigFlag(ped, 36, 0)
    ClearPedSecondaryTask(PlayerPedId())
end

local once = true
local oldval = false
local oldvalped = false

Citizen.CreateThread(function()
    while true do
        Wait(10)
        if once then
            once = false
        end
        if not keyPressed then
            if IsControlPressed(0, 29) and not mp_pointing and IsPedOnFoot(PlayerPedId()) then
                Wait(200)
                if not IsControlPressed(0, 29) then
                    keyPressed = true
                    startPointing()
                    mp_pointing = true
                else
                    keyPressed = true
                    while IsControlPressed(0, 29) do
                        Wait(50)
                    end
                end
            elseif (IsControlPressed(0, 29) and mp_pointing) or (not IsPedOnFoot(PlayerPedId()) and mp_pointing) then

                keyPressed = true
                mp_pointing = false
                stopPointing()
            end
        end
        if keyPressed then
            if not IsControlPressed(0, 29) then
                keyPressed = false
            end
        end
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) and not mp_pointing then
            stopPointing()
        end
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) then
            if not IsPedOnFoot(PlayerPedId()) then
                stopPointing()
            else
                local ped = GetPlayerPed(-1)
                local camPitch = GetGameplayCamRelativePitch()
                if camPitch < -70.0 then
                    camPitch = -70.0
                elseif camPitch > 42.0 then
                    camPitch = 42.0
                end
                camPitch = (camPitch + 70.0) / 112.0

                local camHeading = GetGameplayCamRelativeHeading()
                local cosCamHeading = Cos(camHeading)
                local sinCamHeading = Sin(camHeading)
                if camHeading < -180.0 then
                    camHeading = -180.0
                elseif camHeading > 180.0 then
                    camHeading = 180.0
                end
                camHeading = (camHeading + 180.0) / 360.0

                local blocked = 0
                local nn = 0
                local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
                local ray = Cast_3dRayPointToPoint(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7);

                nn,blocked,coords,coords = GetRaycastResult(ray)
                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Pitch", camPitch)
                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Heading", camHeading * -1.0 + 1.0)
                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isBlocked", blocked)
                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isFirstPerson", Citizen.InvokeNative(0xEE778F8C7E1142E2, Citizen.InvokeNative(0x19CAFA3C87F7C2FF)) == 4)
            end
        end
    end
end)


-- EI ASETTA KUN BENSALOPPUU

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if GetSelectedPedWeapon(GetPlayerPed(-1)) == 0x34A67B97 then
			if GetAmmoInPedWeapon(GetPlayerPed(-1), 0x34A67B97) < 99 then
				ClearPedTasks(GetPlayerPed(-1))
				SetCurrentPedWeapon(GetPlayerPed(-1), 0xA2719263, 1)
				RemoveWeaponFromPed(GetPlayerPed(-1), 0x34A67B97)

			end
		else
			Citizen.Wait(1000)
		end
	end
end)