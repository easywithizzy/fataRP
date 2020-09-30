RegisterNetEvent("mythic_hospital:items:gauze")
AddEventHandler("mythic_hospital:items:gauze", function(item)
    exports['mythic_progbar']:Progress({
        name = "firstaid_action",
        duration = 1500,
        label = "Työnnät lappuja haavoihin...",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "missarmenian3@franklin_driving",
            anim = "steer_no_lean",
            flags = 49,
        },
        prop = {
            model = "prop_paper_bag_small",
        }
    }, function(status)
        if not status then
            TriggerEvent('mythic_hospital:client:FieldTreatBleed')
        end
    end)
end)

RegisterNetEvent("mythic_hospital:items:bandage")
AddEventHandler("mythic_hospital:items:bandage", function(item)
    exports['mythic_progbar']:Progress({
        name = "firstaid_action",
        duration = 16000,
        label = "Sidot haavaa sideharsolla...",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "missarmenian3@franklin_driving",
            anim = "steer_no_lean",
            flags = 49,
        },
        prop = {
            model = "prop_ld_health_pack",
        }
    }, function(status)
        if not status then
			local maxHealth = GetEntityMaxHealth(PlayerPedId())
			local health = GetEntityHealth(PlayerPedId())
			local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 2))
            SetEntityHealth(PlayerPedId(), newHealth)
            TriggerEvent('mythic_hospital:client:ReduceBleed')

        end
    end)
end)

RegisterNetEvent("mythic_hospital:items:firstaid")
AddEventHandler("mythic_hospital:items:firstaid", function(item)
	   
    ESX.UI.Menu.CloseAll()
    local elements = {}
      
    
local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer() 
    if closestPlayer ~= -1 and closestDistance < 3.0 then
        table.insert(elements,{label = 'Hoida itseäsi', value = 'fix_me'})
        table.insert(elements,{label = 'Hoida lähintä',  value = 'fix_other'})
              

        ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'kaappipoistakaappi',
        {
            title    = 'Ensiapulaukku',
            align = 'center',
            elements = elements,
        },
        function(data, menu)

            if data.current.value == 'fix_me' then
                ESX.UI.Menu.CloseAll()
                Citizen.Wait(500)
                firstAidApply(PlayerPedId())            
            end

            if data.current.value == 'fix_other' then
                ESX.UI.Menu.CloseAll()
                Citizen.Wait(500)
                firstAidApply(GetPlayerPed(closestPlayer))       
            end

        end,
        function(data, menu)

            menu.close()

        end)
    else
        firstAidApply(PlayerPedId())
    end

end)
function firstAidApply(target)
    local ped = PlayerPedId()
    exports['mythic_progbar']:Progress({
        name = "firstaid_action",
        duration = 20000,
        label = "Käytät ensiapupakkausta...",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "missarmenian3@franklin_driving",
            anim = "steer_no_lean",
            flags = 49,
        },
        prop = {
            model = "prop_stat_pack_01"
        },
    }, function(status)
        if not status then
            if ped ~= target then 
                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer() 
                if closestPlayer == -1 or closestDistance <= 3.0 and GetPlayerPed(closestPlayer) == target then
                    local maxHealth = GetEntityMaxHealth(target)
                    local health = GetEntityHealth(target)
                    local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 2))
                    if newHealth > 150 then 
                        ClearPedBloodDamage(GetPlayerPed(closestPlayer))
                    end
                    TriggerEvent('mythic_hospital:ReduceBleedOfTarget', GetPlayerServerId(closestPlayer))
                    TriggerEvent('mythic_hospital:ReduceBleedOfTarget', GetPlayerServerId(closestPlayer))
                    TriggerEvent('mythic_hospital:ReduceBleedOfTarget', GetPlayerServerId(closestPlayer))
                    SetEntityHealth(target, newHealth)
                else
                    ESX.ShowNotificaton('Hoidettava henkilö oli liian kaukana...')
                end
            else
                    local maxHealth = GetEntityMaxHealth(target)
                    local health = GetEntityHealth(target)
                    local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 2))
                    if newHealth > 150 then 
                        ClearPedBloodDamage(target)
                    end
                    TriggerEvent('mythic_hospital:client:ReduceBleed')
                    TriggerEvent('mythic_hospital:client:ReduceBleed')
                    TriggerEvent('mythic_hospital:client:ReduceBleed')
                    SetEntityHealth(target, newHealth)
            end
        end
    end)
end



RegisterNetEvent("mythic_hospital:items:medkit")
AddEventHandler("mythic_hospital:items:medkit", function(item)
    exports['mythic_progbar']:Progress({
        name = "firstaid_action",
        duration = 20000,
        label = "Käytät lääkintälaukkua...",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "missarmenian3@franklin_driving",
            anim = "steer_no_lean",
            flags = 49,
        },
        prop = {
            model = "prop_ld_health_pack"
        },
    }, function(status)
        if not status then
			SetEntityHealth(PlayerPedId(), GetEntityMaxHealth(PlayerPedId()))
            TriggerEvent('mythic_hospital:client:FieldTreatLimbs')
        end
    end)
end)

RegisterNetEvent("mythic_hospital:items:vicodin")
AddEventHandler("mythic_hospital:items:vicodin", function(item)
    exports['mythic_progbar']:Progress({
        name = "firstaid_action",
        duration = 5000,
        label = "Otat paratabsin...",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "mp_suicide",
            anim = "pill",
            flags = 49,
        },
        prop = {
            model = "prop_cs_pills",
            bone = 58866,
            coords = { x = 0.1, y = 0.0, z = 0.001 },
            rotation = { x = -60.0, y = 0.0, z = 0.0 },
        },
    }, function(status)
        if not status then
            TriggerEvent('mythic_hospital:client:UsePainKiller', 1)
        end
    end)
end)

RegisterNetEvent("mythic_hospital:items:hydrocodone")
AddEventHandler("mythic_hospital:items:hydrocodone", function(item)
    exports['mythic_progbar']:Progress({
        name = "firstaid_action",
        duration = 1000,
        label = "Otat hydrocodonea...",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "mp_suicide",
            anim = "pill",
            flags = 49,
        },
        prop = {
            model = "prop_cs_pills",
            bone = 58866,
            coords = { x = 0.1, y = 0.0, z = 0.001 },
            rotation = { x = -60.0, y = 0.0, z = 0.0 },
        },
    }, function(status)
        if not status then
            TriggerEvent('mythic_hospital:client:UsePainKiller', 2)
        end
    end)
end)

RegisterNetEvent("mythic_hospital:items:morphine")
AddEventHandler("mythic_hospital:items:morphine", function(item)
    exports['mythic_progbar']:Progress({
        name = "firstaid_action",
        duration = 2000,
        label = "Otat morphinea...",
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "mp_suicide",
            anim = "pill",
            flags = 49,
        },
        prop = {
            model = "prop_cs_pills",
            bone = 58866,
            coords = { x = 0.1, y = 0.0, z = 0.001 },
            rotation = { x = -60.0, y = 0.0, z = 0.0 },
        },
    }, function(status)
        if not status then
            TriggerEvent('mythic_hospital:client:UsePainKiller', 6)
        end
    end)
end)