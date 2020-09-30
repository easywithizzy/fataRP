Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 27
Config.MarkerSize                 = { x = 1.0, y = 1.0, z = 1.0 }
Config.MarkerColor                = { r = 0, g = 183, b = 255 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- älä poista tätä - turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.EnableHandcuffTimer        = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 30 * 60000 -- 30 minuuttia

Config.EnableJobBlip              = false -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale = 'en'

Config.PoliceStations = {

SSPD = {

	Blip = {
		Pos     = { x = -446.08, y = 6013.98, z = 31.72 },
		Sprite  = 60,
		Display = 4,
		Scale   = 0.9,
		Colour  = 26,
	},

		-- https://wiki.rage.mp/index.php?title=Weapons
	AuthorizedWeapons = {
		{ name = 'WEAPON_NIGHTSTICK',       price = 300 },
		{ name = 'WEAPON_COMBATPISTOL',    price = 700 },
		{ name = 'WEAPON_SMG',              price = 1100 },
		{ name = 'WEAPON_PUMPSHOTGUN',      price = 1000 },
		{ name = 'WEAPON_STUNGUN',          price = 200 },
		{ name = 'WEAPON_FLASHLIGHT',       price = 200 },
		{ name = 'GADGET_PARACHUTE',        price = 400 },
	},

	Cloakrooms = {
		{ x = -439.64, y = 5997.27, z = 30.72 },
	},

	Armories = {
		{ x = 0, y = 0, z = 0 },
	},

	Vehicles = {
		{
			Spawner    = { x = -458.97, y = 6031.44, z = 30.84 },
			SpawnPoints = {
				{ x = -462.73, y = 6020.87, z = 31.84, heading = 310.0, radius = 6.0 },
				--{ x = 441.08, y = -1024.23, z = 28.30, heading = 90.0, radius = 6.0 },
				--{ x = 453.53, y = -1022.20, z = 28.02, heading = 90.0, radius = 6.0 },
				--{ x = 450.97, y = -1016.55, z = 28.10, heading = 90.0, radius = 6.0 }
			}
		},

		{
			Spawner    = { x = 473.38, y = -1018.43, z = 27.00 },
			SpawnPoints = {
				{ x = 475.98, y = -1021.65, z = 28.06, heading = 276.11, radius = 6.0 },
				{ x = 484.10, y = -1023.19, z = 27.57, heading = 302.54, radius = 6.0 }
			}
		}
	},

	Helicopters = {
		{
			Spawner    = { x = -467.8, y = 6002.15, z = 32.3 },
			SpawnPoint = { x = 450.04, y = -981.14, z = 42.691 },
			Heading    = 0.0
		}
	},

	VehicleDeleters = {
		{ x = -458.39, y = 6044.13, z = 30.84 },
		--{ x = 462.40, y = -1019.7, z = 27.104 },
		--{ x = 469.12, y = -1024.52, z = 27.20 }
	},

	BossActions = {
		{ x = -435.87, y = 5999.94, z = 30.72 }
	},
},

PPPD = {
	
	Blip = {
		Pos     = { x = 1855.2, y = 3683.25, z = 34.27 },
		Sprite  = 60,
		Display = 4,
		Scale   = 0.9,
		Colour  = 26,
	},


	-- https://wiki.rage.mp/index.php?title=Weapons
	AuthorizedWeapons = {
	{ name = 'WEAPON_NIGHTSTICK',       price = 300 },
	{ name = 'WEAPON_COMBATPISTOL',    price = 700 },
	{ name = 'WEAPON_SMG',              price = 1100 },
	{ name = 'WEAPON_PUMPSHOTGUN',      price = 1000 },
	{ name = 'WEAPON_STUNGUN',          price = 200 },
	{ name = 'WEAPON_FLASHLIGHT',       price = 200 },
	{ name = 'GADGET_PARACHUTE',        price = 400 },
	},


	Cloakrooms = {
		{ x = 1858.19, y = 3694.54, z = 33.40 },
	},

	Armories = {
		{ x = 1862.41, y = 3689.35, z = 33.40 },
	},

	Vehicles = {
		{
			Spawner    = { x = 1867.98, y = 3691.21, z = 32.80 },
			SpawnPoints = {
				{ x = 1869.6, y = 3693.13, z = 33.63, heading = 215.8, radius = 6.0 },
				{ x = 1858.84, y = 3711.88, z = 33.28, heading = 38.5, radius = 6.0 },
				{ x = 1865.53, y = 3680.97, z = 33.64, heading = 239.2, radius = 6.0 },
				{ x = 1866.7, y = 3661.21, z = 33.82, heading = 298, radius = 6.0 }
			}
		},


	},

	Helicopters = {
		{
			Spawner    = { x = 1872.47, y = 3660.6, z = 33.78 },
			SpawnPoint = { x = 1725.55, y = 3617.25, z = 36.95 },
			Heading    = 0.0
		}
	},

	VehicleDeleters = {
		{ x = 1877.35, y = 3697.21, z = 32.7 },
	},

	BossActions = {
		{ x = 1841.64, y = 3690.76, z = 33.3 }
	},	
},

LSPD = {

	Blip = {
		Pos     = { x = 425.130, y = -979.558, z = 30.711 },
		Sprite  = 60,
		Display = 4,
		Scale   = 0.8,
		Colour  = 26,
	},

	AuthorizedWeapons = {
		{ name = 'WEAPON_NIGHTSTICK',       price = 100 },
		{ name = 'WEAPON_COMBATPISTOL',     price = 100 },
		{ name = 'WEAPON_CARBINERIFLE',     price = 100 },
		{ name = 'WEAPON_SMG',     price = 100 },
		{ name = 'WEAPON_STUNGUN',          price = 100 },
		{ name = 'WEAPON_FLASHLIGHT',       price = 100 },
		{ name = 'GADGET_PARACHUTE',        price = 100 },
	},

	Cloakrooms = {
		{ x = 452.19995117188, y = -993.36065673828, z = 29.709310073853 },
		{ x = 450.26, y = -993.35, z = 29.709310073853 }
	},

	Armories = {
		{ x = 452.43, y = -980.14, z = 30.69 },
		{ x = 473.11, y = -990.52, z = 24.0 }
	},

	Vehicles = {
		{
			Spawner    = { x = 459.21, y = -1007.98, z = 27.28 },

			SpawnPoints = {
				{ x = 452.48, y = -996.58, z = 25.38, heading = 181.35, radius = 6.0 },
				{ x = 447.48, y = -996.42, z = 25.38, heading = 181.35, radius = 6.0 },
				{ x = 436.41, y = -996.47, z = 25.38, heading = 180.35, radius = 6.0 },
				{ x = 431.43, y = -996.48, z = 25.38, heading = 180.07, radius = 6.0 },

			}
		},

		{
			Spawner    = { x = 1854.35, y = 3701.2, z = 34.27 },
			SpawnPoints = {
				{ x = 1866.02, y = 3682.63, z = 33.69, heading = 276.11, radius = 6.0 },
				{ x = 1875.87, y = 3681.35, z = 33.54, heading = 302.54, radius = 6.0 },
				{ x = 1875.87, y = 3681.35, z = 33.54, heading = 302.54, radius = 6.0 }
			}
		}
	},

	Helicopters = {
		{
			Spawner    = { x = 466.477, y = -982.819, z = 42.691 },
			SpawnPoint = { x = 450.04, y = -981.14, z = 42.691 },
			Heading    = 0.0
		}
	},

	VehicleDeleters = {
		{ x = 462.74, y = -1014.4, z = 27.065 },
		{ x = 462.40, y = -1019.7, z = 27.104 },
		{ x = 469.12, y = -1024.52, z = 27.20 }
	},
	
	BossActions = {
		{ x = 462.37393188477, y = -1007.4981689453, z = 35.000014196777 },
		{ x = 448.16, y = -973.07, z = 29.89 }
    },

  },

}


-- https://wiki.rage.mp/index.php?title=Vehicles
Config.AuthorizedVehicles = {

	Shared = {
		{	
		    model = 'police',
			label = 'Vapid Cruiser'
		},
		{	
		    model = 'police2',
			label = 'Buffalo'
		},
		{	
		    model = 'police3',
			label = 'Interceptor'
		},
		{
			model = 'policeb',
			label = 'Moottoripyörä (Police Bike)'
		},
		{	
		    model = '2015polstang',
			label = 'Ford Mustang'
		},
		{	
		    model = 'riot',
			label = 'Rynnäkkö auto'
		},
		{	
		    model = 'fbi2',
			label = 'Sivari Maasturi'
		},
		{	
		    model = 'polaventa',
			label = 'Lamborghini'
		},
		{	
		    model = 'police4',
		    label = 'Siivili Vapid'
		}
	},

	recruit = {

	},

	officer = {
		{	
		    model = 'police2',
			label = 'Bravado Buffalo'
		}
	},

	sergeant = {
		{	
		    model = 'police2',
			label = 'Bravado Buffalo'
		},
		{
			model = 'policeb',
			label = 'Moottoripyörä (Police Bike)'
		},
		{	
		    model = 'polscout',
			label = 'Vapid Scout'
		}
	},
	
	lieutenant = {
		{	
		    model = 'police2',
			label = 'Bravado Buffalo'
		},
		{	
		    model = 'sheriff',
			label = 'Bravado Sheriff'
		},
		{	
		    model = 'sheriff2',
			label = 'Declasse Sheriff'
		},
		{	
		    model = 'polscout',
			label = 'Vapid Scout'
		},
		{
			model = 'policeb',
			label = 'Moottoripyörä (Police Bike)'
		},
		{	
		    model = 'caracarapolis',
			label = 'CaraCara Sivari'
		}

	},

	
	boss = {
		{
			model = 'policeb',
			label = 'Moottoripyörä (Police Bike)'
		},
		{
			model = 'pbus',
			label = 'Bussi'
		},
		{
			model = 'policet',
			label = 'Paku'
		},
		{	
		    model = 'police2',
			label = 'Bravado Buffalo'
		},
		{	
		    model = 'police3',
			label = 'Ford Taurus'
		},
		{	
		    model = '2015polstang',
			label = 'Ford Mustang'
		},
		{	
		    model = 'polscout',
			label = 'Vapid Scout'
		},
		{	
		    model = 'hwaybuffals',
			label = 'Bravado Buffalo Custom'
		},
		{	
		    model = 'police4',
			label = 'Vapid Cruiser Sivari'
		},
		{	
		    model = 'polschafter3',
			label = 'Schafter V12'
		},
		{	
		    model = 'umkbuffals',
			label = 'Bravado Buffalo Sivari Custom'
		},
		{	
		    model = 'umkbuffals2',
			label = 'Bravado Buffalo Sivari Custom'
		},
		{	
		    model = 'umkbuffals3',
			label = 'Bravado Buffalo Sivari Custom'
		},
		{	
		    model = 'polaventa',
			label = 'Lamborghini'
		},
		{	
		    model = 'caracarapolis',
			label = 'CaraCara Sivari'
		}
	}

}


-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recruit_wear = {
		male = {
			['tshirt_1'] = 38,  ['tshirt_2'] = 0,
			['torso_1'] = 93,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 87,   ['pants_2'] = 2,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 1,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = 45,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	officer_wear = {
		male = {
			['tshirt_1'] = 38,  ['tshirt_2'] = 0,
			['torso_1'] = 93,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 87,   ['pants_2'] = 2,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 1,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 38,  ['tshirt_2'] = 0,
			['torso_1'] = 93,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 46,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 1,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	sergeant_wear = {
		male = {
			['tshirt_1'] = 38,  ['tshirt_2'] = 0,
			['torso_1'] = 93,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 87,   ['pants_2'] = 2,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 1,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 1,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	lieutenant_wear = { -- currently the same as intendent_wear
		male = {
			['tshirt_1'] = 38,  ['tshirt_2'] = 0,
			['torso_1'] = 93,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 87,   ['pants_2'] = 2,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 1,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 38,  ['tshirt_2'] = 0,
			['torso_1'] = 93,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 46,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 1,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	boss_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 38,  ['tshirt_2'] = 0,
			['torso_1'] = 93,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 87,   ['pants_2'] = 2,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 1,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	bullet_wear = {
		male = {
			['bproof_1'] = 12,  ['bproof_2'] = 3
		},
		female = {
			['bproof_1'] = -1,  ['bproof_2'] = 0
		}
	},
	gilet_wear = {
		male = {
			['tshirt_1'] = 59,  ['tshirt_2'] = 1
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1
		}
	}

}