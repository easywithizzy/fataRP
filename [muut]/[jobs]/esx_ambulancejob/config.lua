Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }

Config.ReviveReward               = 1000  -- revive reward, set to 0 if you don't want it enabled --
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = true -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'fi'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 10 * minute  -- Time til respawn is available
Config.BleedoutTimer              = 60 * minute -- Time til the player bleeds out

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = true

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 5000

Config.RespawnPoint = { coords = vector3(358.298, -594.598, 42.315), heading = 48.5 }

Config.Hospitaali = {
		'v_med_bed1',
		'v_med_bed2',
		'v_med_emptybed'

}

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(288.298, -594.598, 42.315),
			sprite = 61,
			scale  = 0.8,
			color  = 26
		},

		AmbulanceActions = {
			vector3(301.485, -599.228, 42.284)
		},

		Pharmacies = {
			vector3(311.97, -597.64, 42.284)
		},

		Vehicles = {
			{
				Spawner = vector3(334.019, -553.828, 28.744),
				InsideShop = vector3(446.7, -1355.6, 43.5),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 2.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(326.592, -542.712, 27.744), heading = 180.558, radius = 4.0 }
				}
			}
		},

	
		Helicopters = {
			{
				Spawner = vector3(351.443,-588.321, 73.166),
				InsideShop = vector3(305.6, -1419.7, 41.5),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 5.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(351.443,-588.321, 73.166), heading = 142.7, radius = 10.0 },
					{ coords = vector3(299.5, -1453.2, 46.5), heading = 142.7, radius = 10.0 }
				}
			}
		},

		FastTravels = {

			{
				From = vector3(343.74, -1398.85, 32.0),
				To = { coords = vector3(333.1, -1434.9, 45.5), heading = 138.6 },
				Marker = { type = -1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},

			{
				From = vector3(335.5, -1432.0, 45.50),
				To = { coords = vector3(341.74, -1398.85, 32.3), heading = 0.0 },
				Marker = { type = -1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			}

	
		},

		FastTravelsPrompt = {
			{
				From = vector3(237.4, -1373.8, 26.0),
				To = { coords = vector3(251.9, -1363.3, 38.5), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(256.5, -1357.7, 36.0),
				To = { coords = vector3(235.4, -1372.8, 26.3), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			},
		}

	}
}
--[[	PaletoMedical = {

		Blip = {
			coords = vector3(-264.117,6315.549,31.436),
			sprite = 61,
			scale  = 0.8,
			color  = 18
		},

		AmbulanceActions = {
			
		},

		Pharmacies = {
			
		},

		Vehicles = {

		},

	
		Helicopters = {

		},

		FastTravels = {
	
		},

		FastTravelsPrompt = {

		}

	}
}--]]

Config.AuthorizedVehicles = {

	ambulance = {
		{
			model = 'ambulance',
			label = 'Ambulanssi',
			price = 5000
		}
	},

	doctor = {
		{
			model = 'ambulance',
			label = 'Ambulanssi',
			price = 4500
		},
		{
			model = 'ambscout',
			label = 'Ensivasteyksikkö',
			price = 4500
		}
	},

	chief_doctor = {
		{
			model = 'ambulance',
			label = 'Ambulanssi',
			price = 3000
		},
		{
			model = 'ambscout',
			label = 'Ensivasteyksikkö',
			price = 4500
		}
	},

	boss = {
		{
			model = 'ambulance',
			label = 'Ambulanssi',
			price = 2000
		},
		{
			model = 'ambscout',
			label = 'Ensivasteyksikkö',
			price = 4500
		}
	}

}

Config.AuthorizedHelicopters = {

	ambulance = {},

	doctor = {
		{
			model = 'polmav',
			label = 'Mediheli',
			price = 10000
		}
	},

	chief_doctor = {
		{
			model = 'polmav',
			label = 'Mediheli',
			price = 10000
		}
	},

	boss = {
		{
			model = 'polmav',
			label = 'Mediheli',
			price = 10000
		}
	}

}
