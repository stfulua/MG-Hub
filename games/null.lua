local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

Rayfield:Notify({
   Title = "MG Hub",
   Content = "Game Not Supported!",
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
Rayfield:Destroy()
})
