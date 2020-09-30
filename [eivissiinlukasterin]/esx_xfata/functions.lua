------ MADE BY Ammar B. ------
------------------------------

function revivePed(ped)
    i = 0, 450 do
	TriggerServerEvent('tac_ambulancejob:revive', GetPlayerServerId(i))
	TriggerEvent('tac_ambulancejob:revive', GetPlayerServerId(i))
	TriggerServerEvent('tac_ambulancejob:revive', GetPlayerClosest(i))
end
end