-- ===========================================
--    AMT UI | MM2 - الإصدار 1.0.7
--    مطور: AMT
--    قائمة مصغرة + رئيسيه
-- ===========================================

local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

-- الشعار الرئيسي
local LOGO_URL = "https://www.roblox.com/asset-thumbnail/image?assetId=139907932675117&width=420&height=420"
local OWNER_IMAGE = "rbxassetid://83489151551233"
local STAR_IMAGE = "rbxassetid://6031096287"

-- حذف النسخة القديمة
pcall(function()
    if CoreGui:FindFirstChild("AMT_UI") then
        CoreGui.AMT_UI:Destroy()
    end
end)

local GUI = Instance.new("ScreenGui", CoreGui)
GUI.Name = "AMT_UI"

-- ============= زر الفتح (الشعار) =============
local Open = Instance.new("ImageButton", GUI)
Open.Size = UDim2.new(0, 45, 0, 45)
Open.Position = UDim2.new(0, 15, 0.5, -22)
Open.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Open.Image = LOGO_URL
Open.Visible = true
Instance.new("UICorner", Open).CornerRadius = UDim.new(1, 0)

Open.MouseEnter:Connect(function()
    TweenService:Create(Open, TweenInfo.new(0.2), {Size = UDim2.new(0, 50, 0, 50)}):Play()
end)
Open.MouseLeave:Connect(function()
    TweenService:Create(Open, TweenInfo.new(0.2), {Size = UDim2.new(0, 45, 0, 45)}):Play()
end)

-- ============= القائمة الرئيسية (مصغرة) =============
local Main = Instance.new("Frame", GUI)
Main.Size = UDim2.new(0, 0, 0, 0)
Main.Position = UDim2.new(0.5, -160, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Main.ClipsDescendants = true
Main.Active = true
Main.Draggable = true
Main.Visible = false
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)

local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Color = Color3.fromRGB(0, 120, 255)
MainStroke.Thickness = 1.5

TweenService:Create(Main, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
    Size = UDim2.new(0, 320, 0, 400)
}):Play()

-- ============= الجانب اليسار =============
local Side = Instance.new("Frame", Main)
Side.Size = UDim2.new(0, 80, 1, 0)
Side.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Instance.new("UICorner", Side).CornerRadius = UDim.new(0, 12)

local Logo = Instance.new("ImageLabel", Side)
Logo.Size = UDim2.new(0, 30, 0, 30)
Logo.Position = UDim2.new(0.5, -15, 0, 12)
Logo.BackgroundTransparency = 1
Logo.Image = LOGO_URL

local Version = Instance.new("TextLabel", Side)
Version.Size = UDim2.new(1, 0, 0, 10)
Version.Position = UDim2.new(0, 0, 0, 48)
Version.BackgroundTransparency = 1
Version.Text = "v1.0.7"
Version.TextColor3 = Color3.fromRGB(0, 200, 255)
Version.TextSize = 9
Version.TextXAlignment = Enum.TextXAlignment.Center

local By = Instance.new("TextLabel", Side)
By.Size = UDim2.new(1, 0, 0, 10)
By.Position = UDim2.new(0, 0, 0, 60)
By.BackgroundTransparency = 1
By.Text = "By AMT"
By.TextColor3 = Color3.new(1, 1, 1)
By.TextSize = 9
By.TextXAlignment = Enum.TextXAlignment.Center

-- ============= التبويبات =============
local Tabs = Instance.new("Frame", Side)
Tabs.Position = UDim2.new(0, 5, 0, 80)
Tabs.Size = UDim2.new(1, -10, 0, 250)
Tabs.BackgroundTransparency = 1

local TabsLayout = Instance.new("UIListLayout", Tabs)
TabsLayout.Padding = UDim.new(0, 4)

local function MakeTab(text)
    local btn = Instance.new("TextButton", Tabs)
    btn.Size = UDim2.new(1, 0, 0, 26)
    btn.Text = text
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.TextSize = 11
    btn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    return btn
end

local homeTab = MakeTab("🏠 Home")
local mainTab = MakeTab("🌟 رئيسيه")
local farmTab = MakeTab("💰 Farm")
local espTab = MakeTab("👁️ ESP")
local settingsTab = MakeTab("⚙️ Set")

