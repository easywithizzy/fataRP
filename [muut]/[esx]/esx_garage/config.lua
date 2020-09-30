Config = {}
Config.Locale = 'en'

Config.KickPossibleCheaters      		= true -- If true it will kick the player that tries store a vehicle that they changed the Hash or Plate.
Config.UseCustomKickMessage      		= true -- If KickPossibleCheaters is true you can set a Custom Kick Message in the locales.

Config.UseDamageMult             		= false -- If true it costs more to store a Broken Vehicle.
Config.DamageMult                		= 1 		-- Higher Number = Higher Repair Price.

Config.CarPoundPrice      		 		= 400 -- Car Pound Price.
Config.BoatPoundPrice     		 		= 600 -- Boat Pound Price.
Config.AircraftPoundPrice 		 		= 7500 -- Aircraft Pound Price.

Config.AmbulancePoundPrice		 		= 750 -- Ambulance Pound Price.

Config.UseCarGarages        	 		= true -- Allows use of Car Garages.
Config.UseBoatGarages       	 		= false -- Allows use of Boat Garages.
Config.UseAircraftGarages   	 		= false -- Allows use of Aircraft Garages.
Config.UsePrivateCarGarages 	 		= false -- Allows use of Private Car Garages.
Config.UseJobCarGarages     	 		= false -- Allows use of Job Garages.

Config.DontShowPoundCarsInGarage 		= true -- If set to true it won't show Cars at the Pound in the Garage.
Config.ShowVehicleLocation       		= false -- If set to true it will show the Location of the Vehicle in the Pound/Garage in the Garage menu.
Config.UseVehicleNamesLua        		= true -- Must setup a vehicle_names.lua for Custom Addon Vehicles.

Config.ShowGarageSpacer1 		 		= true -- If true it shows Spacer 1 in the List.
Config.ShowGarageSpacer2 		 		= false -- If true it shows Spacer 2 in the List | Don't use if spacer3 is set to true.
Config.ShowGarageSpacer3 		 		= false -- If true it shows Spacer 3 in the List | Don't use if Spacer2 is set to true.

Config.ShowPoundSpacer2 		 		= false -- If true it shows Spacer 2 in the List | Don't use if spacer3 is set to true.
Config.ShowPoundSpacer3 		 		= true -- If true it shows Spacer 3 in the List | Don't use if Spacer2 is set to true.

Config.MarkerType						= 23
Config.SpawnerMarkerType				= 23
Config.DrawDistance 					= 50.0


Config.BlipGarage = {
	Sprite = 290,
	Color = 26,
	Display = 4,
	Scale = 0.75
}

Config.BlipPound = {
	Sprite = 473,
	Color = 26,
	Display = 4,
	Scale = 0.75
}


Config.PointMarker = {
	r = 0, g = 255, b = 0,     -- Green Color
	x = 2.5, y = 2.5, z = 1.0  -- Standard Size Circle
}

Config.DeleteMarker = {
	r = 255, g = 0, b = 0,     -- Red Color
	x = 4.5, y = 4.5, z = 1.0  -- Big Size Circle
}

Config.PoundMarker = {	
	r = 0, g = 255, b = 0,     -- Blue Color
	x = 1.5, y = 1.5, z = 1.0  -- Standard Size Circle
}

Config.JobPoundMarker = {
	r = 255, g = 0, b = 0,     -- Red Color
	x = 1.5, y = 1.5, z = 1.0  -- Standard Size Circle
}

-- Työ tallit


Config.CarGarages = {
	Garage_CentralLS = {
	    GaragePoint = { x = 215.71, y = -810.03, z = 29.83 },
	    SpawnPoint =  { x = 228.55, y = -802.84, z = 29.74, h = 160.7 },
	    DeletePoint = { x = 212.99, y = -795.83, z = 29.96 }
	},
	Garage_Sandy = {
	    GaragePoint = { x = 1737.83, y = 3709.37, z = 33.15 },
		SpawnPoint = { x = 1737.84, y = 3719.28, z = 33.04, h = 21.22 },
		DeletePoint = { x = 1722.66, y = 3713.74, z = 33.28 }
	},
	Garage_Paleto = {
		GaragePoint = { x = -87.67, y = 6494.53, z = 31.11 },
		SpawnPoint = { x = -78.06, y = 6499.85, z = 30.612, h = 227.22 },
		DeletePoint = { x = -82.19, y = 6495.65, z = 30.512 }
	},
	Garage_RaceTrack = {
		GaragePoint = { x = -68.86, y = 86.06, z = 70.70 },
		SpawnPoint = { x = -69.95, y = 83.79, z = 71.51, h = 64.56 },
		DeletePoint = { x = -65.57, y = 81.21, z = 70.70 }
	}
}

Config.CarPounds = {
	Pound_LosSantos = {
		PoundPoint = { x = -26.78, y = -1672.75, z = 28.49 },
		SpawnPoint = { x = -24.83, y = -1678.76, z = 29.46, h = 119.12 }
	},
	Pound_Sandy = {
		PoundPoint = { x = 2340.94, y = 3127.91, z = 47.41 },
		SpawnPoint = { x = 2352.0, y = 3134.6, z = 47.78, h = 80.87 }
	},
	Pound_Paleto = {
		PoundPoint = { x = -185.187, y = 6272.027, z = 30.580 },
		SpawnPoint = { x = -199.160, y = 6274.180, z = 30.580, h = 316.36 }
	}
}


