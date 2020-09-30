Config                            = {}
Config.DrawDistance               = 10.0
Config.MarkerType                 = 22
Config.MarkerSize                 = { x = 1.6, y = 1.6, z = 1.6 }
Config.MarkerColor                = { r = 0, g = 128, b = 0 }


-----------------------------------------
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true 
Config.EnableNonFreemodePeds      = false
Config.EnableSocietyOwnedVehicles = true
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale = 'en'
------------------------------------------
Config.crossfireStations = {

	crossfire = {
    
	
    AuthorizedWeapons = {
     { name = 'WEAPON_DAGGER',            price = 15000 }
	  
    },
		
     AuthorizedVehicles = {
      { name = 'rumpo3',       label = 'Rumpo' },

	  },
	
    Cloakrooms = {
      --{ x = 2444.27, y = 4966.23, z = 46.81 },
    },

    Armories = {
      { x = 2440.41, y = 4974.66, z = 46.81 },
    },
	-- Auto
    Vehicles = {
      {
        Spawner    = { x = 2480.35, y = 4957.81, z = 44.98 },
        SpawnPoint = { x = 2486.38, y = 4959.32, z = 44.86 },
        Heading    = 133.42,
      }
    },
	
	
    VehicleDeleters = {
      { x = 2492.75, y = 4965.79, z = 44.67 },
    },
	-- POMOVALIKKO
    BossActions = {
      { x = 2445.43, y = 4983.46, z = 46.81 }
    },

  },

}
