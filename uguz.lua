    UguzHub V3 - ROBLOX LUAU SCRIPT
    MM2 / GAME UTILITY - FULL INTEGRATED SCRIPT
--]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

------------------------------------------------------------
-- THEME & CONFIGURATION
------------------------------------------------------------
local Theme = {
    Background = Color3.fromRGB(15, 15, 22),
    Sidebar    = Color3.fromRGB(22, 22, 32),
    Card       = Color3.fromRGB(30, 30, 42),
    Accent     = Color3.fromRGB(138, 92, 255),
    AccentSoft = Color3.fromRGB(90, 60, 180),
    Blue       = Color3.fromRGB(41, 121, 255),
    Text       = Color3.fromRGB(240, 240, 250),
    SubText    = Color3.fromRGB(160, 160, 180),
    Stroke     = Color3.fromRGB(50, 50, 70),
    Red        = Color3.fromRGB(235, 60, 60),
    Green      = Color3.fromRGB(60, 235, 120),
}

------------------------------------------------------------
-- UI HELPER FUNCTIONS
------------------------------------------------------------
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
    return create("UICorner", { CornerRadius = UDim.new(0, radius or 12) })
end

local function stroke(color, thickness)
    return create("UIStroke", {
        Color = color or Theme.Stroke,
        Thickness = thickness or 1,
        Transparency = 0.3,
    })
end

local function tween(obj, props, duration, style, direction)
    local info = TweenInfo.new(duration or 0.3, style or Enum.EasingStyle.Quint, direction or Enum.EasingDirection.Out)
    local t = TweenService:Create(obj, info, props)
    t:Play()
    return t
end

------------------------------------------------------------
-- ROOT GUI CONTAINER
------------------------------------------------------------
local ScreenGui = create("ScreenGui", {
    Name = "UguzHubV3_Main",
    ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    DisplayOrder = 100,
    IgnoreGuiInset = true,
})

local function getGuiContainer()
    local success, _ = pcall(function()
        ScreenGui.Parent = CoreGui
    end)
    if not success then
        ScreenGui.Parent = PlayerGui
    end
end
getGuiContainer()

------------------------------------------------------------
-- SCREEN 1: INTRO ANIMATION (4 SECONDS)
------------------------------------------------------------
local IntroFrame = create("Frame", {
    Name = "IntroFrame",
    Size = UDim2.fromScale(1, 1),
    Position = UDim2.fromScale(0, 0),
    BackgroundColor3 = Theme.Background,
    ZIndex = 50,
})
IntroFrame.Parent = ScreenGui

local IntroContainer = create("Frame", {
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.new(0, 320, 0, 180),
    BackgroundTransparency = 1,
    ZIndex = 51,
})
IntroContainer.Parent = IntroFrame

local TitleLabel = create("TextLabel", {
    Text = "UguzHub",
    Font = Enum.Font.GothamBlack,
    TextSize = 46,
    TextColor3 = Theme.Text,
    BackgroundTransparency = 1,
    Size = UDim2.new(1, 0, 0, 50),
    TextTransparency = 1,
    ZIndex = 52,
})
TitleLabel.Parent = IntroContainer

local VersionTag = create("TextLabel", {
    Text = "V3",
    Font = Enum.Font.GothamBold,
    TextSize = 22,
    TextColor3 = Theme.Accent,
    BackgroundTransparency = 1,
    Position = UDim2.new(0, 0, 0, 50),
    Size = UDim2.new(1, 0, 0, 30),
    TextTransparency = 1,
    ZIndex = 52,
})
VersionTag.Parent = IntroContainer

local AnimatedBar = create("Frame", {
    Size = UDim2.new(0, 0, 0, 4),
    Position = UDim2.new(0.5, 0, 0, 90),
    AnchorPoint = Vector2.new(0.5, 0),
    BackgroundColor3 = Theme.Accent,
    BorderSizePixel = 0,
    ZIndex = 52,
})
corner(2).Parent = AnimatedBar
AnimatedBar.Parent = IntroContainer

------------------------------------------------------------
-- SCREEN 2: EXECUTOR WARNING (10 SECONDS)
------------------------------------------------------------
local WarningFrame = create("Frame", {
    Name = "WarningFrame",
    Size = UDim2.fromScale(1, 1),
    Position = UDim2.fromScale(0, 0),
    BackgroundColor3 = Theme.Background,
    BackgroundTransparency = 1,
    Visible = false,
    ZIndex = 40,
})
WarningFrame.Parent = ScreenGui

