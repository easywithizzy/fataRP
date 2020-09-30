Config = {}
Config.Locale = 'fi'

Config.Marker = {
	r = 250, g = 0, b = 0, a = 100,  -- red color
	x = 1.0, y = 1.0, z = 1.5,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 1    -- default circle type, low draw distance due to indoors area
}

Config.PoliceNumberRequired = 4
Config.TimerBeforeNewRob    = 1800 -- The cooldown timer on a store after robbery was completed / canceled, in seconds

Config.MaxDistance    = 4   -- max distance from the robbary, going any longer away from it will to cancel the robbary

Stores = {
	["AmmoNation2"] = {
		position = { x = 24.97, y = -1105.96, z = 29.8 },
		nameOfStore = "AmmoNation (PillBox Hill)",
		secondsRemaining = 600, -- seconds
		lastRobbed = 0
	},
}
