Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local FirstSpawn, PlayerLoaded = true, false
IsRagdol = false
IsDead = false
ESX = nil
local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	PlayerLoaded = true
	ESX.PlayerData = ESX.GetPlayerData()
end)

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

RegisterNetEvent('tac:setJob')
AddEventHandler('tac:setJob', function(job)
  PlayerData.job = job
end)

RegisterNetEvent('tac:playerLoaded')
AddEventHandler('tac:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	PlayerLoaded = true
end)

RegisterNetEvent('tac:setJob')
AddEventHandler('tac:setJob', function(job)
	ESX.PlayerData.job = job
end)

AddEventHandler('playerSpawned', function()
--[[ 	if not IsRagdol and not FirstSpawn then
	IsDead = false
		print('muutettiin IsDead: false')
	end ]]
				while not PlayerLoaded do
					Citizen.Wait(1000)
					print('player is not loaded 1sec wait')
				end
	if FirstSpawn then
		exports.spawnmanager:setAutoSpawn(false) -- disable respawn
		FirstSpawn = false
		print('First spawn true')
		ESX.TriggerServerCallback('tac_ambulancejob:getDeathStatus', function(isDead)
			if isDead and Config.AntiCombatLog then

--				ESX.ShowNotification(_U('combatlog_message'))
--				RemoveItemsAfterRPDeath()
		                Citizen.Wait(3000)
		                SetEntityHealth(GetPlayerPed(-1), 0)
			else
				print('Im alive')
			end
		end)
	end
end)

-- Create blips
Citizen.CreateThread(function()
	for k,v in pairs(Config.Hospitals) do
		local blip = AddBlipForCoord(v.Blip.coords)

		SetBlipSprite(blip, v.Blip.sprite)
		SetBlipScale(blip, v.Blip.scale)
		SetBlipColour(blip, v.Blip.color)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName(_U('hospital'))
		EndTextCommandSetBlipName(blip)
	end
end)

-- Disable most inputs when dead
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if IsDead then
--[[ 			DisableAllControlActions(0)
			EnableControlAction(0, Keys['F5'], true)
			EnableControlAction(0, Keys['G'], true)
			EnableControlAction(0, Keys['T'], true)
			EnableControlAction(0, Keys['E'], true) ]]
			DisableControlAction(0, 37, true) -- vaihda asetta
			DisableControlAction(0, 36, true) -- kyykkyynmeno
			DisableControlAction(0, 20, true) -- handsup
			DisableControlAction(0, 142, true) -- MeleeAttackAlternate
			DisableControlAction(0, 30,  true) -- MoveLeftRight
			DisableControlAction(0, 31,  true) -- MoveUpDown
			DisableControlAction(0, 168, true) -- f7 animaatiot
			DisableControlAction(0, 167, true) -- f6 animaatiot
			DisableControlAction(0, 170, true) -- f3 animaatiot
			DisableControlAction(0, 289, true) -- f2 animaatiot
			DisableControlAction(0, 288, true) -- f1 puhelin
			DisableControlAction(0, 157, true) -- 1 puhelin
			DisableControlAction(0, 183, true) -- 1 puhelin
			DisableControlAction(0,21,true) -- disable sprint
			DisableControlAction(0,24,true) -- disable attack
			DisableControlAction(0,25,true) -- disable aim
			DisableControlAction(0,47,true) -- disable weapon
			DisableControlAction(0,58,true) -- disable weapon
			DisableControlAction(0,263,true) -- disable melee
			DisableControlAction(0,264,true) -- disable melee
			DisableControlAction(0,257,true) -- disable melee
			DisableControlAction(0,140,true) -- disable melee
			DisableControlAction(0,141,true) -- disable melee
			DisableControlAction(0,142,true) -- disable melee
			DisableControlAction(0,143,true) -- disable melee
			DisableControlAction(0,75,true) -- disable exit vehicle
			DisableControlAction(27,75,true) -- disable exit vehicle
			DisableControlAction(0,32,true) -- move (w)
			DisableControlAction(0,34,true) -- move (a)
			DisableControlAction(0,33,true) -- move (s)
			DisableControlAction(0,35,true) -- move (d)
		else
			Citizen.Wait(500)
		end
	end
end)

function OnPlayerDeath()
	IsDead = true
	IsRagdol = true
	TriggerServerEvent('tac_ambulancejob:setDeathStatus', true)
--	print('Kuolit')
	StartDeathTimer()