local WarningBox = create("Frame", {
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.new(0, 480, 0, 220),
    BackgroundColor3 = Theme.Sidebar,
    ZIndex = 41,
})
corner(16).Parent = WarningBox
stroke(Theme.Red, 1.5).Parent = WarningBox
WarningBox.Parent = WarningFrame

local WarningTextTR = create("TextLabel", {
    Text = "Execuetor Ayarlarindaki Tum Herseyi Kapattığınızda Emin Olun Lütfen",
    Font = Enum.Font.GothamBold,
    TextSize = 15,
    TextColor3 = Theme.Text,
    BackgroundTransparency = 1,
    Position = UDim2.new(0, 15, 0, 20),
    Size = UDim2.new(1, -30, 0, 40),
    TextWrapped = true,
    ZIndex = 42,
})
WarningTextTR.Parent = WarningBox

local DividerLine = create("Frame", {
    Size = UDim2.new(0.85, 0, 0, 2),
    Position = UDim2.new(0.5, 0, 0, 75),
    AnchorPoint = Vector2.new(0.5, 0),
    BackgroundColor3 = Theme.Stroke,
    BorderSizePixel = 0,
    ZIndex = 42,
})
DividerLine.Parent = WarningBox

local WarningTextEN = create("TextLabel", {
    Text = "Please Make Sure You Turn Off Everything In The Executor Settings",
    Font = Enum.Font.GothamMedium,
    TextSize = 14,
    TextColor3 = Theme.SubText,
    BackgroundTransparency = 1,
    Position = UDim2.new(0, 15, 0, 85),
    Size = UDim2.new(1, -30, 0, 40),
    TextWrapped = true,
    ZIndex = 42,
})
WarningTextEN.Parent = WarningBox

local CountdownLabel = create("TextLabel", {
    Text = "10",
    Font = Enum.Font.GothamBlack,
    TextSize = 32,
    TextColor3 = Theme.Accent,
    BackgroundTransparency = 1,
    Position = UDim2.new(0, 0, 0, 140),
    Size = UDim2.new(1, 0, 0, 40),
    ZIndex = 42,
})
CountdownLabel.Parent = WarningBox

------------------------------------------------------------
-- EXECUTOR & SCRIPT CORE ENGINE
------------------------------------------------------------
local Roles = {}
local MurdererPlayer = nil
local SheriffPlayer = nil

local Config = {
    ShotMurder = false,
    LockMurder = false,
    LockSheriff = false,
    KillAll = false,
    ESP_Enabled = true,
    WalkSpeed = 16,
    JumpPower = 50,
    InfJump = false,
    ButtonVisibility = {
        ShotMurder = true,
        LockMurder = true,
        LockSheriff = true,
        KillAll = true,
    }
}

-- Target ESP Detection
local function UpdateGameRoles()
    local success, result = pcall(function()
        return ReplicatedStorage:FindFirstChild("GetPlayerData", true):InvokeServer()
    end)
    if success and result then
        Roles = result
        MurdererPlayer = nil
        SheriffPlayer = nil
        for name, data in pairs(Roles) do
            if data.Role == "Murderer" then
                MurdererPlayer = Players:FindFirstChild(name)
            elseif data.Role == "Sheriff" or data.Role == "Hero" then
                SheriffPlayer = Players:FindFirstChild(name)
            end
        end
    end
end

-- ESP Rendering Engine
local ESPHighlights = {}

local function ClearESP()
    for player, hl in pairs(ESPHighlights) do
        if hl then hl:Destroy() end
    end
    table.clear(ESPHighlights)
end

local function ApplyESP()
    if not Config.ESP_Enabled then
        ClearESP()
        return
    end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local char = player.Character
            local hl = ESPHighlights[player] or Instance.new("Highlight")
            hl.Name = "UguzHub_ESP"
            hl.Adornee = char
            hl.FillTransparency = 0.5
            hl.OutlineTransparency = 0.1

            if player == MurdererPlayer then
                hl.FillColor = Color3.fromRGB(255, 30, 30)
                hl.OutlineColor = Color3.fromRGB(255, 255, 255)
            elseif player == SheriffPlayer then
                hl.FillColor = Color3.fromRGB(30, 100, 255)
                hl.OutlineColor = Color3.fromRGB(255, 255, 255)
            else
                hl.FillColor = Color3.fromRGB(50, 220, 50)
                hl.OutlineColor = Color3.fromRGB(200, 200, 200)
            end

            hl.Parent = char
            ESPHighlights[player] = hl
        end
    end