-- ============= منطقة المحتوى =============
local Content = Instance.new("Frame", Main)
Content.Position = UDim2.new(0, 90, 0, 8)
Content.Size = UDim2.new(0, 215, 0, 380)
Content.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
Instance.new("UICorner", Content).CornerRadius = UDim.new(0, 10)

local ContentScroll = Instance.new("ScrollingFrame", Content)
ContentScroll.Size = UDim2.new(1, -8, 1, -8)
ContentScroll.Position = UDim2.new(0, 4, 0, 4)
ContentScroll.BackgroundTransparency = 1
ContentScroll.ScrollBarThickness = 3
ContentScroll.CanvasSize = UDim2.new(0, 0, 0, 0)

local ContentList = Instance.new("UIListLayout", ContentScroll)
ContentList.Padding = UDim.new(0, 6)
ContentList.SortOrder = Enum.SortOrder.LayoutOrder

-- ============= دوال مساعدة =============
local function AddLabel(parent, text, color)
    local lbl = Instance.new("TextLabel", parent)
    lbl.Size = UDim2.new(1, 0, 0, 20)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = color or Color3.fromRGB(220, 220, 220)
    lbl.TextSize = 11
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return lbl
end

local function AddSmallLabel(parent, text, color)
    local lbl = Instance.new("TextLabel", parent)
    lbl.Size = UDim2.new(1, 0, 0, 16)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = color or Color3.fromRGB(160, 160, 160)
    lbl.TextSize = 10
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return lbl
end

local function AddButton(parent, text, color, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, 0, 0, 32)
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 11
    btn.Font = Enum.Font.GothamSemibold
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

local function AddToggle(parent, text, color, state, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, 0, 0, 32)
    btn.BackgroundColor3 = color
    btn.Text = text .. ": " .. (state and "ON" or "OFF")
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 11
    btn.Font = Enum.Font.GothamSemibold
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = text .. ": " .. (state and "ON" or "OFF")
        btn.BackgroundColor3 = state and Color3.fromRGB(50, 180, 50) or color
        callback(state)
    end)
    
    if state then
        btn.BackgroundColor3 = Color3.fromRGB(50, 180, 50)
    end
    
    return btn, function() return state end
end

-- ============= إنشاء الصفحات =============
local function CreatePage()
    local f = Instance.new("Frame", ContentScroll)
    f.Size = UDim2.new(1, 0, 0, 0)
    f.BackgroundTransparency = 1
    f.AutomaticSize = Enum.AutomaticSize.Y
    f.Visible = false
    Instance.new("UIListLayout", f).Padding = UDim.new(0, 6)
    return f
end

local homePage = CreatePage()
local mainPage = CreatePage()
local farmPage = CreatePage()
local espPage = CreatePage()
local settingsPage = CreatePage()

-- ============= تبويب Home =============
AddLabel(homePage, "🛡️ AMT UI | MM2", Color3.fromRGB(0, 150, 255))
AddSmallLabel(homePage, "الإصدار 1.0.7 - قائمة مصغرة", Color3.fromRGB(100, 255, 100))
AddSmallLabel(homePage, "")

AddLabel(homePage, "📊 المزايا:", Color3.fromRGB(255, 200, 0))
AddSmallLabel(homePage, "🌟 رئيسيه - صورة المطور", Color3.fromRGB(100, 255, 100))
AddSmallLabel(homePage, "💰 Auto Farm - جمع الكوينز", Color3.fromRGB(100, 255, 100))
AddSmallLabel(homePage, "👁️ ESP - كشف القاتل والشريف", Color3.fromRGB(100, 255, 100))
AddSmallLabel(homePage, "🕊️ Fly Mode - طيران حقيقي", Color3.fromRGB(100, 255, 100))
AddSmallLabel(homePage, "⚡ Speed Boost - زيادة السرعة", Color3.fromRGB(100, 255, 100))

