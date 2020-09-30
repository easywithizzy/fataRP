local skins = {
    ['default'] = 'mp_m_freemode_01',
    ['steam:1100001372b754d'] = 'a_m_m_farmer_01', -- Jonttu / Stefa
    ['steam:11000011d2d43e0'] = 'a_m_m_hillbilly_01', -- jano / Jaska
    ['steam:11000013e9987d4'] = 'a_m_o_acult_02', -- IDk
    [''] = 'a_c_shepherd', -- Sassu
    [''] = 'a_c_shepherd', -- Sessu
    [''] = 'a_c_shepherd' -- Kalle
}

RegisterServerEvent('playerSpawn')
AddEventHandler('playerSpawn', function()
    local steamID = nil
    for k,v in ipairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1, 5) == "steam" then
            steamID = string.lower(v)
            break
        end
    end
    local skin = nil
    if skins[steamID] ~= nil then
        skin = skins[steamID]
    end
    TriggerClientEvent("applyskin", source, skin)
end)