end

-- Combat Utilities (Raycast/Event Shoot without teleporting)
local function GetShootRemote()
    for _, desc in ipairs(ReplicatedStorage:GetDescendants()) do
        if desc.Name == "Shoot" and desc:IsA("RemoteEvent") then
            return desc
        end
    end
    return nil
end

local function ShootTarget(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return end
    local targetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
    local myChar = LocalPlayer.Character
    if not targetHRP or not myChar then return end

    local remote = GetShootRemote()
    if remote then
        local originCF = myChar:FindFirstChild("HumanoidRootPart") and myChar.HumanoidRootPart.CFrame or CFrame.new()
        -- Target lead calculation without moving position
        local predictedPos = targetHRP.Position + (targetHRP.Velocity * 0.18)
        remote:FireServer(originCF, CFrame.new(predictedPos))
    end
end

-- AimLock Camera Control without teleporting
local CurrentLockTarget = nil

RunService.RenderStepped:Connect(function()
    UpdateGameRoles()
    ApplyESP()

    -- Lock Target Handler
    if CurrentLockTarget and CurrentLockTarget.Character and CurrentLockTarget.Character:FindFirstChild("HumanoidRootPart") then
        local cam = workspace.CurrentCamera
        local targetPos = CurrentLockTarget.Character.HumanoidRootPart.Position + (CurrentLockTarget.Character.HumanoidRootPart.Velocity * 0.15)
        cam.CFrame = CFrame.new(cam.CFrame.Position, targetPos)
    end

    -- Character Modifications
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        hum.WalkSpeed = Config.WalkSpeed
        hum.JumpPower = Config.JumpPower
    end
end)

-- Infinite Jump Action
UserInputService.JumpRequest:Connect(function()
    if Config.InfJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- Fling Target System
local function FlingPlayer(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return end
    local myChar = LocalPlayer.Character
    local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
    local targetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")

    if myHRP and targetHRP then
        local oldPos = myHRP.CFrame
        local bv = Instance.new("BodyVelocity")
        bv.Velocity = Vector3.new(9e8, 9e8, 9e8)
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.Parent = myHRP

        local start = tick()
        while tick() - start < 1.5 do
            if targetHRP and targetHRP.Parent then
                myHRP.CFrame = targetHRP.CFrame * CFrame.new(math.random(-1,1), 0, math.random(-1,1))
            end
            task.wait()
        end
        bv:Destroy()
        myHRP.CFrame = oldPos
    end
end

------------------------------------------------------------
-- MAIN WINDOW GUI (UGUZHUB V3)
------------------------------------------------------------
local MainFrame = create("Frame", {
    Name = "MainFrame",
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.new(0, 480, 0, 320),
    BackgroundColor3 = Theme.Background,
    ClipsDescendants = true,
    Visible = false,
    ZIndex = 10,
})
corner(16).Parent = MainFrame
stroke(Theme.Accent, 1.5).Parent = MainFrame
MainFrame.Parent = ScreenGui

-- Top Header
local TopBar = create("Frame", {
    Size = UDim2.new(1, 0, 0, 42),
    BackgroundColor3 = Theme.Sidebar,
    ZIndex = 11,
})
corner(16).Parent = TopBar
TopBar.Parent = MainFrame

local HeaderTitle = create("TextLabel", {
    Text = "UguzHub V3",
    Font = Enum.Font.GothamBold,
    TextSize = 16,
    TextColor3 = Theme.Text,
    BackgroundTransparency = 1,
    Position = UDim2.new(0, 16, 0, 0),
    Size = UDim2.new(0, 200, 1, 0),
    TextXAlignment = Enum.TextXAlignment.Left,
    ZIndex = 12,
})
HeaderTitle.Parent = TopBar

local CloseBtn = create("TextButton", {
    Text = "X",
    Font = Enum.Font.GothamBold,
    TextSize = 14,
    TextColor3 = Theme.SubText,
    BackgroundTransparency = 1,
    Position = UDim2.new(1, -38, 0, 5),
    Size = UDim2.new(0, 32, 0, 32),
    ZIndex = 12,
})
CloseBtn.Parent = TopBar

-- Open / Toggle Float Button
local ToggleBtn = create("TextButton", {
    Name = "UguzHub_Toggle",
    Text = "UguzHub V3",
    Font = Enum.Font.GothamBold,
    TextSize = 13,
    TextColor3 = Theme.Text,
    BackgroundColor3 = Theme.Accent,
    Position = UDim2.new(1, -120, 0, 20),
    Size = UDim2.new(0, 100, 0, 36),
    Visible = false,
    ZIndex = 100,
})
corner(10).Parent = ToggleBtn
stroke(Color3.fromRGB(255, 255, 255), 1).Parent = ToggleBtn
ToggleBtn.Parent = ScreenGui

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    ToggleBtn.Visible = true
end)

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    ToggleBtn.Visible = false
end)

-- Window Resizer (Bottom Right Corner)
local ResizeHandle = create("TextButton", {
    Text = "◢",
    Font = Enum.Font.GothamBold,
    TextSize = 14,
    TextColor3 = Theme.SubText,
    BackgroundTransparency = 1,
    Position = UDim2.new(1, -20, 1, -20),
    Size = UDim2.new(0, 20, 0, 20),
    ZIndex = 25,
})
ResizeHandle.Parent = MainFrame

do
    local resizing = false
    local startSize, startMouse

    ResizeHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            resizing = true
            startSize = MainFrame.Size
            startMouse = input.Position
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if resizing and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - startMouse
            local newX = math.clamp(startSize.X.Offset + delta.X, 360, 700)
            local newY = math.clamp(startSize.Y.Offset + delta.Y, 260, 500)
            MainFrame.Size = UDim2.new(0, newX, 0, newY)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            resizing = false
        end
    end)
