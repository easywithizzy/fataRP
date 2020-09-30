RegisterServerEvent('announce')
AddEventHandler('announce', function (param)
    --Tämä tarkistaa onko pelaajan käyttöoikeudet tarpeeksi suuret komennon käyttöön
    if IsPlayerAceAllowed(source, "administrator") then
        print('^7[^4Announcement^7]^5:'.. param)
        TriggerClientEvent('chatMessage', -1, '^7[^4Announcement^7]^5', {0,0,0}, param)
else
       --Tämä laukaisee tapahtuman joka on rekisteröity pelaajaan
        TriggerClientEvent("no-perms", source)
    end
end)