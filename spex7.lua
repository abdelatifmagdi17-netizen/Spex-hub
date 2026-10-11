loadstring(game:HttpGet("https://raw.githubusercontent.com/abdelatifmagdi17-netizen/Spex-hub/main/spex7.lua"))()

-- Spex Pro MM2 Hub (Role ESP, Fast Gun TP, Aimbot, TP Loop, Auto Fire) for Delta
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")

-- Settings
local AimbotEnabled = false
local ESPEnabled = false
local TpLoopEnabled = false
local AutoFireEnabled = false
local GunTpEnabled = false
local AimPart = "Head"

-- Create GUI (Main Frame)
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local AimbotBtn = Instance.new("TextButton")
local EspBtn = Instance.new("TextButton")
local GunTpBtn = Instance.new("TextButton")
local TpLoopBtn = Instance.new("TextButton")
local AutoFireBtn = Instance.new("TextButton")
local MinimizeBtn = Instance.new("TextButton")
local CloseBtn = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "SpexMM2Hub"

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.05, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 170, 0, 275)
MainFrame.Active = true
MainFrame.Draggable = true

Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "Spex MM2 Hub"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16

-- Minimize Button (-)
MinimizeBtn.Parent = MainFrame
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(200, 150, 0)
MinimizeBtn.Position = UDim2.new(0.65, 0, 0, 0)
MinimizeBtn.Size = UDim2.new(0, 30, 0, 30)
MinimizeBtn.Font = Enum.Font.SourceSansBold
MinimizeBtn.Text = "-"
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.TextSize = 18

-- Close Button (X)
CloseBtn.Parent = MainFrame
CloseBtn.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
CloseBtn.Position = UDim2.new(0.82, 0, 0, 0)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 14

-- Aimbot Button
AimbotBtn.Parent = MainFrame
AimbotBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
AimbotBtn.Position = UDim2.new(0.1, 0, 0.15, 0)
AimbotBtn.Size = UDim2.new(0.8, 0, 0, 30)
AimbotBtn.Font = Enum.Font.SourceSansBold
AimbotBtn.Text = "Aimbot: OFF"
AimbotBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AimbotBtn.TextSize = 13

-- ESP Button (Roles Colors)
EspBtn.Parent = MainFrame
EspBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
EspBtn.Position = UDim2.new(0.1, 0, 0.30, 0)
EspBtn.Size = UDim2.new(0.8, 0, 0, 30)
EspBtn.Font = Enum.Font.SourceSansBold
EspBtn.Text = "Role ESP: OFF"
EspBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
EspBtn.TextSize = 13

-- Gun TP Button (الذهاب للمسدس والرجوع)
GunTpBtn.Parent = MainFrame
GunTpBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
GunTpBtn.Position = UDim2.new(0.1, 0, 0.45, 0)
GunTpBtn.Size = UDim2.new(0.8, 0, 0, 30)
GunTpBtn.Font = Enum.Font.SourceSansBold
GunTpBtn.Text = "Auto Gun: OFF"
GunTpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
GunTpBtn.TextSize = 13

-- TP Loop Button
TpLoopBtn.Parent = MainFrame
TpLoopBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
TpLoopBtn.Position = UDim2.new(0.1, 0, 0.60, 0)
TpLoopBtn.Size = UDim2.new(0.8, 0, 0, 30)
TpLoopBtn.Font = Enum.Font.SourceSansBold
TpLoopBtn.Text = "TP Loop: OFF"
TpLoopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TpLoopBtn.TextSize = 13

-- Auto Fire Button
AutoFireBtn.Parent = MainFrame
AutoFireBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
AutoFireBtn.Position = UDim2.new(0.1, 0, 0.75, 0)
AutoFireBtn.Size = UDim2.new(0.8, 0, 0, 30)
AutoFireBtn.Font = Enum.Font.SourceSansBold
AutoFireBtn.Text = "Auto Fire: OFF"
AutoFireBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoFireBtn.TextSize = 13

-- Minimize Logic
local minimized = false
MinimizeBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    AimbotBtn.Visible = not minimized
    EspBtn.Visible = not minimized
    GunTpBtn.Visible = not minimized
    TpLoopBtn.Visible = not minimized
    AutoFireBtn.Visible = not minimized
    if minimized then
        MainFrame.Size = UDim2.new(0, 170, 0, 30)
        MinimizeBtn.Text = "+"
    else
        MainFrame.Size = UDim2.new(0, 170, 0, 275)
        MinimizeBtn.Text = "-"
    end
end)

