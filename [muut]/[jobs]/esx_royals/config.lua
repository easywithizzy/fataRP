Config                            = {}
Config.DrawDistance               = 10.0
Config.MarkerType                 = 23
Config.MarkerSize                 = { x = 2.5, y = 2.5, z = 1.6 }
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
Config.royalsStations = {

	royals = {
    
	
    AuthorizedWeapons = {
      { name = 'WEAPON_DAGGER',            price = 15000 }
	  
    },
		
     AuthorizedVehicles = {
      { name = 'glendale',       label = 'Ferrari' },

	  },
	
    Cloakrooms = {
      --{ x = 1397.72, y = 1164.08, z = 114.33 },
    },

    Armories = {
      { x = 1399.93, y = 1139.74, z = 114.33 },
    },
	-- Auto
    Vehicles = {
      {
        Spawner    = { x = 1410.68, y = 1114.69, z = 114.83 },
        SpawnPoint = { x = 1397.7, y = 1117.22, z = 114.84 },
        Heading    = 88.85,
      }
    },
	
	
    VehicleDeleters = {
      { x = 1402.28, y = 1117.72, z = 114.84 },
    },
	-- POMOVALIKKO
    BossActions = {
      { x = 1401.8, y = 1132.28, z = 114.33 }
    },

  },

}
