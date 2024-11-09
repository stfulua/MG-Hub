loadstring(game:HttpGet("https://raw.githubusercontent.com/stfulua/MG-Hub/refs/heads/main/games.lua"))()

for PlaceID, Execute in pairs(Games) do
    if PlaceID == game.PlaceId then
        print("Executing script for PlaceID: " .. PlaceID)
        loadstring(game:HttpGet(Execute))()
        break
    end
end
