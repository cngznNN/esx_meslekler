--[[
  _____                 _                                  _   
 |  __ \               | |                                | |  
 | |  | | _____   _____| | ___  _ __  _ __ ___   ___ _ __ | |_ 
 | |  | |/ _ \ \ / / _ \ |/ _ \| '_ \| '_ ` _ \ / _ \ '_ \| __|
 | |__| |  __/\ V /  __/ | (_) | |_) | | | | | |  __/ | | | |_ 
 |_____/ \___| \_/ \___|_|\___/| .__/|_| |_| |_|\___|_| |_|\__|
                               | |                             
                               |_|                             
    _  _                                _   _ _   _            
  _| || |_                             | \ | | \ | |           
 |_  __  _|   ___ _ __   __ _ _____ __ |  \| |  \| |           
  _| || |_   / __| '_ \ / _` |_  / '_ \| . ` | . ` |           
 |_  __  _| | (__| | | | (_| |/ /| | | | |\  | |\  |           
   |_||_|    \___|_| |_|\__, /___|_| |_|_| \_|_| \_|           
                         __/ |                                 
                        |___/                                  
    _  _      ____        ______                               
  _| || |_   / __ \      |___  /                               
 |_  __  _| | |  | | __ _   / / _ __                           
  _| || |_  | |  | |/ _` | / / | '_ \                          
 |_  __  _| | |__| | (_| |/ /__| | | |                         
   |_||_|    \____/ \__, /_____|_| |_|                         
                     __/ |                                     
                    |___/                                                                                                                                                                                   
  ]]--

fx_version 'cerulean'

game 'gta5'

description 'Navy Fivem System'

author 'Cengizhan Uludogan'

version '1.0.0'

client_scripts {
    '@es_extended/locale.lua',
	'locales/en.lua',
	'locales/tr.lua',
	'config.lua',
	'client/main.lua',
	'client/builder.lua',
	'client/trashmaster.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua', 
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/tr.lua',
	'config.lua',
	'server/main.lua'
}

