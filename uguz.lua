--========================================================--
--                   UGUZHUB V3 - LOAD
--========================================================--

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

------------------------------------------------------------
-- 1) ANIMASYONLU GİRİŞ EKRANI (INTRO UI)
------------------------------------------------------------
local Theme = {
    Background = Color3.fromRGB(16, 16, 22),
    Accent     = Color3.fromRGB(138, 92, 255),
    AccentSoft = Color3.fromRGB(90, 60, 180),
    Cyan       = Color3.fromRGB(60, 200, 220),
    Text       = Color3.fromRGB(235, 235, 245),
    SubText    = Color3.fromRGB(165, 165, 180),
    Stroke     = Color3.fromRGB(55, 55, 70),
}

local function create(class, props, children)
    local inst = Instance.new(class)
    for prop, value in pairs(props or {}) do
        inst[prop] = value
    end
    for _, child in ipairs(children or {}) do
        child.Parent = inst
    end
    return inst
end

local function corner(radius)
    return create("UICorner", { CornerRadius = UDim.new(0, radius or 16) })
end

local function stroke(color, thickness)
    return create("UIStroke", {
        Color = color or Theme.Stroke,
        Thickness = thickness or 1,
        Transparency = 0.4,
    })
end

local function tween(obj, props, duration, style, direction)
    local info = TweenInfo.new(
        duration or 0.3,
        style or Enum.EasingStyle.Quint,
        direction or Enum.EasingDirection.Out
    )
    local t = TweenService:Create(obj, info, props)
    t:Play()
    return t
end

local IntroScreenGui = create("ScreenGui", {
    Name = "UguzHubV3_Intro",
    ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    DisplayOrder = 999,
    IgnoreGuiInset = true,
})
IntroScreenGui.Parent = PlayerGui

local IntroFrame = create("Frame", {
    Name = "Intro",
    Size = UDim2.fromScale(1, 1),
    Position = UDim2.fromScale(0, 0),
    BorderSizePixel = 0,
    BackgroundColor3 = Theme.Background,
    BackgroundTransparency = 0,
    ZIndex = 10,
})
IntroFrame.Parent = IntroScreenGui

local IntroContent = create("Frame", {
    Name = "IntroContent",
    AnchorPoint = Vector2.new(0.5, 0),
    Position = UDim2.new(0.5, 0, 0.20, 0),
    Size = UDim2.new(0, 520, 0, 360),
    BackgroundTransparency = 1,
    ZIndex = 11,
})
IntroContent.Parent = IntroFrame

local LogoLabel = create("TextLabel", {
    Text = "UguzHub",
    Font = Enum.Font.GothamBlack,
    TextSize = 50,
    TextColor3 = Theme.Text,
    BackgroundTransparency = 1,
    Size = UDim2.new(1, 0, 0, 60),
    Position = UDim2.new(0, 0, 0, 0),
    TextTransparency = 1,
    ZIndex = 11,
})
LogoLabel.Parent = IntroContent

local ProTag = create("TextLabel", {
    Text = "V3",
    Font = Enum.Font.GothamBold,
    TextSize = 18,
    TextColor3 = Theme.Accent,
    BackgroundTransparency = 1,
    Size = UDim2.new(1, 0, 0, 22),
    Position = UDim2.new(0, 0, 0, 58),
    TextTransparency = 1,
    ZIndex = 11,
})
ProTag.Parent = IntroContent

local Underline = create("Frame", {
    Name = "Underline",
    Size = UDim2.new(0, 0, 0, 3),
    Position = UDim2.new(0.5, 0, 0, 88),
    AnchorPoint = Vector2.new(0.5, 0),
    BackgroundColor3 = Theme.Accent,
    BorderSizePixel = 0,
    ZIndex = 11,
})
corner(2).Parent = Underline
Underline.Parent = IntroContent

local LoadingLabel = create("TextLabel", {
    Text = "Loading",
    Font = Enum.Font.GothamMedium,
    TextSize = 20,
    TextColor3 = Theme.SubText,
    BackgroundTransparency = 1,
    Size = UDim2.new(1, 0, 0, 30),
    Position = UDim2.new(0, 0, 0, 112),
    TextTransparency = 1,
    ZIndex = 11,
})
LoadingLabel.Parent = IntroContent

