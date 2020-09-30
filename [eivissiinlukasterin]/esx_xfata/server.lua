------ MADE BY AMMAR B.------
-- MODIED BY xFatalityh#8920 to Revive All Players! Usefull when a modder visits your server
-----------------------------

 RegisterCommand('reviveall', function(source, args, rawCommand)
    TriggerClientEvent('DeathScript:Revive', -1, true, source, true)
 end, true)