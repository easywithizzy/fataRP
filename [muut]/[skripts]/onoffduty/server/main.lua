ESX = nil

TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('duty:onoff')
AddEventHandler('duty:onoff', function(job)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.name
    local grade = xPlayer.job.grade
    
    if job == 'police' or job == 'ambulance' or job == 'sheriff' then
        xPlayer.setJob('off' ..job, grade)
        TriggerClientEvent('tac:showNotification', _source, _U('offduty'))
    elseif job == 'offpolice' then
        xPlayer.setJob('police', grade)
        TriggerClientEvent('tac:showNotification', _source, _U('onduty'))
    elseif job == 'offsheriff' then
        xPlayer.setJob('sheriff', grade)
        TriggerClientEvent('tac:showNotification', _source, _U('onduty'))
    elseif job == 'offambulance' then
        xPlayer.setJob('ambulance', grade)
        TriggerClientEvent('tac:showNotification', _source, _U('onduty'))
    end

end)