-- RESMİ TR / EN UYARI METNİ
local DisclaimerLabel = create("TextLabel", {
    Text = "DEĞERLİ KULLANICILARIMIZIN DİKKATİNE:\nSizlere daha kaliteli, kesintisiz ve güvenli bir hizmet sunabilmek adına titizlikle çalışmaktayız. Scriptin tüm fonksiyonlarının sorunsuz çalışması için lütfen kullandığınız executor uygulamasının ayarlarından tüm güvenlik izinlerini kapattığınızdan emin olunuz.\n\n----------------------------------------\n\nNOTICE TO OUR VALUED USERS:\nWe are dedicated to providing you with a higher quality, seamless, and secure service. To ensure all script functions operate correctly, please verify that all security permissions within your executor settings are completely disabled.",
    Font = Enum.Font.GothamMedium,
    TextSize = 13,
    TextColor3 = Theme.SubText,
    BackgroundTransparency = 1,
    Size = UDim2.new(1, 0, 0, 180),
    Position = UDim2.new(0, 0, 0, 100),
    TextTransparency = 1,
    TextWrapped = true,
    Visible = false,
    ZIndex = 11,
})
DisclaimerLabel.Parent = IntroContent

local ContinueButton = create("TextButton", {
    Name = "ContinueButton",
    Text = "Continue (10)",
    Font = Enum.Font.GothamBold,
    TextSize = 17,
    TextColor3 = Theme.SubText,
    AutoButtonColor = false,
    BackgroundColor3 = Color3.fromRGB(24, 22, 34),
    BackgroundTransparency = 1,
    Size = UDim2.new(0, 220, 0, 50),
    Position = UDim2.new(0.5, 0, 0, 290),
    AnchorPoint = Vector2.new(0.5, 0),
    Active = false,
    Visible = false,
    ZIndex = 11,
})
corner(12).Parent = ContinueButton
local ContinueStroke = stroke(Theme.SubText, 1.5)
ContinueStroke.Parent = ContinueButton
ContinueButton.Parent = IntroContent

local IntroFinished = Instance.new("BindableEvent")

ContinueButton.MouseButton1Click:Connect(function()
    if not ContinueButton.Active then return end
    ContinueButton.Active = false
    IntroFinished:Fire()
end)

local function activateContinueButton()
    ContinueButton.Active = true
    ContinueButton.Text = "Continue"
    tween(ContinueButton, {
        TextColor3 = Theme.Text,
        BackgroundColor3 = Color3.fromRGB(30, 24, 48),
    }, 0.4)
    tween(ContinueStroke, { Color = Theme.Cyan, Transparency = 0 }, 0.4)

    task.spawn(function()
        while ContinueButton.Active do
            tween(ContinueStroke, { Transparency = 0.55 }, 0.9, Enum.EasingStyle.Sine)
            task.wait(0.9)
            if not ContinueButton.Active then break end
            tween(ContinueStroke, { Transparency = 0 }, 0.9, Enum.EasingStyle.Sine)
            task.wait(0.9)
        end
    end)
end

local function startCountdown()
    task.spawn(function()
        for i = 10, 1, -1 do
            ContinueButton.Text = "Continue (" .. i .. ")"
            task.wait(1)
        end
        activateContinueButton()
    end)
end

