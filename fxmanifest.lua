fx_version 'cerulean'
game 'gta5'

lua54 'yes' 
 
client_scripts {
    '@ox_lib/init.lua',
    "client/*.lua"
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    "server/*.lua"
}

shared_script "config.lua"
