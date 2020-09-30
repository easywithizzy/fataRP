------ MADE BY AMMAR B.------
-- MODIED BY xFatalityh#8920 to Revive All Players! Usefull when a modder visits your server
-----------------------------

RegisterNetEvent("DeathScript:Revive")
AddEventHandler("DeathScript:Revive", function( adrev, admin, all)
	local ped = PlayerPedId()
	if adrev then ReviveAllowed = true end
	if all then
		revivePed( ped )
		resetTimers()
		ShowNotification("~g~Kaikki Kansalaiset elvytettiin!")
		return;
	end
end)