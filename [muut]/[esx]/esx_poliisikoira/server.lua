ESX = nil
TriggerEvent('tac:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('tac_poliisikoira:hasClosestDrugs')
AddEventHandler('tac_poliisikoira:hasClosestDrugs', function(playerId)
    local target = ESX.GetPlayerFromId(playerId)
    local src = source
    local inventory = target.inventory
    for i = 1, #inventory do
        for k, v in pairs(Config.Drugs) do
            if inventory[i].name == v and inventory[i].count > 0 then
                TriggerClientEvent('tac_poliisikoira:hasDrugs', src, true)
                return
            end
        end
    end
    TriggerClientEvent('tac_poliisikoira:hasDrugs', src, false)
end)