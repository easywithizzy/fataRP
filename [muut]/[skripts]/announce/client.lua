--Komento announce jonka on yhdistettävä taulukko "args" cb palauttaa taulukon
RegisterCommand("announce", function(source, args)
    TriggerServerEvent("announce", table.concat(args, " "))
end)

--Tämä oikeuttaa vain järjestelmänvalvojien käyttää tätä komentoa
RegisterNetEvent("no-perms")
AddEventHandler("no-perms", function()
    TriggerEvent("chatMessage", "[Käyttö estetty]", {0,255,0}, "Sinulla ei ole käyttöoikeuksia tähän komentoon" )
end)