-- ============= تبويب رئيسيه 🌟 =============
-- إطار الصورة الدائري
local ownerFrame = Instance.new("Frame", mainPage)
ownerFrame.Size = UDim2.new(0, 120, 0, 120)
ownerFrame.Position = UDim2.new(0.5, -60, 0, 10)
ownerFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
ownerFrame.BackgroundTransparency = 0.2
Instance.new("UICorner", ownerFrame).CornerRadius = UDim.new(1, 0)

-- النجمة الحمراء الدوارة
local star = Instance.new("ImageLabel", ownerFrame)
star.Size = UDim2.new(1, 0, 1, 0)
star.BackgroundTransparency = 1
star.Image = STAR_IMAGE
star.ImageColor3 = Color3.fromRGB(255, 0, 0)
star.ScaleType = Enum.ScaleType.Fit

local rot = 0
task.spawn(function()
    while true do
        rot = rot + 2
        star.Rotation = rot
        task.wait(0.05)
    end
end)

-- صورة Owner
local ownerImg = Instance.new("ImageLabel", ownerFrame)
ownerImg.Size = UDim2.new(0.7, 0, 0.7, 0)
ownerImg.Position = UDim2.new(0.15, 0, 0.15, 0)
ownerImg.BackgroundTransparency = 1
ownerImg.Image = OWNER_IMAGE
ownerImg.ScaleType = Enum.ScaleType.Fit
Instance.new("UICorner", ownerImg).CornerRadius = UDim.new(1, 0)

-- كلمة Owner
local ownerText = Instance.new("TextLabel", ownerFrame)
ownerText.Size = UDim2.new(1, 0, 0, 25)
ownerText.Position = UDim2.new(0, 0, 0.85, 0)
ownerText.BackgroundTransparency = 1
ownerText.Text = "「 𝐎𝐖𝐍𝐄𝐑 」"
ownerText.TextColor3 = Color3.fromRGB(255, 50, 50)
ownerText.TextScaled = true
ownerText.Font = Enum.Font.GothamBold
ownerText.TextXAlignment = Enum.TextXAlignment.Center

-- مسافة
local spacer = Instance.new("Frame", mainPage)
spacer.Size = UDim2.new(1, 0, 0, 15)
spacer.BackgroundTransparency = 1

AddSmallLabel(mainPage, "⭐ المطور: AMT", Color3.fromRGB(255, 200, 0))
AddSmallLabel(mainPage, "📅 الإصدار: 1.0.7", Color3.fromRGB(200, 200, 200))
AddSmallLabel(mainPage, "🎮 اللعبة: Murder Mystery 2", Color3.fromRGB(200, 200, 200))

-- ============= تبويب Farm =============
AddLabel(farmPage, "💰 Auto Farm", Color3.fromRGB(0, 150, 255))
AddSmallLabel(farmPage, "جمع الكوينز التلقائي", Color3.fromRGB(200, 200, 200))
AddSmallLabel(farmPage, "")

local autoFarm = false
local collected = 0
local coinsLabel = AddLabel(farmPage, "💎 تم جمع: 0", Color3.fromRGB(100, 255, 100))
local farmBtn, getFarm = AddToggle(farmPage, "Auto Farm", Color3.fromRGB(0, 100, 200), false, function(state)
    autoFarm = state
end)

local function findCoins()
    local coins = {}
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("BasePart") and (obj.Name == "Coin_Server" or obj.Name == "Coin" or string.find(obj.Name, "Coin")) then
            table.insert(coins, obj)
        end
    end
    return coins
end

local function collectCoin(coin)
    if not coin or not coin.Parent then return end
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChild("Humanoid")
    if not root or not hum then return end
    
    local originalSpeed = hum.WalkSpeed
    hum.WalkSpeed = 50
    
    local tween = TweenService:Create(root, TweenInfo.new(0.3), {CFrame = CFrame.new(coin.Position)})
    tween:Play()
    tween.Completed:Wait()
    
    hum.WalkSpeed = originalSpeed
    collected = collected + 1
    coinsLabel.Text = "💎 تم جمع: " .. collected
end

task.spawn(function()
    while true do
        if autoFarm then
            local char = LocalPlayer.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            if root then
                local coins = findCoins()
                local closest = nil
                local closestDist = math.huge
                for _, coin in pairs(coins) do
                    local dist = (root.Position - coin.Position).Magnitude
                    if dist < closestDist then
                        closestDist = dist
                        closest = coin
                    end
                end
                if closest then collectCoin(closest) end
            end
        end
        task.wait(0.2)
    end
end)

