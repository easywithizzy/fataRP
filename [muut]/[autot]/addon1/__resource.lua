resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

 dependencies {
} 

 files {
  'data/carcols.meta',
  'data/carvariations.meta',
  'data/clip_sets.xml',
  'data/handling.meta',
  'data/names.lua',
  'data/vehiclelayouts.meta',
  'data/vehiclelayouts_rrocket.meta',
  'data/vehiclelayouts_s80.meta',
  'data/vehicles.meta',
}

data_file 'CARCOLS_FILE' 'data/carcols.meta'
data_file 'CLIP_SETS_FILE' 'data/clip_sets.xml'
data_file 'HANDLING_FILE' 'data/handling.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'data/vehiclelayouts.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'data/vehiclelayouts_rrocket.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'data/vehiclelayouts_s80.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'

client_script 'data/names.lua'