end

-- Window Dragger
do
    local dragging = false
    local dragStart, startPos

    TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
end

------------------------------------------------------------
-- TAB NAVIGATION SYSTEM
------------------------------------------------------------
local Sidebar = create("Frame", {
    Size = UDim2.new(0, 120, 1, -42),
    Position = UDim2.new(0, 0, 0, 42),
    BackgroundColor3 = Theme.Sidebar,
    ZIndex = 11,
})
Sidebar.Parent = MainFrame

local TabHolder = create("Frame", {
    Size = UDim2.new(1, 0, 1, 0),
    BackgroundTransparency = 1,
    ZIndex = 12,
})
TabHolder.Parent = Sidebar

create("UIListLayout", {
    Padding = UDim.new(0, 4),
    HorizontalAlignment = Enum.HorizontalAlignment.Center,
    SortOrder = Enum.SortOrder.LayoutOrder,
}).Parent = TabHolder

local ContentFrame = create("Frame", {
    Size = UDim2.new(1, -126, 1, -48),
    Position = UDim2.new(0, 124, 0, 46),
    BackgroundTransparency = 1,
    ZIndex = 11,
})
ContentFrame.Parent = MainFrame

local Tabs = {}

local function CreateTab(name)
    local tabBtn = create("TextButton", {
        Text = name,
        Font = Enum.Font.GothamMedium,
        TextSize = 13,
        TextColor3 = Theme.SubText,
        BackgroundColor3 = Theme.Card,
        Size = UDim2.new(0, 110, 0, 32),
        AutoButtonColor = false,
        ZIndex = 13,
    })
    corner(8).Parent = tabBtn

    local page = create("ScrollingFrame", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Visible = false,
        ScrollBarThickness = 3,
        ZIndex = 12,
    })
    page.Parent = ContentFrame

    create("UIListLayout", {
        Padding = UDim.new(0, 8),
        SortOrder = Enum.SortOrder.LayoutOrder,
    }).Parent = page

    tabBtn.MouseButton1Click:Connect(function()
        for _, t in pairs(Tabs) do
            t.Btn.TextColor3 = Theme.SubText
            t.Btn.BackgroundColor3 = Theme.Card
            t.Page.Visible = false
        end
        tabBtn.TextColor3 = Theme.Text
        tabBtn.BackgroundColor3 = Theme.Accent
        page.Visible = true
    end)

    Tabs[name] = { Btn = tabBtn, Page = page }
    tabBtn.Parent = TabHolder
    return page
end

local CombatPage = CreateTab("Combat")
local FunPage = CreateTab("Fun")

------------------------------------------------------------
-- COMBAT TAB ELEMENTS
------------------------------------------------------------
local ButtonsContainer = {}

local function CreateCombatButton(id, text, callback)
    local btn = create("TextButton", {
        Text = text,
        Font = Enum.Font.GothamBold,
        TextSize = 13,
        TextColor3 = Theme.Text,
        BackgroundColor3 = Theme.Card,
        Size = UDim2.new(1, -8, 0, 36),
        ZIndex = 14,
    })
    corner(8).Parent = btn
    stroke().Parent = btn
    btn.Parent = CombatPage

    btn.MouseButton1Click:Connect(callback)
    ButtonsContainer[id] = btn
    return btn
