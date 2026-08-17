--========================================================--
--                   UGUZHUB V3 - LOAD
--========================================================--
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

pcall(function()
    WindUI:SetTheme("Midnight")
end)

WindUI:SetFont("rbxasset://fonts/families/FredokaOne.json")

-- Crash Server Function
function CrashServer()
    local e = game:GetService("ReplicatedStorage").GetSyncData
    local InvokeServer = e.InvokeServer
    local spawn = task.spawn
    local a = 0;
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Server IS COOKED",
        Text = "Look how ppl freezing mid air lmao",
        Duration = 5
    })
    while 1 do
        for i = 1, 1 do
            spawn(InvokeServer, e)
        end
        a = a + 1
        if a == 3 then
            a = 0
            task.wait(0)
        end
    end
end

-- Official Intro Popup Setup
local Confirmed = false;
WindUI:Popup({
    Title = "UguzHub V3",
    Icon = "shield-alert",
    Desc = "NOTICE FOR USERS:\nThis script is intended strictly for entertainment purposes. Please ensure that all security permissions within your executor settings are disabled. We are dedicated to providing you with an enhanced user experience.\n\n----------------------------------------\n\nKULLANICI BİLGİLENDİRMESİ:\nBu script yalnızca eğlence amaçlı hazırlanmıştır. Lütfen executor ayarlarınızdaki tüm güvenlik izinlerini kapattığınızdan emin olunuz. Sizlere daha gelişmiş bir deneyim sunmak adına titizlikle çalışıyoruz.",
    Color = Color3.fromRGB(120, 60, 90),
    AnimDuration = 0.7,
    Buttons = {
        {
            Title = "Exit",
            Callback = function() end,
            Variant = "Tertiary"
        },
        {
            Title = "Continue",
            Callback = function()
                Confirmed = true;
            end,
            Variant = "Secondary"
        }
    }
});

repeat task.wait(); until Confirmed 

-- Window Setup
local Window = WindUI:CreateWindow({
    Title = "UguzHub V3",
    Author = "Summer Event Update :)",
    Folder = "uguzhub_v3",
    NewElements = true,
    HideSearchBar = false,
    OpenButton = {
        Title = "Open!",
        CornerRadius = UDim.new(0, 10),
        StrokeThickness = 12,
        Enabled = true,
        Draggable = true,
        OnlyMobile = false,
        Scale = 1.2,
        Position = UDim2.new(0, 20, 1, -70),
        Color = ColorSequence.new(Color3.fromRGB(255, 105, 180), Color3.fromRGB(180, 0, 255))
    },
    Topbar = { Height = 44, ButtonsType = "Mac", TagOffset = 56 },
})

Window:SetToggleKey(Enum.KeyCode.RightShift)
local AuraTag = Window:Tag({ Title = "UguzHub", Icon = "shield", Color = Color3.fromRGB(90, 25, 55), Border = true })

-- Sections & Tabs
local Sections = {
    HomeSection = Window:Section({ Title = "Home", Opened = true }),
    AutofarmSection = Window:Section({ Title = "Autofarm", Opened = true }),
    DetectionSection = Window:Section({ Title = "Detection", Opened = true }),
    CombatSection = Window:Section({ Title = "Combat", Opened = true }),
    EspSection = Window:Section({ Title = "ESP", Opened = true }),
    NewGodlies = Window:Section({ Title = "Event", Opened = true }),
    RoundManagement = Window:Section({ Title = "Round Management", Opened = true }),
    Halloween = Window:Section({ Title = "Items", Opened = true }),
    AppearanceSection = Window:Section({ Title = "Appearance", Opened = true }),
    Credits = Window:Section({ Title = "Credits", Opened = true }),
}

