Config                            = {}
Config.DrawDistance               = 20.0
Config.MarkerType                 = 23
Config.MarkerSize                 = { x = 1.6, y = 1.6, z = 1.0 }
Config.MarkerColor                = { r = 255, g = 20, b = 147 }

-- ÄLÄ KOSKE MIHINKÄÄN NÄISTÄ CONFFEISTA
-----------------------------------------
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true 
Config.EnableNonFreemodePeds      = false
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale = 'en'
------------------------------------------
Config.familiesStations = {

	families = {
    
	-- ASEEN NIMET NETISTÄ
    AuthorizedWeapons = {
     { name = 'WEAPON_BATTLEAXE',            price = 500000 }
	  
    },
		-- LABEL = NIMI JOKA NÄKYY MENUSSA
	  AuthorizedVehicles = {
      { name = 'rumpo3',       label = 'VammaRumpo' },

	  },
	-- EI OLEELLINEN JENGEILLE JOS EI KÄYTÄ CUSTOM MODELEITA
    Cloakrooms = {
      { x = -13213217.49, y = -1439.55, z = 30.11 },
    },
	-- KAAPPI
    Armories = {
      { x = -803.43, y = 185.67, z = 71.61 },
    },
	-- AJONEUVOSPAWNERI
    Vehicles = {
      {
        Spawner    = { x = -809.38, y = 190.77, z = 71.48 },
        SpawnPoint = { x = -821.73, y = 183.52, z = 71.98 },
        Heading    = 134.26,
      }
    },
	
	-- AJONEUVON POISTO
    VehicleDeleters = {
      { x = -812.09, y = 187.23, z = 71.47 },
    },
	-- POMOVALIKKO
    BossActions = {
      { x = -799.74, y = 177.21, z = 71.83 }
    },

  },

}
