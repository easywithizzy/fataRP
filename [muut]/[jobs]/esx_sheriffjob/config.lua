Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 23
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 30 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for colleagues, requires esx_society

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
		{ name = 'weapon_bzgas',       price = 200 },
		},

		Cloakrooms = {
			{ x = -439.64, y = 5997.27, z = 30.72 },
		},

		Armories = {
			{ x = -437.73, y = 5988.98, z = 30.72 },
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
		{ name = 'weapon_bzgas',       price = 200 },
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
			{ x = 1877.35, y = 3697.21, z = 33.4 },
		},
	
		BossActions = {
			{ x = 1841.64, y = 3690.76, z = 33.3 }
		},	

	},

}

-- https://wiki.rage.mp/index.php?title=Vehicles
Config.AuthorizedVehicles = {
	Shared = {

		{
			model = 'county1',
			label = 'Partioauto 1'
		},
		{
			model = 'county2',
			label = 'Partioauto 2'
		},
		{
			model = 'county3',
			label = 'Partioauto 3'
		},
		{
			model = 'county4',
			label = 'Partioauto 4'
		},
        {			
			model = 'county5',
		    label = 'Partioauto 5'
          
		},
		{
			model = 'county6',
			label = 'Partioauto 6'
		},
		{
			model = 'county7',
			label = 'Partioauto 7'
		},
		{
			model = 'county8',
			label = 'Partioauto 8'
		},
		{
			model = 'county9',
			label = 'Partioauto 9'
		},
        {			
			model = 'county10',
		    label = 'Partioauto 10'
          
		},
		{
			model = 'county11',
			label = 'Partioauto 11'
		},
		{
			model = 'county12',
			label = 'Partioauto 12'
		},
		{
			model = 'county13',
			label = 'Partioauto 13'
		},
		{
			model = 'county14',
			label = 'Partioauto 14'
		},
        {			
			model = 'county15',
		    label = 'Partioauto 15'
          
		},
		{
			model = 'county16',
			label = 'Partioauto 16'
		},
		{
			model = 'county17',
			label = 'Partioauto 17'
		},
		{
			model = 'county18',
			label = 'Partioauto 18'
		},	
	},

	recruit = {

	},

	officer = {

	},

	sergeant = {

	},

	intendent = {

	},

	lieutenant = {

		{
			model = '2015shestang',
			label = 'Mustangi'
		},

	},

	chef = {

	},

	boss = {

		{
			model = '2015shestang',
			label = 'Mustangi'
		},

	}
}


-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recruit_wear = {
		male = {
			['tshirt_1'] = 38,  ['tshirt_2'] = 0,
			['torso_1'] = 100,   ['torso_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 105,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 33,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0
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
			['torso_1'] = 100,   ['torso_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 105,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 33,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	sergeant_wear = {
		male = {
			['tshirt_1'] = 38,  ['tshirt_2'] = 0,
			['torso_1'] = 100,   ['torso_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 105,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 33,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0
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
	intendent_wear = {
		male = {
			['tshirt_1'] = 38,  ['tshirt_2'] = 0,
			['torso_1'] = 100,   ['torso_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 105,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 33,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
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
		['torso_1'] = 99,   ['torso_2'] = 0,
		['arms'] = 1,
		['pants_1'] = 105,   ['pants_2'] = 0,
		['shoes_1'] = 25,   ['shoes_2'] = 0,
		['helmet_1'] = 33,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0
	},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	chef_wear = {
		male = {
			['tshirt_1'] = 38,  ['tshirt_2'] = 0,
			['torso_1'] = 100,   ['torso_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 105,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 33,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0
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
	boss_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 38,  ['tshirt_2'] = 0,
			['torso_1'] = 100,   ['torso_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 105,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 33,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0
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
			['bproof_1'] = 12,  ['bproof_2'] = 2
		},
		female = {
			['bproof_1'] = 4,  ['bproof_2'] = 2
		}
	},
	gilet_wear = {
		male = {
			['bproof_1'] = 18,  ['bproof_2'] = 1
		},
		female = {
			['bproof_1'] = 19,  ['bproof_2'] = 1
		}
	}

}