--
	StartDistressSignal()
	Citizen.Wait(4000)
	TriggerEvent('tac_ambulancejob:ragdolrevive')
	StartScreenEffect('DeathFailOut', 0, false)
end

function StartDistressSignal()
	Citizen.CreateThread(function()
		local timer = Config.BleedoutTimer

		while timer > 0 and IsDead do
			Citizen.Wait(2)
			timer = timer - 30

			SetTextFont(4)
			SetTextProportional(1)
			SetTextScale(0.45, 0.45)
			SetTextColour(185, 185, 185, 255)
			SetTextDropShadow(0, 0, 0, 0, 255)
			SetTextEdge(1, 0, 0, 0, 255)
			SetTextDropShadow()
			SetTextOutline()
			BeginTextCommandDisplayText('STRING')
			AddTextComponentSubstringPlayerName(_U('distress_send'))
			EndTextCommandDisplayText(0.175, 0.805)

			if IsControlPressed(0, Keys['SPACE']) then
				ESX.TriggerServerCallback('tac_ambulancejob:getItemAmount', function(quantity)
					if quantity > 0 then 
						SendDistressSignal()
					end
				end, 'securitybracelet')
				Citizen.CreateThread(function()
					Citizen.Wait(1000 * 60 * 5)
					if IsDead then
						StartDistressSignal()
					end
				end)

				break
			end
		end
	end)
end

function SendDistressSignal()
	local playerPed = PlayerPedId()
	PedPosition		= GetEntityCoords(playerPed)
	local PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z }
	
	ESX.ShowNotification(_U('distress_sent'))
	TriggerServerEvent('tac_addons_gcPhone:sendMessage:startCall', 'ambulance', _U('distress_message'), PlayerCoords, {	
		PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z },
	})
end

