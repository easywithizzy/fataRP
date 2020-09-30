Config = {}

Config.Locale = 'en'

--Options

Config.EnableMapsBlimps = false -- Enables the blips on the map.
Config.GiveBlack = true -- give black money? if disabled it'll give regular cash.
Config.ChemicalsLicenseEnabled = false --Will Enable or Disable the need for a Chemicals License.
Config.MoneyWashLicenseEnabled = false --Will Enable or Disable the need for a MoneyWash License.
Config.RestrictLicenseShopAcces = false --Will Restrict the access to the license shop to players with a specific job and grade.
Config.RequireCopsOnline = false --Will require that cops are online to pickup or process.
Config.EnableCopCheckMessage = true --Will enable a message in the console when the server refreshes the current cop count.

--The time the server will wait until checking the current cop count again (in Minutes).
Config.CopsCheckRefreshTime = 30

--The time it takes to process one item
Config.Delays = {
	WeedProcessing = 1000 * 1,
	CokeProcessing = 1000 * 1,
	HeroinProcessing = 1000 * 1,
}


--The amount of cops that need to be online to harvest/process these drugs.
--Only needed when RequireCopsOnline is set to true
Config.Cops = {
	Heroin = 4,
	Weed = 4,
	Coke = 4,
}

--Drug Zones
Config.CircleZones = {
	--Weed
	WeedField = {coords = vector3(-1653.74, 5047.43, 38.05), blimpcoords = vector3(2224.64, 5577.03, 53.85), name = _U('blip_weedfield'), color = 25, sprite = 496, radius = 0, enabled = true},
	WeedProcessing = {coords = vector3(1035.86, -3205.20, -38.17), blimpcoords = vector3(-1127.86, 2708.03, 18.8), name = _U('blip_weedprocessing'), color = 25, sprite = 496, radius = 0.0, enabled = true},
	
	--Coke
	CokeField = {coords = vector3(2941.39, 797.18, 25.61), blimpcoords = vector3(-310.43, 2496.34, 76.60), name = _U('blip_CokeFarm'), color = 4, sprite = 501, radius = 0.0, enabled = true},
	CokeProcessing = {coords = vector3(1095.67, -3197.74, -38.99), blimpcoords = vector3(1095.67, -3197.74, -38.99), name = _U('blip_CokeFarm'), color = 4, sprite = 501, radius = 0.0, enabled = true},

	--Heroin
	HeroinField = {coords = vector3(2819.77, -635.41, 2.32), blimpcoords = vector3(16.34, 6875.94, 12.64), name = _U('blip_heroinfield'), color = 7, sprite = 497, radius = 0, enabled = true},
	HeroinProcessing = {coords = vector3(1012.37, -3195.18, -38.99), blimpcoords = vector3(-62.15, 6391.40, 31.49), name = _U('blip_heroinprocessing'), color = 7, sprite = 497, radius = 0.0, enabled = true},


}