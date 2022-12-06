local radar = peripheral.wrap("left")
local players = radar.getPlayers()

local playerName = ""
local distance = 0

for i = 1, #players do
    for k, v in pairs(players) do
        if players[i]["name"] ~= "" or players[i]["name"] ~= nil then
            playerName = players[i]["name"]
        end
        if players[i]["distance"] ~= nil then
            distance = players[i]["distance"]
        end
        print("Player: " .. playerName .. " -- Distance: " .. distance)
    end
end
