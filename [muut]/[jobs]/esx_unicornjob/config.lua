Config = {}
Config.DrawDistance = 100.0

Config.EnablePlayerManagement = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement = true
Config.EnableHelicopters = false
Config.EnableMoneyWash = false
Config.MaxInService = -1
Config.Locale = 'en'

Config.MissCraft = 10 -- %

Config.AuthorizedVehicles = {
    { name = 'PBUS2',  label = 'Festival Bussi' },
    { name = 'dubsta2',  label = 'Työsuhde auto' },
    { name = 'burrito3',  label = 'Pakettiauto' },
    { name = 'cliffhanger',  label = 'Työsuhde moottoripyörä' },
	{ name = 'taco',  label = 'Foodtruck' },
}

Config.Blips = {
    
    Blip = {
      Pos     = { x = 1982.53, y = 3053.27, z = 46.22 },
      Sprite  = 93,
      Display = 4,
      Scale   = 0.75,
      Colour  = 26,
    },

}

Config.Zones = {

    Cloakrooms = {
        Pos   = { x = 1995.84, y = 3048.04, z = 46.22 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 0, g = 183, b = 255 },
        Type  = 27,
    },

    Vaults = {
        Pos   = { x = 1994.75, y = 3046.28, z = 46.22  },
        Size  = { x = 1.3, y = 1.3, z = 1.0 },
        Color = { r = 0, g = 183, b = 255 },
        Type  = 23,
    },

    Fridge = {
        Pos   = { x = 1982.53, y = 3053.27, z = 46.22 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 0, g = 183, b = 255 },
        Type  = 23,
    },

    Vehicles = {
        Pos          = { x = 1996.65, y = 3038.72, z = 46.03 },
        SpawnPoint   = { x = 1989.87, y = 3032.9, z = 46.06 },
        Size         = { x = 1.8, y = 1.8, z = 1.0 },
        Color        = { r = 0, g = 183, b = 255 },
        Type         = 23,
        Heading      = 60.92,
    },

    VehicleDeleters = {
        Pos   = { x = 1971.84, y = 3030.6, z = 46.06 },
        Size  = { x = 3.0, y = 3.0, z = 0.2 },
        Color = { r = 255, g = 0, b = 0 },
        Type  = 1,
    },

--[[
    Helicopters = {
        Pos          = { x = 137.177, y = -1278.757, z = 28.371 },
        SpawnPoint   = { x = 138.436, y = -1263.095, z = 28.626 },
        Size         = { x = 1.8, y = 1.8, z = 1.0 },
        Color        = { r = 255, g = 255, b = 0 },
        Type         = 23,
        Heading      = 207.43,
    },

    HelicopterDeleters = {
        Pos   = { x = 133.203, y = -1265.573, z = 28.396 },
        Size  = { x = 3.0, y = 3.0, z = 0.2 },
        Color = { r = 255, g = 255, b = 0 },
        Type  = 1,
    },
]]--

    BossActions = {
        Pos   = { x = 1984.54, y = 3054.9, z = 46.22 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 0, g = 183, b = 255 },
        Type  = 1,
    },

-----------------------
-------- SHOPS --------
    Flacons = {
        Pos   = { x = 1984.27, y = 3049.56, z = 46.22 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 0, g = 183, b = 255 },
        Type  = 23,
        Items = {
            { name = 'vodka',      label = _U('vodka'),   price = 4 },
            { name = 'beer',       label = _U('Kalja'),    price = 2 },
            { name = 'drpepper',     label = _U('drpepper'),  price = 7 },
            { name = 'makkara',     label = _U('makkara'),  price = 7 },
            { name = 'lonkero',     label = _U('Lonkero'),  price = 7 },
            { name = 'viski',     label = _U('Viski'),  price = 7 },
            { name = 'rommi',     label = _U('Rommi'),  price = 7 },
            { name = 'viina',     label = _U('Viina'),  price = 7 },
            { name = 'paukku',     label = _U('Paukku'),  price = 7 },
        },
    },   
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {
  barman_outfit = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 40,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 40,
        ['pants_1'] = 28,   ['pants_2'] = 2,
        ['shoes_1'] = 38,   ['shoes_2'] = 4,
        ['chain_1'] = 118,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
        ['torso_1'] = 8,    ['torso_2'] = 2,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 5,
        ['pants_1'] = 44,   ['pants_2'] = 4,
        ['shoes_1'] = 0,    ['shoes_2'] = 0,
        ['chain_1'] = 0,    ['chain_2'] = 2
    }},
  dancer_outfit_1 = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 15,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 40,
        ['pants_1'] = 61,   ['pants_2'] = 9,
        ['shoes_1'] = 16,   ['shoes_2'] = 9,
        ['chain_1'] = 118,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
        ['torso_1'] = 22,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 4,
        ['pants_1'] = 22,   ['pants_2'] = 0,
        ['shoes_1'] = 18,   ['shoes_2'] = 0,
        ['chain_1'] = 61,   ['chain_2'] = 1
    }},
  dancer_outfit_2 = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 62,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 14,
        ['pants_1'] = 4,    ['pants_2'] = 0,
        ['shoes_1'] = 34,   ['shoes_2'] = 0,
        ['chain_1'] = 118,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
        ['torso_1'] = 22,   ['torso_2'] = 2,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 4,
        ['pants_1'] = 20,   ['pants_2'] = 2,
        ['shoes_1'] = 18,   ['shoes_2'] = 2,
        ['chain_1'] = 0,    ['chain_2'] = 0
    }},
  dancer_outfit_3 = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 15,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 4,    ['pants_2'] = 0,
        ['shoes_1'] = 34,   ['shoes_2'] = 0,
        ['chain_1'] = 118,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
        ['torso_1'] = 22,   ['torso_2'] = 1,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 19,   ['pants_2'] = 1,
        ['shoes_1'] = 19,   ['shoes_2'] = 3,
        ['chain_1'] = 0,    ['chain_2'] = 0
    }},
  dancer_outfit_4 = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 15,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 61,   ['pants_2'] = 5,
        ['shoes_1'] = 34,   ['shoes_2'] = 0,
        ['chain_1'] = 118,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
        ['torso_1'] = 82,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 63,   ['pants_2'] = 11,
        ['shoes_1'] = 41,   ['shoes_2'] = 11,
        ['chain_1'] = 0,    ['chain_2'] = 0
    }},
  dancer_outfit_5 = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 15,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 21,   ['pants_2'] = 0,
        ['shoes_1'] = 34,   ['shoes_2'] = 0,
        ['chain_1'] = 118,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
        ['torso_1'] = 15,   ['torso_2'] = 5,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 63,   ['pants_2'] = 2,
        ['shoes_1'] = 41,   ['shoes_2'] = 2,
        ['chain_1'] = 0,    ['chain_2'] = 0
    }},
  dancer_outfit_6 = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 15,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 81,   ['pants_2'] = 0,
        ['shoes_1'] = 34,   ['shoes_2'] = 0,
        ['chain_1'] = 118,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
        ['torso_1'] = 18,   ['torso_2'] = 3,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 63,   ['pants_2'] = 10,
        ['shoes_1'] = 41,   ['shoes_2'] = 10,
        ['chain_1'] = 0,    ['chain_2'] = 0
    }},
  dancer_outfit_7 = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 15,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 40,
        ['pants_1'] = 61,   ['pants_2'] = 9,
        ['shoes_1'] = 16,   ['shoes_2'] = 9,
        ['chain_1'] = 118,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
        ['torso_1'] = 111,  ['torso_2'] = 6,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 15,
        ['pants_1'] = 63,   ['pants_2'] = 6,
        ['shoes_1'] = 41,   ['shoes_2'] = 6,
        ['chain_1'] = 0,    ['chain_2'] = 0
    }}
}
