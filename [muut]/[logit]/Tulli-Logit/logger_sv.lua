local logs = "https://discordapp.com/api/webhooks/745685317448630372/WJQIY1Ql89jNbsqsmK6-1qLDnQ2IZRnhpmakrnCEQ5mL-tc8lGuGRPk6aBjqmucNKS_X"
local communityname = "TimanttiRP"
local communtiylogo = "https://i.imgur.com/KQeR3br.png" --Must end with .png or .jpg

AddEventHandler('playerConnecting', function()
local name = GetPlayerName(source)
local steamhex = GetPlayerIdentifier(source)
local licenses = GetPlayerIdentifiers(source)
local ip = GetPlayerEndpoint(source)
local connect = {
            {
                ["color"] = "56108",
                ["title"] = "Kansalainen liittymässä kaupunkiin",
                ["description"] = "Steam: **"..name.."**\n Hex: **"..steamhex.."**\n Lisenssi: **"..licenses[2].."**\nIP: **"..ip.."**",
	            ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = communtiylogo,
            },
        }
    }

PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "TimanttiRP", embeds = connect}), { ['Content-Type'] = 'application/json' })
end)

AddEventHandler('playerDropped', function(reason)
local name = GetPlayerName(source)
local steamhex = GetPlayerIdentifier(source)
local licenses = GetPlayerIdentifiers(source)
local ip = GetPlayerEndpoint(source)
local disconnect = {
            {
                ["color"] = "16711680",
                ["title"] = "Kansalainen poistui kaupungista",
                ["description"] = "Steam: **"..name.."**\nID: **"..source.."**\n Hex: **"..steamhex.."**\n Lisenssi: **"..licenses[2].."**\nIP: **"..ip.."**",
	            ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = communtiylogo,
            },
        }
    }

    PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "Tietoa kansalaisesta", embeds = disconnect}), { ['Content-Type'] = 'application/json' })
end)
