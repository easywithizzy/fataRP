Config = {}

-- The currency prefix to be used
Config.CurrencyPrefix = '€'

-- Enables or Disables the vehicle restriction
Config.RestrictVehicles = true

-- Distance Measurement -- valid options are "mi" or "km". "mi" is default. If you
-- change this be sure to change RateSuffix as well
Config.DistanceMeasurement = 'km'

-- Rate Suffix
Config.RateSuffix = '/KM'

-- Which vehicles can not use the meter (if RestrictVehicles= true). By default
-- Bicycles, OffRoad and Emergency vehicles are disallowed
Config.DisallowedVehicleClasses = {8, 9, 18}