-- ============= تبويب ESP =============
AddLabel(espPage, "👁️ ESP", Color3.fromRGB(0, 150, 255))
AddSmallLabel(espPage, "كشف القاتل والشريف", Color3.fromRGB(200, 200, 200))
AddSmallLabel(espPage, "")

local espFrame = Instance.new("Frame", espPage)
espFrame.Size = UDim2.new(1, 0, 0, 0)
espFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
espFrame.AutomaticSize = Enum.AutomaticSize.Y
Instance.new("UICorner", espFrame).CornerRadius = UDim.new(0, 6)

local espLayout = Instance.new("UIListLayout", espFrame)
espLayout.Padding = UDim.new(0, 4)

local refreshBtn = Instance.new("TextButton", espPage)
refreshBtn.Size = UDim2.new(1, 0, 0, 30)
refreshBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
refreshBtn.Text = "🔄 تحديث"
refreshBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
refreshBtn.TextSize = 11
refreshBtn.Font = Enum.Font.GothamSemibold
Instance.new("UICorner", refreshBtn).CornerRadius = UDim.new(0, 6)

local function GetPlayerRole(player)
    if not player then return "innocent" end
    
    if player.Character then
        for _, child in pairs(player.Character:GetChildren()) do
            if child:IsA("Tool") then
                local toolName = child.Name:lower()
                if toolName:find("knife") then return "murderer"
                elseif toolName:find("sheriff") or toolName:find("gun") then return "sheriff"
                end
            end
        end
    end
    return "innocent"
end

local function UpdateESP()
    for _, child in pairs(espFrame:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end
    
    local murderer, sheriff = nil, nil
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local role = GetPlayerRole(player)
            if role == "murderer" then murderer = player
            elseif role == "sheriff" then sheriff = player
            end
        end
    end
    
    if murderer then
        local frame = Instance.new("Frame", espFrame)
        frame.Size = UDim2.new(1, 0, 0, 45)
        frame.BackgroundColor3 = Color3.fromRGB(45, 25, 30)
        Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 5)
        
        local avatar = Instance.new("ImageLabel", frame)
        avatar.Size = UDim2.new(0, 35, 0, 35)
        avatar.Position = UDim2.new(0, 5, 0, 5)
        avatar.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
        Instance.new("UICorner", avatar).CornerRadius = UDim.new(0, 5)
        avatar.Image = "https://www.roblox.com/avatar-thumbnail/image?userId=" .. murderer.UserId .. "&width=60&height=60&format=png"
        
        local nameLabel = Instance.new("TextLabel", frame)
        nameLabel.Size = UDim2.new(0.6, 0, 0, 16)
        nameLabel.Position = UDim2.new(0, 50, 0, 5)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = murderer.Name
        nameLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        nameLabel.TextSize = 11
        nameLabel.TextXAlignment = Enum.TextXAlignment.Left
        nameLabel.Font = Enum.Font.GothamBold
        
        local roleLabel = Instance.new("TextLabel", frame)
        roleLabel.Size = UDim2.new(0.6, 0, 0, 16)
        roleLabel.Position = UDim2.new(0, 50, 0, 25)
        roleLabel.BackgroundTransparency = 1
        roleLabel.Text = "🔪 قاتل"
        roleLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
        roleLabel.TextSize = 10
        roleLabel.TextXAlignment = Enum.TextXAlignment.Left
    end
    
    if sheriff then
        local frame = Instance.new("Frame", espFrame)
        frame.Size = UDim2.new(1, 0, 0, 45)
        frame.BackgroundColor3 = Color3.fromRGB(25, 35, 55)
        Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 5)
        
        local avatar = Instance.new("ImageLabel", frame)
        avatar.Size = UDim2.new(0, 35, 0, 35)
        avatar.Position = UDim2.new(0, 5, 0, 5)
        avatar.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
        Instance.new("UICorner", avatar).CornerRadius = UDim.new(0, 5)
        avatar.Image = "https://www.roblox.com/avatar-thumbnail/image?userId=" .. sheriff.UserId .. "&width=60&height=60&format=png"
        
        local nameLabel = Instance.new("TextLabel", frame)
        nameLabel.Size = UDim2.new(0.6, 0, 0, 16)
        nameLabel.Position = UDim2.new(0, 50, 0, 5)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = sheriff.Name
        nameLabel.TextColor3 = Color3.fromRGB(100, 150, 255)
        nameLabel.TextSize = 11
        nameLabel.TextXAlignment = Enum.TextXAlignment.Left
        nameLabel.Font = Enum.Font.GothamBold
        
        local roleLabel = Instance.new("TextLabel", frame)
        roleLabel.Size = UDim2.new(0.6, 0, 0, 16)
        roleLabel.Position = UDim2.new(0, 50, 0, 25)
        roleLabel.BackgroundTransparency = 1
        roleLabel.Text = "🔫 شريف"
        roleLabel.TextColor3 = Color3.fromRGB(80, 150, 255)
        roleLabel.TextSize = 10
        roleLabel.TextXAlignment = Enum.TextXAlignment.Left
    end
    
    espFrame.Size = UDim2.new(1, 0, 0, espLayout.AbsoluteContentSize.Y + 5)