local Tabs = {
    HomeTab = Sections.HomeSection:Tab({ Title = "Welcome", Icon = "home", Desc = "Get started with UguzHub V3", IconColor = Color3.fromHex("#FF1493") }),
    FastestAutofarmTab = Sections.AutofarmSection:Tab({ Title = "Autofarm", Icon = "zap", Desc = "Collect coins automatically", IconColor = Color3.fromHex("#FF69B4") }),
    AntiAFKTab = Sections.AutofarmSection:Tab({ Title = "AFK", Icon = "clock", Desc = "Stay active", IconColor = Color3.fromHex("#FF1493") }),
    CoinDetectionTab = Sections.DetectionSection:Tab({ Title = "Coin Detection", Icon = "coins", Desc = "Track coins & auto-reset", IconColor = Color3.fromHex("#FFB6C1") }),
    CombatTab = Sections.CombatSection:Tab({ Title = "Combat", Icon = "crosshair", Desc = "Aimbot & Combat tools", IconColor = Color3.fromHex("#DC143C") }),
    EspTab = Sections.EspSection:Tab({ Title = "ESP", Icon = "eye", Desc = "ESP settings", IconColor = Color3.fromHex("#FF69B4") }),
    EndRoundTab = Sections.RoundManagement:Tab({ Title = "End Round", Icon = "refresh-cw", Desc = "Fling controls", IconColor = Color3.fromHex("#E91E63") }),
    Spawner = Sections.NewGodlies:Tab({ Title = "Item Spawner", Icon = "refresh-cw", Desc = "Spawn weapons", IconColor = Color3.fromHex("#FF1493") }),
    CoinDuper = Sections.NewGodlies:Tab({ Title = "Coin Duper", Icon = "refresh-cw", Desc = "Duplicate coins", IconColor = Color3.fromHex("#FF69B4") }),
    ServerCrasher = Sections.RoundManagement:Tab({ Title = "Crash Server", Icon = "refresh-cw", Desc = "Crash server", IconColor = Color3.fromHex("#DC143C") }),
    BeachballsTab = Sections.Halloween:Tab({ Title = "Event Items", Icon = "gift", Desc = "Event coin dupe", IconColor = Color3.fromHex("#FF69B4") }),
    ThemesTab = Sections.AppearanceSection:Tab({ Title = "Themes", Icon = "palette", Desc = "Switch UI theme", IconColor = Color3.fromHex("#E91E63") }),
    DevelopersTab = Sections.Credits:Tab({ Title = "Developers", Icon = "info", Desc = "Credits", IconColor = Color3.fromHex("#FFC0CB") })
}

Tabs.HomeTab:Paragraph({ Title = "Welcome to UguzHub V3!", Desc = "Premium & Optimized script edition." })

do
    local ThemeSection = Tabs.ThemesTab:Section({ Title = "UI Theme", Box = true, Opened = true })
    ThemeSection:Dropdown({
        Title = "Select Theme",
        Values = { "Rose", "Dark", "Light", "Midnight", "Crimson", "Violet", "Sky", "Emerald", "Rainbow" },
        Default = "Midnight",
        Callback = function(theme)
            WindUI:SetTheme(theme)
            WindUI:Notify({ Title = "Theme", Content = "Switched to " .. theme, Duration = 2 })
        end
    })
end

Tabs.DevelopersTab:Paragraph({ Title = 'UguzHub Developer', Desc = 'Enjoy UguzHub V3!' })