function DrawGenericTextThisFrame()
	SetTextFont(4)
	SetTextProportional(0)
	SetTextScale(0.0, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(true)
end

function secondsToClock(seconds)
	local seconds, hours, mins, secs = tonumber(seconds), 0, 0, 0

	if seconds <= 0 then
		return 0, 0
	else
		local hours = string.format("%02.f", math.floor(seconds / 3600))
		local mins = string.format("%02.f", math.floor(seconds / 60 - (hours * 60)))
		local secs = string.format("%02.f", math.floor(seconds - hours * 3600 - mins * 60))

		return mins, secs
	end
end

function StartDeathTimer()
	local canPayFine = false

	if Config.EarlyRespawnFine then
		ESX.TriggerServerCallback('tac_ambulancejob:checkBalance', function(canPay)
			canPayFine = canPay
		end)
	end

	local earlySpawnTimer = ESX.Math.Round(Config.EarlyRespawnTimer / 1000)
	local bleedoutTimer = ESX.Math.Round(Config.BleedoutTimer / 1000)

	Citizen.CreateThread(function()
		-- early respawn timer
		while earlySpawnTimer > 0 and IsDead do
			Citizen.Wait(1000)

			if earlySpawnTimer > 0 then
				earlySpawnTimer = earlySpawnTimer - 1
			end
		end

		-- bleedout timer
		while bleedoutTimer > 0 and IsDead do
			Citizen.Wait(1000)

			if bleedoutTimer > 0 then
				bleedoutTimer = bleedoutTimer - 1
			end
		end
	end)

	Citizen.CreateThread(function()
		local text, timeHeld

		-- early respawn timer
		while earlySpawnTimer > 0 and IsDead do
			Citizen.Wait(0)
			text = _U('respawn_available_in', secondsToClock(earlySpawnTimer))

			DrawGenericTextThisFrame()

			SetTextEntry("STRING")
			AddTextComponentString(text)
			DrawText(0.5, 0.8)
		end

		-- bleedout timer
		while bleedoutTimer > 0 and IsDead do
			Citizen.Wait(0)
			text = _U('respawn_bleedout_in', secondsToClock(bleedoutTimer))

			if not Config.EarlyRespawnFine then
				text = text .. _U('respawn_bleedout_prompt')

--				if IsControlPressed(0, Keys['E']) then
				if IsDisabledControlJustPressed(0, Keys['E']) then
					RemoveItemsAfterRPDeath()
					break
				end
			elseif Config.EarlyRespawnFine and canPayFine then
				text = text .. _U('respawn_bleedout_fine', ESX.Math.GroupDigits(Config.EarlyRespawnFineAmount))

				if IsControlPressed(0, Keys['E']) and timeHeld > 60 then
					TriggerServerEvent('tac_ambulancejob:payFine')
					RemoveItemsAfterRPDeath()
					break
				end
			end

			if IsControlPressed(0, Keys['E']) then
				timeHeld = timeHeld + 1
			else
				timeHeld = 0
			end

			DrawGenericTextThisFrame()

			SetTextEntry("STRING")
			AddTextComponentString(text)
			DrawText(0.5, 0.8)
		end
			
		if bleedoutTimer < 1 and IsDead then
			RemoveItemsAfterRPDeath()
		end
	end)
end


RespawnPoint = { 
	sanky1 = { nro = 1, coords = vector3(310.244, -577.837,	42.284), heading = 26.037 },
	sanky2 = { nro = 2, coords = vector3(308.818, -581.986,	42.284), heading = 349.526 },
	sanky3 = { nro = 3, coords = vector3(314.982, -578.923,	42.284), heading = 114.641 },
	sanky4 = { nro = 4, coords = vector3(312.019, -583.345,	42.284), heading = 39.496 },
	sanky5 = { nro = 5, coords = vector3(313.573, -583.9, 42.284), heading = 103.263 },
	sanky6 = { nro = 6, coords = vector3(318.551, -580.677,	42.284), heading = 43.028 },
	sanky7 = { nro = 7, coords = vector3(316.665, -585.4, 42.284), heading = 16.592 },
	sanky8 = { nro = 8, coords = vector3(323.313, -582.408,	42.284), heading = 104.418 },
	sanky9 = { nro = 9, coords = vector3(321.721, -586.902,	42.284), heading = 344.113 }
}

function RemoveItemsAfterRPDeath()
	TriggerServerEvent('tac_ambulancejob:setDeathStatus', false)

	Citizen.CreateThread(function()
 		DoScreenFadeOut(800)

		while not IsScreenFadedOut() do
			Citizen.Wait(10)
		end 

		ESX.TriggerServerCallback('tac_ambulancejob:removeItemsAfterRPDeath', function()


			ESX.SetPlayerData('lastPosition', Config.RespawnPoint.coords)
			ESX.SetPlayerData('loadout', {})

			TriggerServerEvent('tac:updateLastPosition', Config.RespawnPoint.coords)
			RespawnPed(PlayerPedId(), Config.RespawnPoint.coords, Config.RespawnPoint.heading)
			--TriggerEvent('tac_ambulancejob:revive')
			StopScreenEffect('DeathFailOut')
			--TriggerEvent('disc-inventoryhud:refreshInventory')
			TriggerEvent('mythic_hospital:client:ResetLimbs')
			TriggerEvent('mythic_hospital:client:RemoveBleed')
--			TriggerServerEvent('disc-inventoryhud:RPdeathCleaner')
			Citizen.Wait(5000)
			DoScreenFadeIn(0)
			sairaalaan()
			DoScreenFadeIn(0)



		end)
	end)
end

RegisterNetEvent('tac_ambulancejob:sairaalaan')
AddEventHandler('tac_ambulancejob:sairaalaan', function()
	print('meow')
	Citizen.CreateThread(function()
		DoScreenFadeOut(800)

		while not IsScreenFadedOut() do
		Citizen.Wait(10)
		end 
		ESX.SetPlayerData('lastPosition', Config.RespawnPoint.coords)
		TriggerServerEvent('tac:updateLastPosition', Config.RespawnPoint.coords)
		--RespawnPed(PlayerPedId(), Config.RespawnPoint.coords, Config.RespawnPoint.heading)
		StopScreenEffect('DeathFailOut')
		DoScreenFadeIn(0)
		TriggerEvent('tac_ambulancejob:revive')
		Citizen.Wait(100)
		sairaalaan()

	end)
end)

function sairaalaan()
	print('sairaalaan')
	 local ped = GetPlayerPed(-1)
	local found
	 --SetEntityCoordsNoOffset(ped, Config.RespawnPoint.coords.x, Config.RespawnPoint.coords.y, Config.RespawnPoint.coords.z, false, false, false, true)
	 Citizen.Wait(2000)
	 repeat
		 found = false
			for i,v in pairs(RespawnPoint) do 
				SetEntityCoordsNoOffset(ped, v.coords.x, v.coords.y, v.coords.z, false, false, false, true)
					local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()				
					if closestDistance <= 1.3 and closestDistance >= 0 then
							print(v.coords.x, v.coords.y, v.coords.z, v.heading)					
							local objectloc = v.coords
							
					else	
							print('Closest distance '..closestDistance)
							sankyyn()
							print('bed found')
							found = true
							break
					end
			--	print(v)
			end
		until found
	
end

RegisterCommand('ambu', function(source)

	sairaalaan()
	 
--	SetPedToRagdollWithFall(ped, 9500, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0)
end, true)

function sankyyn()
	-- body
	Citizen.CreateThread(function()
	print('boot')
	local lightsout = 30000
	local object, distance = ESX.Game.GetClosestObject(Config.Hospitaali)
	local objectPos = GetEntityCoords(object)
	local thash = GetEntityModel(object)
	local ped = PlayerPedId()
		blinking()			
			if object == -1 or objectPos.z < 40 then 
				print('holding')
				Citizen.Wait(100)
				sankyyn()
			else

			print(object)
			local coords = GetOffsetFromEntityInWorldCoords(object, 0, -0.6, 0.5)
			local heading = GetEntityHeading(object)-180
			local setcoords = GetOffsetFromEntityInWorldCoords(object, -1.0, 0, 0)
			Citizen.Wait(10)
			SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
			SetEntityHeading(ped, heading)
			Citizen.Wait(1000)
			RequestAnimSet("move_m@drunk@verydrunk")
			while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
			Citizen.Wait(1)
			end

			SetPedMovementClipset(ped, "move_m@drunk@verydrunk", true)
			SetTimecycleModifier("BulletTimeLight") --koita myös:  spectator5 BulletTimeLight
			SetPedMotionBlur(ped, true)
			SetPedIsDrunk(ped, true)
			SetPedToRagdoll(ped, lightsout, lightsout, 0, 0, 0, 0)
			ApplyForceToEntity(ped, 4, 20.0, 10.0, 0, 0.0, 0.0, 0.0, 1, false, true, false, false)				
			IsDead = false
			Citizen.Wait(lightsout)
			ClearTimecycleModifier()
			DoScreenFadeOut(800)
			while not IsScreenFadedOut() do
				Citizen.Wait(10)
			end
			ResetScenarioTypesEnabled()
			ResetPedMovementClipset(ped, 0)
			SetPedIsDrunk(ped, false)
			SetPedMotionBlur(ped, false)
			DoScreenFadeIn(800)		
			
		end
		
	end)
end

function RespawnPed(ped, coords, heading)
	IsRagdol = false
	SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
	SetPlayerInvincible(ped, false)
	TriggerEvent('playerSpawned', coords.x, coords.y, coords.z)
	ClearPedBloodDamage(ped)
	TriggerEvent('mythic_hospital:client:ResetLimbs')
    TriggerEvent('mythic_hospital:client:RemoveBleed')
	ESX.UI.Menu.CloseAll()
end




function RagdolRespawnPed(ped, coords, heading)
	--	Citizen.Wait(4000)
--[[ for i=1, 10 do
        ClearPedTasksImmediately(PlayerPedId())
        Citizen.Wait(700)
	end ]]
	print('halo?')
	TriggerServerEvent('tac_ambulancejob:saveplayer')
	SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
	SetPlayerInvincible(ped, true)
	TriggerEvent('playerSpawned', coords.x, coords.y, coords.z)
	--ClearPedBloodDamage(ped)
	SetPedToRagdoll(ped, -1, -1, 0, 0, 0, 0)
	SetEntityHealth(ped, 50.0)
	ESX.UI.Menu.CloseAll()
	TriggerEvent('mythic_hospital:client:ResetLimbs')
    TriggerEvent('mythic_hospital:client:RemoveBleed')
 	--startRagdollWorkaround(ped)
end

RegisterNetEvent('tac_ambulancejob:resetStatus')
AddEventHandler('tac_ambulancejob:resetStatus', function()
	if IsDead then 
		print('meemoo')
		startRagdollWorkaround()
		
	else

		print('pikachu')

	end
end)


function startRagdollWorkaround()
    local work = true
    SetTimecycleModifier('hud_def_blur')
    local players = {}

	
	for _, player in ipairs(GetActivePlayers()) do
    		players[player] = true
    -- do stuff
	end

    Citizen.CreateThread(function()
        while work do
            Citizen.Wait(0)
            drawLoadingText('PÄIVITETÄÄN RAATOSI SIJAINTIA...', 255,255,255,255)
            DisableAllControlActions(0)

            for k,v in pairs(players) do
                local targetPed = GetPlayerPed(k)

                SetEntityLocallyInvisible(targetPed)
                SetEntityNoCollisionEntity(PlayerPedId(), targetPed, true)
            end
        end
    end)

    for i=1, 10 do
        ClearPedTasksImmediately(PlayerPedId())
        Citizen.Wait(700)
    end

    for k,v in pairs(players) do
        if NetworkIsPlayerActive(k) then
            SetEntityLocallyVisible(GetPlayerPed(k))
        end
    end

	work = false
	SetTimecycleModifier('default')
	--SetPedToRagdoll(PlayerPedId(), -1, -1, 0, 0, 0, 0)
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped, true)
	local heading = GetEntityHeading(ped)
	RagdolRespawnPed(ped, coords, heading)

