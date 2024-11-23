local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

Rayfield:Notify({
   Title = "MG Hub",
   Content = "The script is in work please wait!",
   Duration = 6.5,
   Image = 4483362458,
   Actions = {

      Ignore = {
         Name = "Okay!",
         Callback = function()
            print("The user tapped Okay!")
         end
      },
},
Rayfield:Destroy()
})
