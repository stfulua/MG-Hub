local TabThemes = Window:CreateTab("Themes", 4483362458)

local themes = {
   {name = "Default", theme = "Default"},
   {name = "Amber Glow", theme = "AmberGlow"},
   {name = "Amethyst", theme = "Amethyst"},
   {name = "Bloom", theme = "Bloom"},
   {name = "Dark Blue", theme = "DarkBlue"},
   {name = "Green", theme = "Green"},
   {name = "Light", theme = "Light"},
   {name = "Ocean", theme = "Ocean"}
}

for _, theme in ipairs(themes) do
   TabThemes:CreateButton({
      Name = theme.name .. math.random(1, 100),
      Callback = function()
         print(theme.name .. " Theme")
         wait(0.25)
         Window.ModifyTheme(theme.theme)
      end
   })
end
