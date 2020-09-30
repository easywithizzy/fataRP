client_scripts {
    '@es_extended/locale.lua',
    'locales/en.lua',
    'config.lua',
    'client/cl_cuffs.lua'
}

server_scripts {
    '@es_extended/locale.lua',
    'locales/en.lua',
    'config.lua',
	'@mysql-async/lib/MySQL.lua',
    'server/sv_cuffs.lua'
}
