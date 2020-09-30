Config                      = {}
Config.Locale               = 'fi'

Config.Accounts             = { 'bank:transfer', 'black_money' }
Config.AccountLabels        = { bank:transfer = _U('bank:transfer'), black_money = _U('black_money') }

Config.EnableSocietyPayouts = false -- pay from the society account that the player is employed at? Requirement: esx_society
Config.DisableWantedLevel   = true
Config.EnableHud            = false -- enable the default hud? Display current job and accounts (black, bank:transfer & cash)

Config.PaycheckInterval     = 10 * 60000

Config.EnableDebug          = false
