Config                            = {}
Config.DrawDistance               = 10.0
Config.MarkerType                 = 22
Config.MarkerSize                 = { x = 1.8, y = 1.8, z = 1.6 }
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
Config.ubStations = {

	ub = {
    
	
    AuthorizedWeapons = {
     { name = 'WEAPON_DAGGER',    price = 15000 }
	  
    },
		
     AuthorizedVehicles = {
      { name = 'rumpo3',       label = 'Rumpo' },

	  },
	
    Cloakrooms = {
      --{ x = 2444.27, y = 4966.23, z = 46.81 },
    },

    Armories = {
      { x = -1153.91, y = -1520.04, z = 10.63 },
    },
	-- Auto
    Vehicles = {
      {
        Spawner    = { x = -1150.82, y = -1519.4, z = 4.36 },
        SpawnPoint = { x = -1160.01, y = -1512.92, z = 4.31},
        Heading    = 310.89,
      }
    },
	
	
    VehicleDeleters = {
      { x -1149.92, y = -1532.53, z = 4.25 },
    },
	-- POMOVALIKKO
    BossActions = {
      { x = -1156.69, y = -1517.17, z = 10.63 }
    },

  },

}
