local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "YourBigHub",
   LoadingTitle = "Your Big Hub",
   LoadingSubtitle = "by You",
   Theme = "Ocean", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "abcdefg", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true,
   KeySettings = {
      Title = "Your Big Hub",
      Subtitle = "Key System",
      Note = "The key is {SpecialKey}", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"SpecialKey"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Simple Scripts", 4483362458) -- Title, Image
local TabMisc = Window:CreateTab("Misc", 4483362458) -- This is Misc page
local TabThe = Window:CreateTab("Themes", 4483362458) -- This is Themes page
local TabCre = Window:CreateTab("Credits", 4483362458) -- This is credits page

local Label15 = Tab:CreateLabel("Default keybind: {K}")

local Divider = Tab:CreateDivider()

local Button35 = TabMisc:CreateButton({
   Name = "Enable Dividers",
   Callback = function()
      Divider:Set(true)
   end,
})

local Button36 = TabMisc:CreateButton({
   Name = "Disable Dividers",
   Callback = function()
      Divider:Set(false)
   end,
})

local Button21 = TabThe:CreateButton({
   Name = "Default",
   Callback = function()
      Window.ModifyTheme('Default')
   end,
})

local Button22 = TabThe:CreateButton({
   Name = "Amber Glow",
   Callback = function()
      Window.ModifyTheme('AmberGlow')
   end,
})

local Button23 = TabThe:CreateButton({
   Name = "Amethyst",
   Callback = function()
      Window.ModifyTheme('Amethyst')
   end,
})

local Button24 = TabThe:CreateButton({
   Name = "Bloom",
   Callback = function()
      Window.ModifyTheme('Bloom')
   end,
})

local Button25 = TabThe:CreateButton({
   Name = "Dark Blue",
   Callback = function()
      Window.ModifyTheme('DarkBlue')
   end,
})

local Button26 = TabThe:CreateButton({
   Name = "Green",
   Callback = function()
      Window.ModifyTheme('Green')
   end,
})

local Button27 = TabThe:CreateButton({
   Name = "Light [FLASHBANG WARNING]",
   Callback = function()
      Window.ModifyTheme('Light')
   end,
})

local Button28 = TabThe:CreateButton({
   Name = "Ocean",
   Callback = function()
      Window.ModifyTheme('Ocean')
   end,
})

local Button29 = TabThe:CreateButton({
   Name = "Serenity",
   Callback = function()
      Window.ModifyTheme('Serenity')
   end,
})

local Button = Tab:CreateButton({
   Name = "Load IY",
   Callback = function()
	-- I willl create an script that loads IY
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/refs/heads/master/source'))()
   end,
})

local Section = Tab:CreateSection("Some Other Elements")

local Toggle = Tab:CreateToggle({
   Name = "Toggle Example",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
	if Value then
		print(Value)
		Value = true
	elseif not Value then
		print(Value)
		Value = false
	end

   -- The function that takes place when the toggle is pressed
   -- The variable (Value) is a boolean on whether the toggle is true or false
   end,
})

local Label = TabCre:CreateLabel("Credits to you")

local Button = TabMisc:CreateButton({
   Name = "Unload",
   Callback = function()
	-- This button will unload Rayfield
	Rayfield:Destroy()
   end,
})

local Section2 = Tab:CreateSection("Some elements")

local ColorPicker = Tab:CreateColorPicker({
    Name = "Color Picker",
    Color = Color3.fromRGB(255,255,255),
    Flag = "ColorPicker1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        -- The function that takes place every time the color picker is moved/changed
        -- The variable (Value) is a Color3fromRGB value based on which color is selected
    end
})

local Slider = Tab:CreateSlider({
   Name = "Change the Transparency",
   Range = {0, 100},
   Increment = 1,
   Suffix = "Transparency",
   CurrentValue = 10,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   -- The function that takes place when the slider changes
   -- The variable (Value) is a number which correlates to the value the slider is currently at
   end,
})

local Input = Tab:CreateInput({
   Name = "Chat",
   CurrentValue = "",
   PlaceholderText = "Type here...",
   RemoveTextAfterFocusLost = false,
   Flag = "BigHubInput1",
   Callback = function(Text)
      local TextChatService = game:GetService("TextChatService")

      TextChatService.TextChannels.RBXGeneral:SendAsync(Text)
   end,
})

local Dropdown = Tab:CreateDropdown({
   Name = "Single Option",
   Options = {"Option 1","Option 2", "Option 3"},
   CurrentOption = {"Option 1"},
   MultipleOptions = false,
   Flag = "YourBigHubDropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Options)
   -- The function that takes place when the selected option is changed
   -- The variable (Options) is a table of strings for the current selected options
   end,
})

local Dropdown = Tab:CreateDropdown({
   Name = "Multiple Options",
   Options = {"Option 1","Option 2", "Option 3", "Option 4"},
   CurrentOption = {"Option 1"},
   MultipleOptions = true,
   Flag = "YourBigHubDropdown2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Options)
   -- The function that takes place when the selected option is changed
   -- The variable (Options) is a table of strings for the current selected options
   end,
})

local Keybind = Tab:CreateKeybind({
   Name = "Simple Bind",
   CurrentKeybind = "H",
   HoldToInteract = false,
   Flag = "YourBigHubKeybind1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Keybind)
   	print("Simple Bind Works")
   -- The function that takes place when the keybind is pressed
   -- The variable (Keybind) is a boolean for whether the keybind is being held or not (HoldToInteract needs to be true)
   end,
})

local Label61 = Tab:CreateLabel("Simple Text Label")
local Paragraph61 = Tab:CreateParagraph({Title = "Simple Paragraph", Content = "This is an Simple Paragraph made in Rayfield UI Library, it's open sourced for everyone!"})

Rayfield:Notify({
   Title = "Your Big Hub",
   Content = "Script Loaded.",
   Duration = 6.5,
   Image = 4483362458,
   Actions = { -- Notification Buttons

      Ignore = { -- Duplicate this table (or remove it) to add and remove buttons to the notification.
         Name = "Okay!",
         Callback = function()
            print("The user tapped Okay!")
         end
      },

},
})

Rayfield:LoadConfiguration()