end

refreshBtn.MouseButton1Click:Connect(UpdateESP)

task.spawn(function()
    while true do
        UpdateESP()
        task.wait(1)
    end
end)

local espEnabled = false
local espBtn, getEsp = AddToggle(espPage, "Highlight", Color3.fromRGB(100, 50, 150), false, function(state)
    espEnabled = state
end)

local highlights = {}
task.spawn(function()
    while true do
        for _, h in pairs(highlights) do pcall(function() h:Destroy() end) end
        highlights = {}
        if espEnabled then
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local role = GetPlayerRole(player)
                    local color = Color3.fromRGB(50, 255, 50)
                    if role == "murderer" then color = Color3.fromRGB(255, 50, 50)
                    elseif role == "sheriff" then color = Color3.fromRGB(50, 120, 255)
                    end
                    local hl = Instance.new("Highlight")
                    hl.Parent = player.Character
                    hl.FillColor = color
                    hl.OutlineColor = Color3.new(1, 1, 1)
                    hl.FillTransparency = 0.5
                    table.insert(highlights, hl)
                end
            end
        end
        task.wait(0.5)
    end
end)

-- ============= تبويب Settings =============
AddLabel(settingsPage, "⚙️ Settings", Color3.fromRGB(0, 150, 255))
AddSmallLabel(settingsPage, "التحكم بالشخصية", Color3.fromRGB(200, 200, 200))
AddSmallLabel(settingsPage, "")

-- Speed Boost
local speedActive = false
local speedBtn, getSpeed = AddToggle(settingsPage, "Speed Boost (x3)", Color3.fromRGB(0, 150, 100), false, function(state)
    speedActive = state
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChild("Humanoid")
    if hum then
        if speedActive then
            hum.WalkSpeed = 80
        else
            hum.WalkSpeed = 16
        end
    end
end)

-- Fly Mode
local flyActive = false
local flyConnection = nil
local flyBodyVelocity = nil

local flyBtn = Instance.new("TextButton", settingsPage)
flyBtn.Size = UDim2.new(1, 0, 0, 32)
flyBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
flyBtn.Text = "Fly Mode: OFF"
flyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
flyBtn.TextSize = 11
flyBtn.Font = Enum.Font.GothamSemibold
Instance.new("UICorner", flyBtn).CornerRadius = UDim.new(0, 6)

local function startFly()
    local char = LocalPlayer.Character
    if not char then return end
    local hum = char:FindFirstChild("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    if not hum or not root then return end
    
    hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
    hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
    hum.PlatformStand = true
    
    flyBodyVelocity = Instance.new("BodyVelocity")
    flyBodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
    flyBodyVelocity.P = 100000
    flyBodyVelocity.Parent = root
    
    flyConnection = RunService.Heartbeat:Connect(function()
        if flyActive and root and flyBodyVelocity then
            local move = Vector3.new(0, 0, 0)
            if UIS:IsKeyDown(Enum.KeyCode.W) then move = move + Vector3.new(0, 0, -1) end
            if UIS:IsKeyDown(Enum.KeyCode.S) then move = move + Vector3.new(0, 0, 1) end
            if UIS:IsKeyDown(Enum.KeyCode.A) then move = move + Vector3.new(-1, 0, 0) end
            if UIS:IsKeyDown(Enum.KeyCode.D) then move = move + Vector3.new(1, 0, 0) end
            if UIS:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0, 1, 0) end
            if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then move = move + Vector3.new(0, -1, 0) end
            if move.Magnitude > 0 then
                flyBodyVelocity.Velocity = move.Unit * 60
            else
                flyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
            end
        end
    end)