end

function drawLoadingText(text, red, green, blue, alpha)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(1.0, 1.5)
    SetTextColour(red, green, blue, alpha)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(true)

    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(0.5, 0.5)
end

eyeblink = false
function blinking()
	-- body
	Citizen.CreateThread(function()
	randomBlinks = math.random(15,30)
		for i=1 , randomBlinks, 1 do 
			eyeblink = not eyeblink
			Citizen.Wait(math.random(500,3000)) 
			if i == randomBlinks then 
				eyeblink = false
			end 
		end
	end)
end


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
    if eyeblink then
      drawRct(0.5, 0.5, 1.0,1.0,0,0,0,255) -- dat silmänräpsäys
     
		end
		if IsRagdol then
			local ped = GetPlayerPed(-1)
			if not IsEntityPlayingAnim( myped, "dam_ko", "drown", 3 ) then
				IsDead = true
				SetPlayerInvincible(PlayerId(), true)
				SetPedToRagdoll(ped, 500, 500, 0, 0, 0, 0)
				SetEntityHealth(ped, 50)
				ResetPedRagdollTimer(ped)
			else
				IsDead = true
		--	print(IsRagdol)
			end
		end
  end
end)

function drawRct(x,y,width,height,r,g,b,a)
  DrawRect(x, y, width, height, r, g, b, a)
