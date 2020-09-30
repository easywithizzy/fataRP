-- Menu configuration, array of menus to display
menuConfigs = {
    ['emotes'] = {                                  -- Example menu for emotes when player is on foot
    enableMenu = function()                     -- Function to enable/disable menu handling
        local player = GetPlayerPed(-1)
        return IsPedOnFoot(player)
    end,
    data = {                                    -- Data that is passed to Javascript
        keybind = "4",                         -- Wheel keybind to use (case sensitive, must match entry in keybindControls table)
        style = {                               -- Wheel style settings
            sizePx = 600,                       -- Wheel size in pixels
            slices = {                          -- Slice style settings
                default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.60 },
                hover = { ['fill'] = '#00B7FF', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.80 },
                selected = { ['fill'] = '#00B7FF', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.80 }
            },
            titles = {                          -- Text style settings
                default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
            },
            icons = {
                width = 64,
                height = 64
            }
        },
        wheels = {                              -- Array of wheels to display
            {
                navAngle = 270,                 -- Oritentation of wheel
                minRadiusPercent = 0.3,         -- Minimum radius of wheel in percentage
                maxRadiusPercent = 0.6,         -- Maximum radius of wheel in percentage
                labels = {"Ei", "Taputa"},
                commands = {"e no", "e cheer"}
            },
            {
                navAngle = 285,                 -- Oritentation of wheel
                minRadiusPercent = 0.6,         -- Minimum radius of wheel in percentage
                maxRadiusPercent = 0.9,         -- Maximum radius of wheel in percentage
                labels = {"Keski sormi", "POLIISI", "KÄDET PUUSKAAN"},
                commands = {"e finger", "e cop", "e crossarms"}
            }
        }
    }
},
    ['vehicles'] = {                                -- Example menu for vehicle controls when player is in a vehicle
        enableMenu = function()                     -- Function to enable/disable menu handling
            local player = GetPlayerPed(-1)
            return IsPedInAnyVehicle(player, false)
        end,
        data = {                                    -- Data that is passed to Javascript
            keybind = "1",                         -- Wheel keybind to use (case sensitive, must match entry in keybindControls table)
            style = {                               -- Wheel style settings
                sizePx = 400,                       -- Wheel size in pixels
                slices = {                          -- Slice style settings
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#00B7FF', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#00B7FF', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 }
                },
                titles = {                          -- Text style settings
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {                              -- Array of wheels to display
                {
                    navAngle = 270,                 -- Oritentation of wheel
                    minRadiusPercent = 0.4,         -- Minimum radius of wheel in percentage
                    maxRadiusPercent = 0.9,         -- Maximum radius of wheel in percentage
                    labels = {"imgsrc:engine.png", "imgsrc:doors.png", "imgsrc:trunk.png", "imgsrc:hood.png", "imgsrc:rollw.png", "imgsrc:vaihda.png"},
                    commands = {"engine", "rdoors", "trunk", "hood", "rollw", "vaihda"}
                }
            }
        }
    }
}
