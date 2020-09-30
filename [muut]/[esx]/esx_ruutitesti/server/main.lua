ESX = nil
local gsrData = {}

TriggerEvent('tac:getSharedObject', function(obj)ESX = obj end)

TriggerEvent('es:addCommand', 'ruutitesti', function(source, args, user)
    local Source = source
    local xPlayer = ESX.GetPlayerFromId(Source)
    local number = tonumber(args[1])
    if args[1] ~= nil and xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
        CancelEvent()        
        local identifier = GetPlayerIdentifiers(number)[1]
        if identifier ~= nil then
            gsrcheck(source, identifier)
        end
    end
end)

AddEventHandler('tac:playerDropped', function(source)
    local Source = source
    local identifier = GetPlayerIdentifiers(Source)[1]
    if gsrData[identifier] ~= nil then
        gsrData[identifier] = nil
    end
end)

RegisterNetEvent("tac_gsr:Check")
AddEventHandler("tac_gsr:Check", function(player)
    local Source = source
    local xPlayer = ESX.GetPlayerFromId(Source)
    local identifier = GetPlayerIdentifiers(player)[1]
    if identifier ~= nil and xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff'  then
        gsrcheck(source, identifier)
    end
end)

RegisterNetEvent("tac_gsr:Remove")
AddEventHandler("tac_gsr:Remove", function()
    local Source = source
    local identifier = GetPlayerIdentifiers(Source)[1]
    if gsrData[identifier] ~= nil then
        gsrData[identifier] = nil
    end
end)

RegisterServerEvent('tac_gsr:SetGSR')
AddEventHandler('tac_gsr:SetGSR', function()
    local Source = source
    local identifier = GetPlayerIdentifiers(Source)[1]
    gsrData[identifier] = os.time(os.date("!*t")) + Config.gsrTime
end)

function gsrcheck(source, identifier)
    local Source = source
    local identifier = identifier
    if gsrData[identifier] ~= nil then
        TriggerClientEvent('tac_gsr:Notify', Source, _U('gsr_positive'), "error")
    else
        TriggerClientEvent('tac_gsr:Notify', Source, _U('gsr_negative'), "success")
    end
end

ESX.RegisterServerCallback('tac_gsr:Status', function(source, cb)
    local Source = source
    local identifier = GetPlayerIdentifiers(Source)[1]
    if gsrData[identifier] ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

function removeGSR()
    for k, v in pairs(gsrData) do
        if v <= os.time(os.date("!*t")) then
            gsrData[k] = nil
        end
    end
end

function gsrTimer()
    removeGSR()
    SetTimeout(Config.gsrAutoRemove, gsrTimer)
end

gsrTimer()
