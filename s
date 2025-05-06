loadstring(game:HttpGet("https://raw.githubusercontent.com/iarotcod/slappybattling/refs/heads/main/funny%20slapple"))()

wait(0.5)

while true do
    local serverList = {}
    local servers = game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100")).data
    
    for i = 1, #servers do
        local v = servers[i]
        if v.playing and type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
            table.insert(serverList, v.id)
        end
    end
    
    if #serverList > 0 then
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, serverList[math.random(1,#serverList)])
    end
    
    wait(0.1)
end
