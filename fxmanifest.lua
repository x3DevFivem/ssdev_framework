fx_version "cerulean"
game "gta5"

author 'SSDev Studio Developers'
description 'SSDev Framework - A shared resource for all SSDev projects to use to prevent duplicate code across resources'
version '1.0.0'

lua54 'yes'

shared_script "shared/logger.lua"

client_scripts {
    "shared/loader.lua",
    "client/client.lua",
    "client/frameworks/*.lua",
    "shared/frameworks/*.lua",
    "client/end.lua"
}

server_scripts {
    "shared/loader.lua",
    "server/server.lua",
    "server/frameworks/*.lua",
    "shared/frameworks/*.lua",
    "server/end.lua"
}