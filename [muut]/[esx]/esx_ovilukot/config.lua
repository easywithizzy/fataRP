Config = {}
Config.Locale = 'en'

Config.DoorList = {

	--
	-- Mission Row First Floor
	--

	-- Entrance Doors
	{
		textCoords = vector3(434.7, -982.0, 31.5),
		authorizedJobs = {'police', 'offpolice'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_ph_door01'), objHeading = 270.0, objCoords = vector3(434.7, -980.6, 30.8)},
			{objHash = GetHashKey('v_ilev_ph_door002'), objHeading = 270.0, objCoords = vector3(434.7, -983.2, 30.8)}
		}
	},

	-- To locker room & roof
	{
		objHash = GetHashKey('v_ilev_ph_gendoor004'),
		objHeading = 90.0,
		objCoords = vector3(449.6, -986.4, 30.6),
		textCoords = vector3(450.1, -986.3, 31.7),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	-- Rooftop
	{
		objHash = GetHashKey('v_ilev_gtdoor02'),
		objHeading = 90.0,
		objCoords = vector3(464.3, -984.6, 43.8),
		textCoords = vector3(464.3, -984.0, 44.8),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	-- Hallway to roof
	{
		objHash = GetHashKey('v_ilev_arm_secdoor'),
		objHeading = 90.0,
		objCoords = vector3(461.2, -985.3, 30.8),
		textCoords = vector3(461.5, -986.0, 31.5),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	-- Armory
	{
		objHash = GetHashKey('v_ilev_arm_secdoor'),
		objHeading = 270.0,
		objCoords = vector3(452.6, -982.7, 30.6),
		textCoords = vector3(453.0, -982.6, 31.7),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	-- Captain Office
	{
		objHash = GetHashKey('v_ilev_ph_gendoor002'),
		objHeading = 180.0,
		objCoords = vector3(447.2, -980.6, 30.6),
		textCoords = vector3(447.2, -980.0, 31.7),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	-- To downstairs (double doors)
	{
		textCoords = vector3(444.6, -989.4, 31.7),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = GetHashKey('v_ilev_ph_gendoor005'), objHeading = 180.0, objCoords = vector3(443.9, -989.0, 30.6)},
			{objHash = GetHashKey('v_ilev_ph_gendoor005'), objHeading = 0.0, objCoords = vector3(445.3, -988.7, 30.6)}
		}
	},

	--
	-- Mission Row Cells
	--

	-- Main Cells
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 0.0,
		objCoords = vector3(463.8, -992.6, 24.9),
		textCoords = vector3(463.3, -992.6, 25.1),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	-- Cell 1
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 270.0,
		objCoords = vector3(462.3, -993.6, 24.9),
		textCoords = vector3(461.8, -993.3, 25.0),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	-- Cell 2
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 90.0,
		objCoords = vector3(462.3, -998.1, 24.9),
		textCoords = vector3(461.8, -998.8, 25.0),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	-- Cell 3
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 90.0,
		objCoords = vector3(462.7, -1001.9, 24.9),
		textCoords = vector3(461.8, -1002.4, 25.0),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	--	Lisäputka 4
	{				
		objHash = GetHashKey('v_ilev_gtdoor'),
		objHeading = 0.0,
		objCoords  = vector3(467.939, -996.548, 24.915),
		textCoords = vector3(467.939, -996.548, 24.915),
		authorizedJobs = {'police'}, 'offpolice',
		locked = true,
		maxDistance = 2.5,

	},

	--	Lisäputka 5
	{				
		objHash = GetHashKey('v_ilev_gtdoor'),
		objHeading = 0.0,
		objCoords  = vector3(472.255,-996.507,24.915),
		textCoords = vector3(472.255,-996.507,24.915),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 2.5,

	},

	--	Lisäputka 6
	{				
		objHash = GetHashKey('v_ilev_gtdoor'),
		objHeading = 0.0,
		objCoords  = vector3(476.475,-996.652,24.915),
		textCoords = vector3(476.475,-996.652,24.915),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 2.5,

	},

	--	Lisäputka 7
	{				
		objHash = GetHashKey('v_ilev_gtdoor'),
		objHeading = 0.0,
		objCoords  = vector3(480.707,-996.66,24.915),
		textCoords = vector3(480.707,-996.66,24.915),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 2.5,

	},

	{
        textCoords = vector3(445.8, -998.38, 30.68),
        authorizedJobs = { 'police', 'offpolice', },
        locked = true,
        maxDistance = 4,
        doors = {
			{objHash = GetHashKey('v_ilev_gtdoor'), objHeading = 0.0, objCoords = vector3(445.1, -998.4, 30.68)},
			{objHash = GetHashKey('v_ilev_gtdoor'), objHeading = 180.0, objCoords = vector3(446.6, -998.4, 30.68)}
        }
    },

	-- Tuplaovet pukuhuoneessa
	{
		textCoords = vector3(460.851,-990.957,30.69),
		authorizedJobs = {'police', 'offpolice'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_ph_gendoor006'), objHeading = 270.0, objCoords = vector3(460.868,-991.408,30.69)},
			{objHash = GetHashKey('v_ilev_ph_gendoor006'), objHeading = 90.0, objCoords = vector3(460.893,-990.182,30.69)}
		}
	},


	-- To Back
	{
		objHash = GetHashKey('v_ilev_gtdoor'),
		objHeading = 0.0,
		objCoords = vector3(463.4, -1003.5, 25.0),
		textCoords = vector3(464.0, -1003.5, 25.5),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 1.25
	},

	--
	-- Mission Row Back
	--

	-- Back (double doors)
	{
		textCoords = vector3(468.6, -1014.4, 27.1),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = GetHashKey('v_ilev_rc_door2'), objHeading = 0.0, objCoords  = vector3(467.3, -1014.4, 26.5)},
			{objHash = GetHashKey('v_ilev_rc_door2'), objHeading = 180.0, objCoords  = vector3(469.9, -1014.4, 26.5)}
		}
	},

	-- Back Gate
	{
		objHash = GetHashKey('hei_prop_station_gate'),
		objHeading = 90.0,
		objCoords = vector3(488.8, -1017.2, 27.1),
		textCoords = vector3(488.8, -1020.2, 30.0),
		authorizedJobs = {'police', 'offpolice'},
		locked = true,
		maxDistance = 14,
		size = 2
	},

	--
	-- Sandy Shores
	--

	-- Entrance
	{
		objHash = GetHashKey('v_ilev_shrfdoor'),
		objHeading = 30.0,
		objCoords = vector3(1855.1, 3683.5, 34.2),
		textCoords = vector3(1855.1, 3683.5, 35.0),
		authorizedJobs = {'sheriff', 'offsheriff'},
		locked = false,
		maxDistance = 1.25
	},

	-- PUTKAT
	{			
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = -60.0,
		objCoords  = vector3(1847.762,3682.071,34.203),
		textCoords = vector3(1847.762,3682.071,34.203),
		authorizedJobs = {'sheriff', 'offsheriff'},
		locked = true,
		maxDistance = 2.0,
		size = 1

	},	
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = -60.0,
		objCoords  = vector3(1846.021,3684.971,34.203),
		textCoords = vector3(1846.021,3684.971,34.203),
		authorizedJobs = { 'sheriff', 'offsheriff'},
		locked = true,
		maxDistance = 2.0,
		size = 1
		},
		
	{		
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 120.0,
		objCoords  = vector3(1844.344, 3687.924, 34.203),
		textCoords = vector3(1844.344, 3687.924, 34.203),
		authorizedJobs = {'sheriff', 'offsheriff'},
		locked = true,
		maxDistance = 2.0,
		size = 1
		},

	--
	-- Paleto Bay
	--

	-- Entrance (double doors)
	{
		textCoords = vector3(-443.5, 6016.3, 32.0),
		authorizedJobs = {'police', 'offpolice'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_shrf2door'), objHeading = 315.0, objCoords  = vector3(-443.1, 6015.6, 31.7)},
			{objHash = GetHashKey('v_ilev_shrf2door'), objHeading = 135.0, objCoords  = vector3(-443.9, 6016.6, 31.7)}
		}
	},

		-- PALETO takaovet
	{			
		objHash = GetHashKey('v_ilev_gc_door01'),
		objHeading = -45.0,
		objCoords  = vector3(-451.587,6006.569,31.84),
		textCoords = vector3(-451.587,6006.569,31.84),
		authorizedJobs = { 'police', 'offpolice'},
		locked = true,
		maxDistance = 2.0,
		size = 1

	},
   {			
		objHash = GetHashKey('v_ilev_gc_door01'),
		objHeading = -225.0,
		objCoords  = vector3(-446.755,6001.725,31.716),
		textCoords = vector3(-446.755,6001.725,31.716),
		authorizedJobs = { 'police', 'offpolice'},
		locked = true,
		maxDistance = 2.0,
		size = 1

	},
			
	--PALETO PUTKAT

	{			
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = -45.0,
		objCoords  = vector3(-428.517, 5997.228, 31.716),
		textCoords = vector3(-428.517, 5997.228, 31.716),
		authorizedJobs = { 'police', 'offpolice'},
		locked = true,
		maxDistance = 2.5,
		size = 1
	},	
	{			
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = -45.0,
		objCoords  = vector3(-431.695,6000.149,31.716),
		textCoords = vector3(-431.695,6000.149,31.716),
		authorizedJobs = { 'police', 'offpolice'},
		locked = true,
		maxDistance = 2.5,
		size = 1

	},

	--
	-- Bolingbroke Penitentiary
	--

	-- Entrance (Two big gates)
	{
		objHash = GetHashKey('prop_gate_prison_01'),
		objCoords = vector3(1844.9, 2604.8, 44.6),
		textCoords = vector3(1844.9, 2608.5, 48.0),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 15,
		size = 2
	},

	{
		objHash = GetHashKey('prop_gate_prison_01'),
		objCoords = vector3(1818.5, 2604.8, 44.6),
		textCoords = vector3(1818.5, 2608.4, 48.0),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 15,
		size = 2
	},

	-- VIOLENTS TILAT

	{
		textCoords = vector3(-816.1068, 178.51, 72.82),
		authorizedJobs = {'families'},
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_mm_doorm_l'), objCoords  = vector3(-816.716, 179.09, 72.82)},
			{objHash = GetHashKey('v_ilev_mm_doorm_r'), objCoords  = vector3(-816.1068, 177.51, 72.82)}
		}
	},

	{
		textCoords = vector3(-796.56, 177.22, 73.04),
		authorizedJobs = {'families'},
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('prop_bh1_48_backdoor_l'), objCoords  = vector3(-796.56, 177.22, 73.04)},
			{objHash = GetHashKey('prop_bh1_48_backdoor_r'), objCoords  = vector3(-794.50, 178.01, 73.04)}
		}
	},

	{
		textCoords = vector3(-794.18, 182.56, 73.04),
		authorizedJobs = {'families'},
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('prop_bh1_48_backdoor_l'), objCoords  = vector3(-793.39, 180.50, 73.04)},
			{objHash = GetHashKey('prop_bh1_48_backdoor_r'), objCoords  = vector3(-794.18, 182.56, 73.04)}
		}
	},

	{
		objHash = GetHashKey('v_ilev_mm_door'),
		objCoords = vector3(-806.28, 186.02, 72.62),
		textCoords = vector3(-806.28, 186.02, 72.62),
		authorizedJobs = {'families'},
		locked = true,
		maxDistance = 2.5,
		size = 1
	},
	
	--Paivakoti

	{
		objHash = GetHashKey('v_ilev_lester_doorfront'),
		objCoords = vector3(1273.815, -1720.697, 54.9214),
		textCoords = vector3(1274.515, -1720.297, 55.284),
		authorizedJobs = {'oranssit'},
		locked = true,
		maxDistance = 2.5,
		size = 1
	},


}