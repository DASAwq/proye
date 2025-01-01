-- __resource.lua

fx_version 'cerulean'
games { 'gta5' }

author 'Pekeee'

-- Client scripts
client_scripts {
    'config.lua',  -- Ensure config is loaded before client logic
    'client.lua'
}

-- Server scripts
server_scripts {
    '@mysql-async/lib/MySQL.lua', -- MySQL dependency
    'server.lua'
}

-- Ensure that the ESX framework is loaded
dependencies {
    'es_extended',
    'esx_jail' -- Dependency for jailing functionality
}
