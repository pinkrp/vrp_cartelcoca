resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_scripts {
	"@vrp/lib/utils.lua",
    'c/client.lua',
}
server_scripts {
	"@vrp/lib/utils.lua",
    'server.lua',
}

ui_page('c/html/index.html')

files {
    'c/html/index.html',
    'c/html/style.css',
    'c/html/ui.js',
    'c/html/img/*'
}