end


RegisterNetEvent('tac_phone:loaded')
AddEventHandler('tac_phone:loaded', function(phoneNumber, contacts)
	local specialContact = {
		name		= 'ambulance',
		number		= 'ambulance',
		base64Icon	= 'data:image/png;base64,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'
	}

	TriggerEvent('tac_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

AddEventHandler('tac:onPlayerDeath', function(reason)
	print('kuolit hahaaa')
	if not IsDead then
		OnPlayerDeath()
	else
--		print('Ja makaa ja istuu ja juhlii')
	end
end)

RegisterNetEvent('tac_ambulancejob:revive')
AddEventHandler('tac_ambulancejob:revive', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	
	IsDead = false
	IsRagdol = false
	TriggerServerEvent('tac_ambulancejob:setDeathStatus', false)

	Citizen.CreateThread(function()
		DoScreenFadeOut(800)

--[[		while not IsScreenFadedOut() do
			Citizen.Wait(50)
		end--]]

		ESX.SetPlayerData('lastPosition', {
			x = coords.x,
			y = coords.y,
			z = coords.z
		})

		TriggerServerEvent('tac:updateLastPosition', {
			x = coords.x,
			y = coords.y,
			z = coords.z
		})

		RespawnPed(playerPed, {
			x = coords.x,
			y = coords.y,
			z = coords.z,
			heading = 0.0
		})

		StopScreenEffect('DeathFailOut')
		DoScreenFadeIn(800)
	end)
end)

RegisterNetEvent('tac_ambulancejob:ragdolrevive')
AddEventHandler('tac_ambulancejob:ragdolrevive', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
--	TriggerServerEvent('tac_ambulancejob:setDeathStatus', true)

	Citizen.CreateThread(function()
		DoScreenFadeOut(800)

--[[		while not IsScreenFadedOut() do
			Citizen.Wait(50)
		end--]]

		ESX.SetPlayerData('lastPosition', {
			x = coords.x,
			y = coords.y,
			z = coords.z
		})

		TriggerServerEvent('tac:updateLastPosition', {
			x = coords.x,
			y = coords.y,
			z = coords.z
		})

		RagdolRespawnPed(playerPed, {
			x = coords.x,
			y = coords.y,
			z = coords.z,
			heading = 0.0
		})
		
		StopScreenEffect('DeathFailOut')
		DoScreenFadeIn(800)
	end)
end)


-- Load unloaded IPLs
if Config.LoadIpl then
	Citizen.CreateThread(function()
		LoadMpDlcMaps()
		EnableMpDlcMaps(true)
		RequestIpl('Coroner_Int_on') -- Morgue
	end)
end