end

-- 1. Shot Murder
CreateCombatButton("ShotMurder", "Shot Murder", function()
    if MurdererPlayer then
        ShootTarget(MurdererPlayer)
    end
end)

-- 2. Lock Murder
local lockM = false
CreateCombatButton("LockMurder", "Lock Murder [OFF]", function()
    lockM = not lockM
    if lockM then
        CurrentLockTarget = MurdererPlayer
        ButtonsContainer["LockMurder"].Text = "Lock Murder [ON]"
        ButtonsContainer["LockMurder"].BackgroundColor3 = Theme.Accent
    else
        CurrentLockTarget = nil
        ButtonsContainer["LockMurder"].Text = "Lock Murder [OFF]"
        ButtonsContainer["LockMurder"].BackgroundColor3 = Theme.Card
        end
        end)

-- 3. Lock Sheriff
local lockS = false
CreateCombatButton("LockSheriff", "Lock Sheriff [OFF]", function()
    lockS = not lockS
    if lockS then
        CurrentLockTarget = SheriffPlayer
        ButtonsContainer["LockSheriff"].Text = "Lock Sheriff [ON]"
        ButtonsContainer["LockSheriff"].BackgroundColor3 = Theme.Accent
    else
        CurrentLockTarget = nil
        ButtonsContainer["LockSheriff"].Text = "Lock Sheriff [OFF]"
        ButtonsContainer["LockSheriff"].BackgroundColor3 = Theme.Card
    end
end)

-- 4. Kill All
CreateCombatButton("KillAll", "Kill All", function()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            ShootTarget(p)
        end
    end
end)

-- Combat Visibility Settings Section
local VisTitle = create("TextLabel", {
    Text = "Button Visibility Settings",
    Font = Enum.Font.GothamBold,
    TextSize = 13,
    TextColor3 = Theme.SubText,
    BackgroundTransparency = 1,
    Size = UDim2.new(1, 0, 0, 24),
    ZIndex = 14,
})
VisTitle.Parent = CombatPage

local function CreateVisibilityToggle(id, labelText)
    local frame = create("Frame", {
        Size = UDim2.new(1, -8, 0, 30),
        BackgroundColor3 = Theme.Sidebar,
        ZIndex = 14,
    })
    corner(6).Parent = frame
    frame.Parent = CombatPage

    create("TextLabel", {
        Text = labelText,
        Font = Enum.Font.GothamMedium,
        TextSize = 12,
        TextColor3 = Theme.Text,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0, 0),
        Size = UDim2.new(0.6, 0, 1, 0),
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 15,
    }).Parent = frame

    local tog = create("TextButton", {
        Text = "VISIBLE",
        Font = Enum.Font.GothamBold,
        TextSize = 10,
        TextColor3 = Theme.Green,
        BackgroundColor3 = Theme.Card,
        Position = UDim2.new(1, -75, 0, 4),
        Size = UDim2.new(0, 65, 0, 22),
        ZIndex = 15,
    })
    corner(4).Parent = tog
    tog.Parent = frame

    tog.MouseButton1Click:Connect(function()
        Config.ButtonVisibility[id] = not Config.ButtonVisibility[id]
        local isVis = Config.ButtonVisibility[id]
        tog.Text = isVis and "VISIBLE" or "HIDDEN"
        tog.TextColor3 = isVis and Theme.Green or Theme.Red
        if ButtonsContainer[id] then
            ButtonsContainer[id].Visible = isVis
        end
    end)
end

CreateVisibilityToggle("ShotMurder", "Shot Murder")
CreateVisibilityToggle("LockMurder", "Lock Murder")
CreateVisibilityToggle("LockSheriff", "Lock Sheriff")
CreateVisibilityToggle("KillAll", "Kill All")