-- MiniFling Function
local function miniFling(Targets)
    local Players = game:GetService("Players")
    local AllBool = false

    local GetPlayer = function(Name)
        Name = Name:lower()
        if Name == "all" or Name == "others" then AllBool = true; return end
        if Name == "random" then
            local pList = Players:GetPlayers()
            table.remove(pList, table.find(pList, Players.LocalPlayer))
            return pList[math.random(#pList)]
        end
        for _,x in next, Players:GetPlayers() do
            if x ~= Players.LocalPlayer and (x.Name:lower():match("^"..Name) or x.DisplayName:lower():match("^"..Name)) then
                return x
            end
        end
    end

    local SkidFling = function(TargetPlayer)
        local Character = Players.LocalPlayer.Character
        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
        local RootPart = Humanoid and Humanoid.RootPart
        local TCharacter = TargetPlayer.Character
        if not TCharacter then return end
        local THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
        local TRootPart = THumanoid and THumanoid.RootPart

        if Character and Humanoid and RootPart and TRootPart then
            getgenv().OldPos = RootPart.CFrame
            game.Workspace.FallenPartsDestroyHeight = 0/0

            local BV = Instance.new("BodyVelocity", RootPart)
            BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
            BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)

            local Time = tick()
            repeat
                RootPart.CFrame = TRootPart.CFrame * CFrame.new(0, 1.5, 0)
                RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
                task.wait()
            until TRootPart.Velocity.Magnitude > 500 or not TargetPlayer.Character or THumanoid.Health <= 0 or tick() > Time + 2

            BV:Destroy()
            RootPart.CFrame = getgenv().OldPos
            game.Workspace.FallenPartsDestroyHeight = -500
        end
    end

    if Targets[1] then for _,x in next, Targets do GetPlayer(x) end end
    if AllBool then
        for _,x in next, Players:GetPlayers() do SkidFling(x) end
    else
        for _,x in next, Targets do
            local tp = GetPlayer(x)
            if tp and tp ~= Players.LocalPlayer then SkidFling(tp) end
        end
    end
end

-- MM2 Role Functions
local roles, Murder, Sheriff, Hero = {}, nil, nil, nil
local function UpdateRoles()
    local success, result = pcall(function()
        return game:GetService("ReplicatedStorage"):FindFirstChild("GetPlayerData", true):InvokeServer()
    end)
    if success and result then
        roles = result
        Murder, Sheriff, Hero = nil, nil, nil
        for name, data in pairs(roles) do
            if data.Role == "Murderer" then Murder = name
            elseif data.Role == "Sheriff" then Sheriff = name
            elseif data.Role == "Hero" then Hero = name end
        end
    end
end

local function getMurderer()
    UpdateRoles()
    return Murder and game:GetService("Players"):FindFirstChild(Murder) or nil
end

-- ESP System
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local ESPSettings = {
    Enabled = false, BoxESP = false, OutlineESP = false, ShowName = false, ShowDistance = false,
    HighlightMurderer = false, HighlightSheriff = false, HighlightInnocent = false,
    GunDropESP = false, NotifyGunDrop = true, AutoGrabGun = false
}

local ESPObjects = {}
local function setupESPForPlayer(player)
    if player == LocalPlayer or ESPObjects[player] then return end
    local box = Instance.new("SelectionBox", workspace) box.Visible = false
    local hl = Instance.new("Highlight", workspace) hl.Enabled = false
    local bb = Instance.new("BillboardGui", workspace) bb.Size = UDim2.new(0, 200, 0, 40) bb.AlwaysOnTop = true bb.Enabled = false
    local txt = Instance.new("TextLabel", bb) txt.Size = UDim2.new(1,0,1,0) txt.BackgroundTransparency = 1 txt.TextColor3 = Color3.new(1,1,1)

    ESPObjects[player] = { Box = box, HL = hl, BB = bb, TXT = txt }
end

for _, p in ipairs(Players:GetPlayers()) do setupESPForPlayer(p) end
Players.PlayerAdded:Connect(setupESPForPlayer)
Players.PlayerRemoving:Connect(function(p)
    if ESPObjects[p] then
        for _, v in pairs(ESPObjects[p]) do v:Destroy() end
        ESPObjects[p] = nil
    end
end)

RunService.RenderStepped:Connect(function()
    pcall(UpdateRoles)
    for player, obj in pairs(ESPObjects) do
        local char = player.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChildOfClass("Humanoid")

        if ESPSettings.Enabled and hum and hum.Health > 0 and hrp then
            local col = Color3.fromRGB(0, 255, 0)
            if ESPSettings.HighlightMurderer and player.Name == Murder then col = Color3.fromRGB(255, 0, 0)
            elseif ESPSettings.HighlightSheriff and (player.Name == Sheriff or player.Name == Hero) then col = Color3.fromRGB(0, 0, 255) end

            obj.Box.Color3 = col obj.HL.OutlineColor = col obj.TXT.TextColor3 = col
            obj.Box.Visible = ESPSettings.BoxESP obj.Box.Adornee = char
            obj.HL.Enabled = ESPSettings.OutlineESP obj.HL.Adornee = char
            obj.BB.Enabled = ESPSettings.ShowName or ESPSettings.ShowDistance obj.BB.Adornee = hrp

            local txt = ""
            if ESPSettings.ShowName then txt = player.Name end
            if ESPSettings.ShowDistance then txt = txt .. string.format(" [%d]", math.floor((Camera.CFrame.Position - hrp.Position).Magnitude)) end
            obj.TXT.Text = txt
        else
            obj.Box.Visible = false obj.HL.Enabled = false obj.BB.Enabled = false
        end
    end
end)

-- Gun Drop System
local function GrabNearestGun()
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end
    for _, desc in ipairs(workspace:GetDescendants()) do
        if desc.Name == "GunDrop" or desc.Name == "DroppedGun" then
            local pos = desc:IsA("BasePart") and desc.Position or desc:GetPivot().Position
            local oldCF = hrp.CFrame
            hrp.CFrame = CFrame.new(pos)
            task.wait(0.2)
            local prompt = desc:FindFirstChildOfClass("ProximityPrompt")
            if prompt then fireproximityprompt(prompt) end
            hrp.CFrame = oldCF
            return true
        end
    end
    return false
end

-- Aimbot System
local UserInputService = game:GetService("UserInputService")
local Aimbot = {
    Settings = { Enabled = false, AutoPrediction = true, ManualPrediction = 0.15, PredictionScale = 0.55, LockPart = "HumanoidRootPart" },
    Locked = nil
}

local aimbotRunning = false
local function getPredictionTime()
    if Aimbot.Settings.AutoPrediction then
        local ping = LocalPlayer:GetNetworkPing() or 0.05
        return math.clamp(ping * Aimbot.Settings.PredictionScale, 0.05, 0.35)
    end
    return Aimbot.Settings.ManualPrediction
end

RunService.RenderStepped:Connect(function()
    if aimbotRunning and Aimbot.Settings.Enabled then
        if not Aimbot.Locked or not Aimbot.Locked.Character or not Aimbot.Locked.Character:FindFirstChildOfClass("Humanoid") or Aimbot.Locked.Character.Humanoid.Health <= 0 then
            Aimbot.Locked = nil
            local mPlayer = getMurderer()
            if mPlayer and mPlayer ~= LocalPlayer then Aimbot.Locked = mPlayer end
        end

        if Aimbot.Locked and Aimbot.Locked.Character and Aimbot.Locked.Character:FindFirstChild(Aimbot.Settings.LockPart) then
            local part = Aimbot.Locked.Character[Aimbot.Settings.LockPart]
            local pred = part.Position + part.Velocity * getPredictionTime()
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, pred)
        end
    end
end)