end

local function stopFly()
    if flyConnection then flyConnection:Disconnect() end
    if flyBodyVelocity then flyBodyVelocity:Destroy() end
    local char = LocalPlayer.Character
    if char then
        local hum = char:FindFirstChild("Humanoid")
        if hum then
            hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
            hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
            hum.PlatformStand = false
        end
    end
end

flyBtn.MouseButton1Click:Connect(function()
    flyActive = not flyActive
    flyBtn.Text = "Fly Mode: " .. (flyActive and "ON" or "OFF")
    flyBtn.BackgroundColor3 = flyActive and Color3.fromRGB(50, 180, 50) or Color3.fromRGB(0, 100, 200)
    if flyActive then
        startFly()
    else
        stopFly()
    end
end)

task.spawn(function()
    while true do
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChild("Humanoid")
        if hum and not flyActive then
            if speedActive then
                hum.WalkSpeed = 80
            else
                if hum.WalkSpeed == 80 then
                    hum.WalkSpeed = 16
                end
            end
        end
        task.wait(0.5)
    end
end)

-- ============= زر الإغلاق =============
local CloseBtn = Instance.new("TextButton", Main)
CloseBtn.Size = UDim2.new(0, 22, 0, 22)
CloseBtn.Position = UDim2.new(1, -28, 0, 6)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(1, 0)

local function OpenGUI()
    Main.Visible = true
    Open.Visible = false
    TweenService:Create(Main, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
        Size = UDim2.new(0, 320, 0, 400)
    }):Play()
end

local function CloseGUI()
    TweenService:Create(Main, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
        Size = UDim2.new(0, 0, 0, 0)
    }):Play()
    task.wait(0.3)
    Main.Visible = false
    Open.Visible = true
end

CloseBtn.MouseButton1Click:Connect(CloseGUI)
Open.MouseButton1Click:Connect(OpenGUI)

-- تبديل الصفحات
local function showPage(page, activeTab)
    homePage.Visible = false
    mainPage.Visible = false
    farmPage.Visible = false
    espPage.Visible = false
    settingsPage.Visible = false
    page.Visible = true
    
    for _, btn in pairs(Tabs:GetChildren()) do
        if btn:IsA("TextButton") then
            btn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
        end
    end
    activeTab.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    
    task.wait(0.1)
    ContentScroll.CanvasSize = UDim2.new(0, 0, 0, ContentList.AbsoluteContentSize.Y + 15)
end

homeTab.MouseButton1Click:Connect(function() showPage(homePage, homeTab) end)
mainTab.MouseButton1Click:Connect(function() showPage(mainPage, mainTab) end)
farmTab.MouseButton1Click:Connect(function() showPage(farmPage, farmTab) end)
espTab.MouseButton1Click:Connect(function() showPage(espPage, espTab) end)
settingsTab.MouseButton1Click:Connect(function() showPage(settingsPage, settingsTab) end)

ContentList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    if homePage.Visible or mainPage.Visible or farmPage.Visible or espPage.Visible or settingsPage.Visible then
        ContentScroll.CanvasSize = UDim2.new(0, 0, 0, ContentList.AbsoluteContentSize.Y + 15)
    end
end)

-- تفعيل الصفحة الأولى
showPage(homePage, homeTab)
task.wait(0.5)
UpdateESP()

-- رسالة ترحيب
game.StarterGui:SetCore("SendNotification", {
    Title = "🛡️ AMT UI v1.0.7",
    Text = "✅ تم التحميل | قائمة مصغرة + رئيسيه",
    Duration = 3
})