-- Toggle Aimbot
AimbotBtn.MouseButton1Click:Connect(function()
    AimbotEnabled = not AimbotEnabled
    AimbotBtn.Text = AimbotEnabled and "Aimbot: ON" or "Aimbot: OFF"
    AimbotBtn.BackgroundColor3 = AimbotEnabled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(0, 100, 255)
end)

-- Role ESP Logic (MM2 Roles)
local function getRole(player)
    if player.Character then
        if player.Character:FindFirstChild("Knife") or player.Backpack:FindFirstChild("Knife") then
            return "Murderer"
        elseif player.Character:FindFirstChild("Gun") or player.Backpack:FindFirstChild("Gun") then
            return "Sheriff"
        end
    end
    return "Innocent"
end

local function updateESPForPlayer(player)
    if player == LocalPlayer then return end
    if player.Character then
        local char = player.Character
        local highlight = char:FindFirstChild("MM2Highlight")
        if ESPEnabled then
            if not highlight then
                highlight = Instance.new("Highlight")
                highlight.Name = "MM2Highlight"
                highlight.Adornee = char
                highlight.FillTransparency = 0.5
                highlight.OutlineTransparency = 0
                highlight.Parent = char
            end
            
            local role = getRole(player)
            if role == "Murderer" then
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            elseif role == "Sheriff" then
                highlight.FillColor = Color3.fromRGB(0, 100, 255)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            else
                highlight.FillColor = Color3.fromRGB(0, 255, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            end
        else
            if highlight then highlight:Destroy() end
        end
    end
end

EspBtn.MouseButton1Click:Connect(function()
    ESPEnabled = not ESPEnabled
    EspBtn.Text = ESPEnabled and "Role ESP: ON" or "Role ESP: OFF"
    EspBtn.BackgroundColor3 = ESPEnabled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(0, 100, 255)
    for _, p in ipairs(Players:GetPlayers()) do updateESPForPlayer(p) end
end)

-- Fast Auto Gun Teleport (معدل ليلقط المسدس فوراً وبدقة عالية)
GunTpBtn.MouseButton1Click:Connect(function()
    GunTpEnabled = not GunTpEnabled
    GunTpBtn.Text = GunTpEnabled and "Auto Gun: ON" or "Auto Gun: OFF"
    GunTpBtn.BackgroundColor3 = GunTpEnabled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(0, 100, 255)
end)

task.spawn(function()
    while true do
        if GunTpEnabled then
            pcall(function()
                local gunPart = nil
                -- البحث الشامل عن المسدس في الماب
                for _, obj in ipairs(workspace:GetDescendants()) do
                    if obj.Name == "GunDrop" or obj.Name == "DroppedGun" or (obj.Name:lower():find("gun") and obj:IsA("BasePart") and obj.Parent and obj.Parent.Name:lower():find("drop")) then
                        gunPart = obj
                        break
                    end
                end
                
                -- لو لقى الـ Handle أو البارت الأساسي للمسدس
                if not gunPart then
                    for _, v in ipairs(workspace:GetChildren()) do
                        if v:IsA("Model") and v.Name:lower():find("gun") then
                            gunPart = v:FindFirstChild("Handle") or v.PrimaryPart or v:FindFirstChildWhichIsA("BasePart")
                            break
                        end
                    end
                end

                if gunPart then
                    local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if myRoot then
                        local originalPos = myRoot.CFrame
                        -- الانتقال السريع للمسدس
                        myRoot.CFrame = gunPart.CFrame
                        task.wait(0.1)
                        -- الرجوع الفوري لمكانك الأصلي
                        myRoot.CFrame = originalPos
                    end
                end
            end)
        end
        task.wait(0.2)
    end
end)

-- Toggle TP Loop
TpLoopBtn.MouseButton1Click:Connect(function()
    TpLoopEnabled = not TpLoopEnabled
    TpLoopBtn.Text = TpLoopEnabled and "TP Loop: ON" or "TP Loop: OFF"
    TpLoopBtn.BackgroundColor3 = TpLoopEnabled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(0, 100, 255)
end)

-- Toggle Auto Fire
AutoFireBtn.MouseButton1Click:Connect(function()
    AutoFireEnabled = not AutoFireEnabled
    AutoFireBtn.Text = AutoFireEnabled and "Auto Fire: ON" or "Auto Fire: OFF"
    AutoFireBtn.BackgroundColor3 = AutoFireEnabled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(0, 100, 255)
end)

-- Wall Check & Aimbot Target
local function isVisible(targetPart)
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("Head") then return false end
    local rayParams = RaycastParams.new()
    rayParams.FilterType = Enum.RaycastFilterType.Blacklist
    rayParams.FilterDescendantsInstances = {character, targetPart.Parent}
    local result = workspace:Raycast(Camera.CFrame.Position, targetPart.Position - Camera.CFrame.Position, rayParams)
    if result then return false else return true end
end

local function getClosestTarget()
    local closestDist = math.huge
    local bestTarget = nil
    local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not myRoot then return nil end
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild(AimPart) then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.Health > 0 then
                local part = player.Character[AimPart]
                if isVisible(part) then
                    local dist = (myRoot.Position - part.Position).Magnitude
                    if dist < closestDist then
                        closestDist = dist
                        bestTarget = part
                    end
                end
            end
        end
    end
    return bestTarget
end

-- Loops
task.spawn(function()
    while true do
        if TpLoopEnabled then
            local playersList = {}
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    local hum = p.Character:FindFirstChildOfClass("Humanoid")
                    if hum and hum.Health > 0 then
                        table.insert(playersList, p.Character.HumanoidRootPart)
                    end
                end
            end
            if #playersList > 0 and TpLoopEnabled then
                local randomTargetHrp = playersList[math.random(1, #playersList)]
                local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if myRoot and randomTargetHrp then
                    myRoot.CFrame = randomTargetHrp.CFrame * CFrame.new(0, 0, 2)
                end
            end
            task.wait(0.4)
        else
            task.wait(0.5)
        end
    end
end)

task.spawn(function()
    while true do
        if AutoFireEnabled then
            pcall(function()
                VirtualUser:Button1Down(Vector2.new(0,0))
                task.wait(0.05)
                VirtualUser:Button1Up(Vector2.new(0,0))
            end)
            task.wait(0.1)
        else
            task.wait(0.3)
        end
    end
end)

RunService.RenderStepped:Connect(function()
    if AimbotEnabled then
        local target = getClosestTarget()
        if target then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Position)
        end
    end
    
    if ESPEnabled then
        for _, p in ipairs(Players:GetPlayers()) do
            updateESPForPlayer(p)
        end

 end

   end) 
-- Spex MM2 Pure Murderer Aimbot
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local AimbotEnabled = false
local AimPart = "Head" -- تقدر تخليها "HumanoidRootPart" لو عايز على البطن

-- Create Simple GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ToggleBtn = Instance.new("TextButton")
local PartBtn = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "SpexPureAimbot"

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.05, 0, 0.4, 0)
MainFrame.Size = UDim2.new(0, 150, 0, 100)
MainFrame.Active = true
MainFrame.Draggable = true

Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Title.Size = UDim2.new(1, 0, 0, 25)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "MM2 Murderer Lock"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize, Title.TextSize = 13, 13

ToggleBtn.Parent = MainFrame
ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
ToggleBtn.Position = UDim2.new(0.1, 0, 0.35, 0)
ToggleBtn.Size = UDim2.new(0.8, 0, 0, 30)
ToggleBtn.Font = Enum.Font.SourceSansBold
ToggleBtn.Text = "Aimbot: OFF"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.TextSize = 14

PartBtn.Parent = MainFrame
PartBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
PartBtn.Position = UDim2.new(0.1, 0, 0.70, 0)
PartBtn.Size = UDim2.new(0.8, 0, 0, 24)
PartBtn.Font = Enum.Font.SourceSansBold
PartBtn.Text = "Lock: Head"
PartBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PartBtn.TextSize = 12

ToggleBtn.MouseButton1Click:Connect(function()
    AimbotEnabled = not AimbotEnabled
    ToggleBtn.Text = AimbotEnabled and "Aimbot: ON" or "Aimbot: OFF"
    ToggleBtn.BackgroundColor3 = AimbotEnabled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(0, 100, 255)
end)

PartBtn.MouseButton1Click:Connect(function()
    if AimPart == "Head" then
        AimPart = "HumanoidRootPart"
        PartBtn.Text = "Lock: Torso"
    else
        AimPart = "Head"
        PartBtn.Text = "Lock: Head"
    end
end)

-- Find Murderer Function
local function getMurderer()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            if player.Character:FindFirstChild("Knife") or player.Backpack:FindFirstChild("Knife") then
                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid and humanoid.Health > 0 then
                    local part = player.Character:FindFirstChild(AimPart)
                    if part then
                        return part
                    end
                end
            end
        end
    end
    return nil
end

-- Lock on Murderer Loop
RunService.RenderStepped:Connect(function()
    if AimbotEnabled then
        local murdererPart = getMurderer()
        if murdererPart then
            -- ثبات 100% وتوجيه الكاميرا فوراً على القاتل
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, murdererPart.Position)
        end
    end
end)