-- ANIMASYON BAŞLANGICI
task.spawn(function()
    tween(LogoLabel, { TextTransparency = 0 }, 0.6)
    tween(ProTag, { TextTransparency = 0 }, 0.6)
    task.wait(0.15)

    tween(Underline, { Size = UDim2.new(0, 220, 0, 3) }, 0.6, Enum.EasingStyle.Quart)
    task.wait(0.2)

    tween(LoadingLabel, { TextTransparency = 0 }, 0.4)

    local dotsRunning = true
    task.spawn(function()
        local states = { "Loading", "Loading.", "Loading..", "Loading..." }
        local i = 1
        while dotsRunning do
            LoadingLabel.Text = states[i]
            i = (i % #states) + 1
            task.wait(0.35)
        end
    end)

    task.wait(3.5)
    dotsRunning = false

    tween(LoadingLabel, { TextTransparency = 1 }, 0.3)
    task.wait(0.3)
    LoadingLabel.Visible = false

    tween(LogoLabel, { Position = UDim2.new(0, 0, 0, -50), TextTransparency = 1 }, 0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
    tween(ProTag, { Position = UDim2.new(0, 0, 0, 8), TextTransparency = 1 }, 0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
    tween(Underline, { Size = UDim2.new(0, 0, 0, 3), Position = UDim2.new(0.5, 0, 0, 38) }, 0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
    task.wait(0.7)

    DisclaimerLabel.Visible = true
    DisclaimerLabel.Position = UDim2.new(0, 0, 0, 110)
    DisclaimerLabel.TextTransparency = 1
    tween(DisclaimerLabel, {
        Position = UDim2.new(0, 0, 0, 90),
        TextTransparency = 0,
    }, 0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    task.wait(0.4)

    ContinueButton.Visible = true
    ContinueButton.Position = UDim2.new(0.5, 0, 0, 300)
    tween(ContinueButton, {
        Position = UDim2.new(0.5, 0, 0, 280),
        BackgroundTransparency = 0,
        TextTransparency = 0,
    }, 0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    tween(ContinueStroke, { Transparency = 0.1 }, 0.45)

    startCountdown()
end)

IntroFinished.Event:Wait()

tween(DisclaimerLabel, { TextTransparency = 1 }, 0.35)
tween(ContinueButton, { TextTransparency = 1, BackgroundTransparency = 1 }, 0.35)
tween(ContinueStroke, { Transparency = 1 }, 0.35)
task.wait(0.35)

tween(IntroFrame, { BackgroundTransparency = 1 }, 0.6, Enum.EasingStyle.Sine)
task.wait(0.6)
IntroScreenGui:Destroy()

------------------------------------------------------------
-- 2) MAIN SCRIPT & UI (WINDUI)
------------------------------------------------------------
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

pcall(function()
    WindUI:SetTheme("Midnight")
end)

WindUI:SetFont("rbxasset://fonts/families/FredokaOne.json")

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

-- SAĞ YUKARI KÜÇÜLTME/BÜYÜTME (-) BUTONU ENTEGRASYONU
task.defer(function()
    local coreUI = game:GetService("CoreGui")
    local winFrame = coreUI:FindFirstChild("WindUI", true) or coreUI:FindFirstChild("UguzHub V3", true)
    if winFrame then
        local topbar = winFrame:FindFirstChild("Topbar", true) or winFrame:FindFirstChild("Header", true)
        if topbar then
            local minimizeBtn = Instance.new("TextButton")
            minimizeBtn.Name = "MinimizeButton"
            minimizeBtn.Size = UDim2.new(0, 28, 0, 28)
            minimizeBtn.Position = UDim2.new(1, -38, 0.5, -14)
            minimizeBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
            minimizeBtn.Text = "-"
            minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            minimizeBtn.TextSize = 20
            minimizeBtn.Font = Enum.Font.GothamBold
            minimizeBtn.ZIndex = 100
            minimizeBtn.Parent = topbar

            local cornerBtn = Instance.new("UICorner")
            cornerBtn.CornerRadius = UDim.new(0, 6)
            cornerBtn.Parent = minimizeBtn

            local isMinimized = false
            local originalSize = winFrame.Size

            minimizeBtn.MouseButton1Click:Connect(function()
                isMinimized = not isMinimized
                if isMinimized then
                    originalSize = winFrame.Size
                    winFrame:TweenSize(UDim2.new(winFrame.Size.X.Scale, winFrame.Size.X.Offset, 0, 44), "Out", "Quint", 0.3, true)
                    minimizeBtn.Text = "+"
                else
                    winFrame:TweenSize(originalSize, "Out", "Quint", 0.3, true)
                    minimizeBtn.Text = "-"
                end
            end)
        end
    end
end)

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

-- MiniFling Function
local function miniFling(Targets)
    local AllBool = false
    local GetPlayer = function(Name)
        Name = Name:lower()
        if Name == "all" or Name == "others" then AllBool = true; return end
        for _,x in next, Players:GetPlayers() do
            if x ~= LocalPlayer and (x.Name:lower():match("^"..Name) or x.DisplayName:lower():match("^"..Name)) then
                return x
            end
        end
    end

    local SkidFling = function(TargetPlayer)
        local Character = LocalPlayer.Character
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
            if tp and tp ~= LocalPlayer then SkidFling(tp) end
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
    return Murder and Players:FindFirstChild(Murder) or nil
end

-- Target Lock & Shoot (Işınlanmadan)
local Camera = workspace.CurrentCamera
local Aimbot = { Settings = { Enabled = false, Prediction = 0.15, LockPart = "HumanoidRootPart" }, Locked = nil }
local aimbotRunning = false

RunService.RenderStepped:Connect(function()
    if aimbotRunning and Aimbot.Settings.Enabled then
        if Aimbot.Locked and Aimbot.Locked.Character and Aimbot.Locked.Character:FindFirstChildOfClass("Humanoid") and Aimbot.Locked.Character.Humanoid.Health > 0 then
            local part = Aimbot.Locked.Character:FindFirstChild(Aimbot.Settings.LockPart)
            if part then
                local pred = part.Position + part.Velocity * Aimbot.Settings.Prediction
                Camera.CFrame = CFrame.new(Camera.CFrame.Position, pred)
            end
        else
            Aimbot.Locked = nil
        end
    end
end)

local function ShootTarget(targetPlayer)
    local char = LocalPlayer.Character
    if not char or not targetPlayer or not targetPlayer.Character then return end

    local gun = char:FindFirstChild("Gun") or LocalPlayer.Backpack:FindFirstChild("Gun")
    if gun then gun.Parent = char end

    local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Shoot", true)
    local targetPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
    if remote and targetPart then
        local hitPos = targetPart.Position + targetPart.Velocity * Aimbot.Settings.Prediction
        remote:FireServer(Camera.CFrame, CFrame.new(hitPos))
    end
end

---------------------------------------------------------
-- COMBAT TAB EKRAN BUTONLARI
---------------------------------------------------------
Tabs.CombatTab:Section({ Title = "Screen Buttons Control" })

local ScreenButtons = { KillAll = false, ShootMurder = false, LockMurder = false, LockSheriff = false }
local KillAllBtn, ShootMurderBtn, LockMurderBtn, LockSheriffBtn

local function UpdateButtonUI(btn, label, state)
    if btn then btn:SetTitle(label .. (state and " - Active" or " - Inactive")) end
end

KillAllBtn = Tabs.CombatTab:Button({ Title = "Kill All - Inactive", Callback = function()
    ScreenButtons.KillAll = not ScreenButtons.KillAll
    UpdateButtonUI(KillAllBtn, "Kill All", ScreenButtons.KillAll)
    if ScreenButtons.KillAll then miniFling({"all"}) end
end })

ShootMurderBtn = Tabs.CombatTab:Button({ Title = "Shoot Murder - Inactive", Callback = function()
    ScreenButtons.ShootMurder = not ScreenButtons.ShootMurder
    UpdateButtonUI(ShootMurderBtn, "Shoot Murder", ScreenButtons.ShootMurder)
    if ScreenButtons.ShootMurder then ShootTarget(getMurderer()) end
end })

LockMurderBtn = Tabs.CombatTab:Button({ Title = "Lock Murder - Inactive", Callback = function()
    ScreenButtons.LockMurder = not ScreenButtons.LockMurder
    UpdateButtonUI(LockMurderBtn, "Lock Murder", ScreenButtons.LockMurder)
    aimbotRunning = ScreenButtons.LockMurder
    Aimbot.Settings.Enabled = ScreenButtons.LockMurder
    Aimbot.Locked = ScreenButtons.LockMurder and getMurderer() or nil
end })

LockSheriffBtn = Tabs.CombatTab:Button({ Title = "Lock Sheriff - Inactive", Callback = function()
    ScreenButtons.LockSheriff = not ScreenButtons.LockSheriff
    UpdateButtonUI(LockSheriffBtn, "Lock Sheriff", ScreenButtons.LockSheriff)
    aimbotRunning = ScreenButtons.LockSheriff
    Aimbot.Settings.Enabled = ScreenButtons.LockSheriff
    if ScreenButtons.LockSheriff then
        UpdateRoles()
        if Sheriff then Aimbot.Locked = Players:FindFirstChild(Sheriff) end
    else
        Aimbot.Locked = nil
    end
end })

---------------------------------------------------------
-- EKRANDAKİ SÜRÜKLENEBİLİR & BOYUTLANDIRILABİLİR BUTONLAR
---------------------------------------------------------
local CoreGui = game:GetService("CoreGui")
local OverlayScreenGui = Instance.new("ScreenGui")
OverlayScreenGui.Name = "UguzHub_OverlayUI"
OverlayScreenGui.Parent = CoreGui
_G.MainScreenUI = OverlayScreenGui

local function CreateResizableSquareButton(name, text, iconEmoji, position, onClickCallback)
    local frame = Instance.new("Frame")
    frame.Name = name .. "UI"
    frame.Size = UDim2.new(0, 90, 0, 90)
    frame.Position = position
    frame.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
    frame.BorderSizePixel = 0
    frame.Active = true
    frame.Parent = OverlayScreenGui

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

    -- Sürükleme Mantığı (Dragging)
    local dragging, dragInput, dragStart, startPos = false, nil, nil, nil

    btn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)

    btn.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    -- Sağ Alt Küçültme/Büyütme Düğmesi (Resizer)
    local resizer = Instance.new("TextButton")
    resizer.Name = "Resizer"
    resizer.Size = UDim2.new(0, 22, 0, 22)
    resizer.Position = UDim2.new(1, -22, 1, -22)
    resizer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    resizer.BackgroundTransparency = 0.2
    resizer.Text = "⇲"
    resizer.TextColor3 = Color3.fromRGB(255, 255, 255)
    resizer.TextSize = 14
    resizer.ZIndex = 10
    resizer.Parent = frame

    local resizerCorner = Instance.new("UICorner")
    resizerCorner.CornerRadius = UDim.new(0, 6)
    resizerCorner.Parent = resizer

    local resizing, resizerStartPos, resizerStartSize = false, nil, nil

    resizer.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            resizing = true
            resizerStartPos = input.Position
            resizerStartSize = frame.Size
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then resizing = false end
            end)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if resizing and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - resizerStartPos
            local newWidth = math.max(60, resizerStartSize.X.Offset + delta.X)
            local newHeight = math.max(60, resizerStartSize.Y.Offset + delta.Y)
            frame.Size = UDim2.new(0, newWidth, 0, newHeight)
            icon.TextSize = math.clamp(newHeight * 0.3, 14, 40)
        end
    end)

    local state = false
    btn.MouseButton1Up:Connect(function()
        if not dragging and not resizing then
            state = not state
            frame.BackgroundColor3 = state and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(231, 76, 60)
            onClickCallback(state)
        end
    end)
end

-- Ekran Üzerindeki Butonlar
CreateResizableSquareButton("LockMurder", "Aimbot Murderer", "🎯", UDim2.new(0.05, 0, 0.35, 0), function(state)
    ScreenButtons.LockMurder = state
    UpdateButtonUI(LockMurderBtn, "Lock Murder", state)
    aimbotRunning = state
    Aimbot.Settings.Enabled = state
    Aimbot.Locked = state and getMurderer() or nil
end)

CreateResizableSquareButton("LockSheriff", "Aimbot Sheriff", "🎯", UDim2.new(0.05, 105, 0.35, 0), function(state)
    ScreenButtons.LockSheriff = state
    UpdateButtonUI(LockSheriffBtn, "Lock Sheriff", state)
    aimbotRunning = state
    Aimbot.Settings.Enabled = state
    if state then
        UpdateRoles()
        if Sheriff then Aimbot.Locked = Players:FindFirstChild(Sheriff) end
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
    if state then ShootTarget(getMurderer()) end
end)
