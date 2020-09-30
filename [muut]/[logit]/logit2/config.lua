Config              = {}
Config.Locale 		= 'en'
Config.green 		= 56108
Config.grey 		= 8421504
Config.red 			= 16711680
Config.orange 		= 16744192
Config.blue 		= 2061822
Config.purple 		= 11750815
Config.webhook      = "https://discordapp.com/api/webhooks/745693410395947139/-JmZHawSxYPDnR470f3AcOxtpaODn_zvOAapMuOiq5fHMj__-qsyqzMcfQ_ZD9v-isTV" -- System / Chat
Config.webhook1     = "https://discordapp.com/api/webhooks/745694111620923495/4xQ705-ATE-W3m5w1z11A6DbfXVQBiWfFp9OyE9WyQH44cFrTkIr2IhujjiH7hotGTj6" -- Itemi / Aseet / Ryöstö
Config.webhook2     = "https://discordapp.com/api/webhooks/745693966866841651/3n9VUxiQYEkz1PPmUAWGK-yBVv1aHGn8fLYtUzz-njDTyOPmwhA27jVdcmee8YCaLmCc" -- Laskut
Config.webhook3		= "https://discordapp.com/api/webhooks/745694443348426905/jRm8BPEYKwwMxpy4KAVsGPh5ctf0asJ4VBOxL8VaiqmhULTsx_Q9wjZG5SD5djAY7bQS" -- Kaappi logit
Config.webhook4		= "https://discordapp.com/api/webhooks/733225808298115074/O934PZ79UfDTlP4Ibp0s7eU0uxNZ1t7i-KmCyd_UdxsuTaECmvi5ztOwYcnMkvOnRRe_" -- Tuunaus logit
Config.webhook5     = "https://discordapp.com/api/webhooks/745694560021119108/EDT803zJBmCnYz2I4OyTqU3in3dQZv1reORqjoIBIZ6eIDclQ9wnpvOCbXk-qFEQ0gz4" -- Rahat: (Pankki / Käteinen)
Config.webhook6     = "https://discordapp.com/api/webhooks/745694221893238827/RcDGdB_yxmqBU1x7wtbKnEl9KL1DecZbYyCZjlFtp0Belz9u00s3jbyqXCLy5iSQ0s5C" -- Asunto (Kaappi logit)
Config.webhook7     = "https://discordapp.com/api/webhooks/745693410395947139/-JmZHawSxYPDnR470f3AcOxtpaODn_zvOAapMuOiq5fHMj__-qsyqzMcfQ_ZD9v-isTV" -- Chat
Config.webhook8     = "https://discordapp.com/api/webhooks/745693860050501753/yNgi5-WnNwOTunbE5we26L6DsJy9qjCMH1DiybRc_KiqZYAgUbGgRfwcJl8PWqE5wtWk" -- Anticheat
Config.webhook9     = "https://discordapp.com/api/webhooks/745694221893238827/RcDGdB_yxmqBU1x7wtbKnEl9KL1DecZbYyCZjlFtp0Belz9u00s3jbyqXCLy5iSQ0s5C" -- esx_property
Config.webhook10     = "https://discordapp.com/api/webhooks/745694724421058702/tdE1wjzzmY71SiA8tD2jeO5nsNNDlIBemgCDxslo5p0ASMFTkRFIZC2lGuzOa8ATDfrh" -- esx_trunk
Config.webhook11 = "https://discordapp.com/api/webhooks/741437682705760286/sbZtqb2L0zslbYOrWTYzXssoq8cdvUykHeQUHZF76az2tLIs2VBHKtGn4HrtdlA0rYPS" -- itemmyynti
Config.webhook12 = "https://discordapp.com/api/webhooks/742039171329163319/QTQ9h7GNmV53-rnnuSUU-wkWwcRG6wZ1DWPfjOGJna0h-cnpWO3BhBN97aWsDHhhT1XD"
settings = {
	LogKills = false, -- Log when a player kill an other player.
	LogEnterPoliceVehicle = false, -- Log when an player enter in a police vehicle.
	LogEnterBlackListedVehicle = true, -- Log when a player enter in a blacklisted vehicle.
	LogPedJacking = true, -- Log when a player is jacking a car
	LogChatServer = true, -- Log when a player is talking in the chat , /command works too.
	LogLoginServer = true, -- Log when a player is connecting/disconnecting to the server.
	LogItemTransfer = true, -- Log when a player is giving an item.
	LogWeaponTransfer = true, -- Log when a player is giving a weapon.
	LogMoneyTransfer = true, -- Log when a player is giving money
	LogMoneybank:transferTransfert = true, -- Log when a player is giving money from bank:transferaccount
	LogChatOoc = false, -- /ooc Chat logs
	LogChatTwt = false, -- /tweet Chat logs
	LogChatMe = true, -- /me Chat logs

}

blacklistedModels = {
	"FREIGHT",
	"FREIGHTCAR",
	"FREIGHTCONT1",
	"FREIGHTCONT2",
	"FREIGHTGRAIN",
	"SCRAMJET",
	"OPPRESSOR2",
	"MENACER",
	"RHINO",
	"LAZER",
    "TITAN",
    "CARGOPLANE",
    "HYDRA",
    "CARGOBOB2",
    "CARGOBOB3",
    "CARGOBOB4",
    "VALKYRIE2",
    "SAVAGE",
    "BESRA",
    "VALKYRIE",
    "ANNIHILATOR",
    "BUZZARD",
    "SKYLIFT",
    "JET",
    'ADMIN',
    'ADMIN2',
    'VOLATOL',
    'KHANJALI',
    'AVENGER',
    'AVENGER2',
    'CHERNOBOG',
    'AKULA',
    'VIGILANTE',
    'NOKATO',
    'BOMBUSHKA',
    'HUNTER',
    'ROGUE',
    'MOLOTOK',
    'STARLING',
    'ALPHAZ1',
    'HALFTRACK',
    'TRAILERSMALL2',
    'TAMPA3',
    'DUNE3',
    'INSURGENT3',
    'TECHNICAL3',
    'TRAILERLARGE',
    'NIGHTSHARK',
    'TECHNICAL2',
    'WASTELANDER',
    'PHANTOM2',
	'BOXVILLE5',
	'BARRAGE',
	'CARACARA',
	'STRIKEFORCE',
	'BRUISER',
	'BRUISER2',
	'BRUISER3',
	'CERBERUS',
	'CERBERUS2',
	'CERBERUS3',
    'DUNE5',
	'RUINER2',
    'DUNE4',
	'OPPRESSOR',
	'DOMINATOR4',
	'DOMINATOR5',
	'DOMINATOR6',
	'HAULER2',
	'PYRO',
	'MOGUL',
	'NOKOTA',
	'TERBYTE',
	'TULA',
	'DUSTER',
	'RUINER3',
	'blazer5',
	"FIRETRUK",
	"jet",
	"deluxo",
	"apc",
	"KHANJALI",
}