-- Combat Functions
local silentAimEnabled = false
local function ShootMurderer()
    local char = LocalPlayer.Character
    local mPlayer = getMurderer()
    if not char or not mPlayer or not mPlayer.Character then return end

    local gun = char:FindFirstChild("Gun") or LocalPlayer.Backpack:FindFirstChild("Gun")
    if gun then gun.Parent = char end

    local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Shoot", true)
    local targetPart = mPlayer.Character:FindFirstChild("HumanoidRootPart")
    if remote and targetPart then
        local hitPos = targetPart.Position
        if silentAimEnabled then hitPos = hitPos + targetPart.Velocity * getPredictionTime() end
        remote:FireServer(Camera.CFrame, CFrame.new(hitPos))
    end
end

-- UI Controls Construction
-- Autofarm
local fastestAutofarmEnabled = false
local fastestAutofarmSpeed = 25
Tabs.FastestAutofarmTab:Toggle({
    Title = "Enable Autofarm",
    Default = false,
    Callback = function(state)
        fastestAutofarmEnabled = state
        if state then
            task.spawn(function()
                while fastestAutofarmEnabled do
                    local char = LocalPlayer.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        for _, obj in ipairs(workspace:GetDescendants()) do
                            if obj.Name == "CoinVisual" and obj.Parent and not obj:GetAttribute("Collected") then
                                local targetPos = obj.Parent.Position
                                while fastestAutofarmEnabled and obj.Parent and not obj:GetAttribute("Collected") do
                                    char:PivotTo(CFrame.new(targetPos))
                                    task.wait(0.1)
                                end
                            end
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

Tabs.FastestAutofarmTab:Slider({
    Title = "Autofarm Speed", Value = { Min = 1, Max = 30, Default = 25 },
    Callback = function(val) fastestAutofarmSpeed = val end
})

-- Anti AFK
Tabs.AntiAFKTab:Button({
    Title = "Enable Anti AFK",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn"))()
        WindUI:Notify({ Title = "AFK", Desc = "Anti-AFK activated!", Duration = 2 })
    end
})

-- Combat Base Controls
Tabs.CombatTab:Toggle({ Title = "Enable Camlock (Press E)", Default = false, Callback = function(s) Aimbot.Settings.Enabled = s end })
Tabs.CombatTab:Toggle({ Title = "Silent Aim", Default = false, Callback = function(s) silentAimEnabled = s end })
Tabs.CombatTab:Button({ Title = "Shoot Murderer Now", Callback = ShootMurderer })

---------------------------------------------------------
-- COMBAT TAB EKRAN BUTONLARI KONTROL BÖLÜMÜ
---------------------------------------------------------
Tabs.CombatTab:Section({ Title = "Screen Buttons Control" })

local ScreenButtons = {
    KillAll = false,
    ShootMurder = false,
    LockMurder = false,
    LockSheriff = false
}

local function UpdateButtonUI(btn, label, state)
    if btn then
        btn:SetTitle(label .. (state and " - Active" or " - Inactive"))
    end
end

local KillAllBtn, ShootMurderBtn, LockMurderBtn, LockSheriffBtn

KillAllBtn = Tabs.CombatTab:Button({
    Title = "Kill All - Inactive",
    Callback = function()
        ScreenButtons.KillAll = not ScreenButtons.KillAll
        UpdateButtonUI(KillAllBtn, "Kill All", ScreenButtons.KillAll)
        if _G.MainScreenUI and _G.MainScreenUI:FindFirstChild("KillAllUI") then
            _G.MainScreenUI.KillAllUI.BackgroundColor3 = ScreenButtons.KillAll and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(231, 76, 60)
        end
        if ScreenButtons.KillAll then miniFling({"all"}) end
    end
})

ShootMurderBtn = Tabs.CombatTab:Button({
    Title = "Shoot Murder - Inactive",
    Callback = function()
        ScreenButtons.ShootMurder = not ScreenButtons.ShootMurder
        UpdateButtonUI(ShootMurderBtn, "Shoot Murder", ScreenButtons.ShootMurder)
        if _G.MainScreenUI and _G.MainScreenUI:FindFirstChild("ShootMurderUI") then
            _G.MainScreenUI.ShootMurderUI.BackgroundColor3 = ScreenButtons.ShootMurder and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(231, 76, 60)
        end
        if ScreenButtons.ShootMurder then ShootMurderer() end
    end
})

LockMurderBtn = Tabs.CombatTab:Button({
    Title = "Lock Murder - Inactive",
    Callback = function()
        ScreenButtons.LockMurder = not ScreenButtons.LockMurder
        UpdateButtonUI(LockMurderBtn, "Lock Murder", ScreenButtons.LockMurder)
        if _G.MainScreenUI and _G.MainScreenUI:FindFirstChild("LockMurderUI") then
            _G.MainScreenUI.LockMurderUI.BackgroundColor3 = ScreenButtons.LockMurder and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(231, 76, 60)
        end
        aimbotRunning = ScreenButtons.LockMurder
        Aimbot.Settings.Enabled = ScreenButtons.LockMurder
        if ScreenButtons.LockMurder then
            local m = getMurderer()
            if m then Aimbot.Locked = m end
        else
            Aimbot.Locked = nil
        end
    end
})

LockSheriffBtn = Tabs.CombatTab:Button({
    Title = "Lock Sheriff - Inactive",
    Callback = function()
        ScreenButtons.LockSheriff = not ScreenButtons.LockSheriff
        UpdateButtonUI(LockSheriffBtn, "Lock Sheriff", ScreenButtons.LockSheriff)
        if _G.MainScreenUI and _G.MainScreenUI:FindFirstChild("LockSheriffUI") then
            _G.MainScreenUI.LockSheriffUI.BackgroundColor3 = ScreenButtons.LockSheriff and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(231, 76, 60)
        end
        aimbotRunning = ScreenButtons.LockSheriff
        Aimbot.Settings.Enabled = ScreenButtons.LockSheriff
        if ScreenButtons.LockSheriff then
            UpdateRoles()
            if Sheriff then Aimbot.Locked = game:GetService("Players"):FindFirstChild(Sheriff) end
        else
            Aimbot.Locked = nil
        end
    end
})

-- ESP
Tabs.EspTab:Toggle({ Title = "Enable ESP", Default = false, Callback = function(s) ESPSettings.Enabled = s end })
Tabs.EspTab:Toggle({ Title = "Box ESP", Default = false, Callback = function(s) ESPSettings.BoxESP = s end })
Tabs.EspTab:Toggle({ Title = "Highlight Murderer", Default = false, Callback = function(s) ESPSettings.HighlightMurderer = s end })
Tabs.EspTab:Toggle({ Title = "Highlight Sheriff/Hero", Default = false, Callback = function(s) ESPSettings.HighlightSheriff = s end })
Tabs.EspTab:Button({ Title = "Grab Gun Now", Callback = GrabNearestGun })

-- Server Crasher
Tabs.ServerCrasher:Button({ Title = "Crash Server", Callback = function() CrashServer() end })

-- Item Spawner
Tabs.Spawner:Button({
    Title = "Open Item Spawner",
    Callback = function() loadstring(game:HttpGet("https://pastefy.app/6s9N6uHP/raw"))() end
})

-- Duper
local function dupeCoins(multiplier)
    pcall(function()
        local EventFrames = LocalPlayer.PlayerGui.CrossPlatform.Christmas2025.Container.EventFrames
        local val = tonumber(EventFrames.BattlePass.Info.Tokens.Container.TextLabel.Text) * multiplier
        EventFrames.BattlePass.Info.Tokens.Container.TextLabel.Text = tostring(val)
        EventFrames.MysteryBox.Info.Tokens.Container.TextLabel.Text = tostring(val)
    end)
end

Tabs.CoinDuper:Button({ Title = "Dupe Event Coins (x2)", Callback = function() dupeCoins(2) end })

-- End Round / Fling
local selectedPlayer = nil
Tabs.EndRoundTab:Dropdown({
    Title = "Select Player",
    Values = (function()
        local t = {}
        for _, p in ipairs(Players:GetPlayers()) do if p ~= LocalPlayer then table.insert(t, p.Name) end end
        return t
    end)(),
    Callback = function(v) selectedPlayer = v end
})
Tabs.EndRoundTab:Button({ Title = "Fling Selected", Callback = function() if selectedPlayer then miniFling({selectedPlayer}) end end })
Tabs.EndRoundTab:Button({ Title = "Fling All", Callback = function() miniFling({"all"}) end })

-- Coin Detection Auto Reset
local coinCount = 0
local coinDetectionEnabled = false
Tabs.CoinDetectionTab:Toggle({
    Title = "Enable Coin Auto-Reset (40 Coins)",
    Default = false,
    Callback = function(state) coinDetectionEnabled = state end
})

pcall(function()
    game:GetService("ReplicatedStorage").Remotes.Gameplay.CoinCollected.OnClientEvent:Connect(function()
        if coinDetectionEnabled then
            coinCount = coinCount + 1
            if coinCount >= 40 then
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    LocalPlayer.Character.Humanoid.Health = 0
                end
                coinCount = 0
            end
        end
    end)
    game:GetService("ReplicatedStorage").Remotes.Gameplay.RoundStart.OnClientEvent:Connect(function() coinCount = 0 end)
end)

---------------------------------------------------------
-- EKRANDAKİ BOYUTLANDIRILABİLİR KARE BUTONLAR
---------------------------------------------------------
local CoreGui = game:GetService("CoreGui")
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UguzHub_OverlayUI"
ScreenGui.Parent = CoreGui
_G.MainScreenUI = ScreenGui

local function CreateResizableSquareButton(name, text, iconEmoji, position, onClickCallback)
    local frame = Instance.new("Frame")
    frame.Name = name .. "UI"
    frame.Size = UDim2.new(0, 90, 0, 90)
    frame.Position = position
    frame.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
    frame.BorderSizePixel = 0
    frame.Active = true
    frame.Draggable = true
    frame.Parent = ScreenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = frame

    local icon = Instance.new("TextLabel")
    icon.Size = UDim2.new(1, 0, 0.45, 0)
    icon.Position = UDim2.new(0, 0, 0.08, 0)
    icon.BackgroundTransparency = 1
    icon.Text = iconEmoji
    icon.TextSize = 26
    icon.Parent = frame

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -6, 0.35, 0)
    label.Position = UDim2.new(0, 3, 0.55, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    label.Font = Enum.Font.SourceSansBold
    label.Parent = frame

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    btn.Parent = frame

    -- Sağ Alt Köşe Boyutlandırma (Resizer Düğmesi)
    local resizer = Instance.new("TextButton")
    resizer.Name = "Resizer"
    resizer.Size = UDim2.new(0, 18, 0, 18)
    resizer.Position = UDim2.new(1, -18, 1, -18)
    resizer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    resizer.BackgroundTransparency = 0.3
    resizer.Text = "⇲"
    resizer.TextColor3 = Color3.fromRGB(255, 255, 255)
    resizer.TextSize = 12
    resizer.ZIndex = 5
    resizer.Parent = frame

    local resizerCorner = Instance.new("UICorner")
    resizerCorner.CornerRadius = UDim.new(0, 6)
    resizerCorner.Parent = resizer

    -- Boyutlandırma Mantığı (Drag Resizing)
    local resizing = false
    local startPos, startSize

    resizer.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            resizing = true
            frame.Draggable = false
            startPos = input.Position
            startSize = frame.Size
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    resizing = false
                    frame.Draggable = true
                end
            end)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if resizing and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - startPos
            local newWidth = math.max(60, startSize.X.Offset + delta.X)
            local newHeight = math.max(60, startSize.Y.Offset + delta.Y)
            frame.Size = UDim2.new(0, newWidth, 0, newHeight)
            icon.TextSize = math.clamp(newHeight * 0.3, 14, 40)
        end
    end)

    local state = false
    btn.MouseButton1Click:Connect(function()
        if resizing then return end
        state = not state
        frame.BackgroundColor3 = state and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(231, 76, 60)
        onClickCallback(state)
    end)
end

-- Ekran Butonları
CreateResizableSquareButton("LockMurder", "Aimbot Murderer", "🎯", UDim2.new(0.05, 0, 0.35, 0), function(state)
    ScreenButtons.LockMurder = state
    UpdateButtonUI(LockMurderBtn, "Lock Murder", state)
    aimbotRunning = state
    Aimbot.Settings.Enabled = state
    if state then
        local m = getMurderer()
        if m then Aimbot.Locked = m end
    else
        Aimbot.Locked = nil
    end
end)

CreateResizableSquareButton("LockSheriff", "Aimbot Sheriff", "🎯", UDim2.new(0.05, 105, 0.35, 0), function(state)
    ScreenButtons.LockSheriff = state
    UpdateButtonUI(LockSheriffBtn, "Lock Sheriff", state)
    aimbotRunning = state
    Aimbot.Settings.Enabled = state
    if state then
        UpdateRoles()
        if Sheriff then Aimbot.Locked = game:GetService("Players"):FindFirstChild(Sheriff) end
    else
        Aimbot.Locked = nil
    end
end)

CreateResizableSquareButton("KillAll", "Kill All", "🔪", UDim2.new(0.05, 210, 0.35, 0), function(state)
    ScreenButtons.KillAll = state
    UpdateButtonUI(KillAllBtn, "Kill All", state)
    if state then miniFling({"all"}) end
end)

CreateResizableSquareButton("ShootMurder", "Shoot Murder", "🔫", UDim2.new(0.05, 315, 0.35, 0), function(state)
    ScreenButtons.ShootMurder = state
    UpdateButtonUI(ShootMurderBtn, "Shoot Murder", state)
    if state then ShootMurderer() end
end)