------------------------------------------------------------
-- FUN TAB ELEMENTS (ENGLISH ONLY)
------------------------------------------------------------
local function CreateFunToggle(labelText, defaultState, callback)
    local frame = create("Frame", {
        Size = UDim2.new(1, -8, 0, 36),
        BackgroundColor3 = Theme.Card,
        ZIndex = 14,
    })
    corner(8).Parent = frame
    frame.Parent = FunPage

    create("TextLabel", {
        Text = labelText,
        Font = Enum.Font.GothamBold,
        TextSize = 13,
        TextColor3 = Theme.Text,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 12, 0, 0),
        Size = UDim2.new(0.6, 0, 1, 0),
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 15,
    }).Parent = frame

    local tog = create("TextButton", {
        Text = defaultState and "ON" or "OFF",
        Font = Enum.Font.GothamBold,
        TextSize = 11,
        TextColor3 = defaultState and Theme.Green or Theme.Red,
        BackgroundColor3 = Theme.Sidebar,
        Position = UDim2.new(1, -60, 0, 6),
        Size = UDim2.new(0, 50, 0, 24),
        ZIndex = 15,
    })
    corner(6).Parent = tog
    tog.Parent = frame

    local state = defaultState
    tog.MouseButton1Click:Connect(function()
        state = not state
        tog.Text = state and "ON" or "OFF"
        tog.TextColor3 = state and Theme.Green or Theme.Red
        callback(state)
    end)
end

-- 1. Jump Power (85)
CreateFunToggle("High Jump (85)", false, function(active)
    Config.JumpPower = active and 85 or 50
end)

-- 2. Speed Walk (30)
CreateFunToggle("Fast Walk (30)", false, function(active)
    Config.WalkSpeed = active and 30 or 16
end)

-- 3. Infinite Jump
CreateFunToggle("Infinite Jump", false, function(active)
    Config.InfJump = active
end)

-- 4. Fling Murderer
local flingMBtn = create("TextButton", {
    Text = "Fling Murderer",
    Font = Enum.Font.GothamBold,
    TextSize = 13,
    TextColor3 = Theme.Text,
    BackgroundColor3 = Theme.Card,
    Size = UDim2.new(1, -8, 0, 36),
    ZIndex = 14,
})
corner(8).Parent = flingMBtn
stroke().Parent = flingMBtn
flingMBtn.Parent = FunPage
flingMBtn.MouseButton1Click:Connect(function()
    if MurdererPlayer then
        FlingPlayer(MurdererPlayer)
    end
end)

-- 5. Fling Sheriff
local flingSBtn = create("TextButton", {
    Text = "Fling Sheriff",
    Font = Enum.Font.GothamBold,
    TextSize = 13,
    TextColor3 = Theme.Text,
    BackgroundColor3 = Theme.Card,
    Size = UDim2.new(1, -8, 0, 36),
    ZIndex = 14,
})
corner(8).Parent = flingSBtn
stroke().Parent = flingSBtn
flingSBtn.Parent = FunPage
flingSBtn.MouseButton1Click:Connect(function()
    if SheriffPlayer then
        FlingPlayer(SheriffPlayer)
    end
end)

-- Set Default Active Tab
Tabs["Combat"].Btn.TextColor3 = Theme.Text
Tabs["Combat"].Btn.BackgroundColor3 = Theme.Accent
Tabs["Combat"].Page.Visible = true

------------------------------------------------------------
-- FLOW CONTROL TIMERS
------------------------------------------------------------
-- STEP 1: Intro Animation (4 Seconds)
task.spawn(function()
    tween(TitleLabel, { TextTransparency = 0 }, 0.8)
    tween(VersionTag, { TextTransparency = 0 }, 0.8)
    task.wait(0.2)
    tween(AnimatedBar, { Size = UDim2.new(0, 200, 0, 4) }, 1.2, Enum.EasingStyle.Quart)

    task.wait(4.0) -- Full 4 second Intro Duration

    -- Fade Out Intro
    tween(IntroFrame, { BackgroundTransparency = 1 }, 0.5)
    tween(TitleLabel, { TextTransparency = 1 }, 0.4)
    tween(VersionTag, { TextTransparency = 1 }, 0.4)
    tween(AnimatedBar, { BackgroundTransparency = 1 }, 0.4)
    task.wait(0.5)
    IntroFrame.Visible = false

    -- STEP 2: Executor Warning Screen (10 Seconds)
    WarningFrame.Visible = true
    tween(WarningFrame, { BackgroundTransparency = 0.2 }, 0.4)

    for i = 10, 1, -1 do
        CountdownLabel.Text = tostring(i)
        task.wait(1.0)
    end

    -- Fade Out Warning
    tween(WarningFrame, { BackgroundTransparency = 1 }, 0.5)
    task.wait(0.5)
    WarningFrame.Visible = false

    -- STEP 3: Main Menu Launch
    MainFrame.Visible = true
    MainFrame.Size = UDim2.new(0, 380, 0, 240)
    tween(MainFrame, { Size = UDim2.new(0, 480, 0, 320) }, 0.4, Enum.EasingStyle.Back)
end)
