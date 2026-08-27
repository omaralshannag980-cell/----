--[[
    🇦🇱 لانشر / lansher🇦🇱
    نسخة الجوال فقط
]]

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

-- تحقق أنه جهاز جوال فقط
if not UserInputService.TouchEnabled then
    return
end

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "🇦🇱 لانشر / lansher🇦🇱"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local NotificationsGui = Instance.new("ScreenGui")
NotificationsGui.Name = "Notifications"
NotificationsGui.ResetOnSpawn = false
NotificationsGui.IgnoreGuiInset = true
NotificationsGui.Parent = LocalPlayer.PlayerGui

-- دالة تنسيق الوقت
local function formatPlayerTime(t)
    local h = math.floor(t / 3600)
    local m = math.floor((t % 3600) / 60)
    local s = math.floor(t % 60)
    return string.format("%02d:%02d:%02d", h, m, s)
end

-- دالة إشعار
local function showNotification(message, color)
    local Notification = Instance.new("Frame")
    Notification.Size = UDim2.new(0, 260, 0, 70)
    Notification.Position = UDim2.new(1, -280, 0, 10)
    Notification.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
    Notification.BorderSizePixel = 0
    Notification.Parent = NotificationsGui
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = Notification

    local Glow = Instance.new("ImageLabel")
    Glow.Size = UDim2.new(1, 25, 1, 25)
    Glow.Position = UDim2.new(0, -12, 0, -12)
    Glow.BackgroundTransparency = 1
    Glow.Image = "rbxassetid://1316045217"
    Glow.ImageColor3 = color
    Glow.ImageTransparency = 0.5
    Glow.ZIndex = -1
    Glow.Parent = Notification

    local MessageLabel = Instance.new("TextLabel")
    MessageLabel.Size = UDim2.new(0.9, 0, 0.8, 0)
    MessageLabel.Position = UDim2.new(0.05, 0, 0.1, 0)
    MessageLabel.BackgroundTransparency = 1
    MessageLabel.TextColor3 = Color3.new(1, 1, 1)
    MessageLabel.Text = message
    MessageLabel.Font = Enum.Font.GothamBold
    MessageLabel.TextSize = 14
    MessageLabel.TextScaled = false
    MessageLabel.Parent = Notification

    Notification.Position = UDim2.new(1, 300, 0, 10)
    local tweenInfo = TweenService:Create(Notification, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -280, 0, 10)
    })
    tweenInfo:Play()

    wait(3)
    local exitTween = TweenService:Create(Notification, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Position = UDim2.new(1, 300, 0, 10)
    })
    exitTween:Play()
    exitTween.Completed:Connect(function()
        Notification:Destroy()
    end)
end

-- الإطار الرئيسي
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 390, 0, 380)
MainFrame.Position = UDim2.new(0.5, -195, 0.5, -190)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 0, 0)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = false
MainFrame.Parent = ScreenGui
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local Shadow = Instance.new("ImageLabel")
Shadow.ZIndex = -1
Shadow.Size = UDim2.new(1, 30, 1, 30)
Shadow.Position = UDim2.new(0, -15, 0, -15)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://1316045217"
Shadow.ImageColor3 = Color3.fromRGB(100, 0, 0)
Shadow.ImageTransparency = 0.4
Shadow.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
Title.Font = Enum.Font.GothamBlack
Title.TextColor3 = Color3.fromRGB(255, 50, 50)
Title.Text = "🇦🇱 لانشر / lansher🇦🇱"
Title.TextSize = 18
Title.Parent = MainFrame
local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = Title

-- زر فتح القائمة (ظاهر للجوال)
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 180, 0, 45)
ToggleButton.Position = UDim2.new(1, -190, 0, 10)
ToggleButton.BackgroundColor3 = Color3.fromRGB(15, 0, 0)
ToggleButton.Text = "🇦🇱 لانشر / lansher🇦🇱"
ToggleButton.TextColor3 = Color3.new(1, 1, 1)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 14
ToggleButton.ZIndex = 10
ToggleButton.Parent = ScreenGui
local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 8)
BtnCorner.Parent = ToggleButton

-- بيانات
local AllPlayersStats = {}
local PlayersData = {}
local num = 55
local spacing = 5
local num2 = 40

-- قائمة التمرير
local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Size = UDim2.new(0.95, 0, 0, 330)
ScrollFrame.Position = UDim2.new(0.025, 0, 0, 50)
ScrollFrame.BackgroundColor3 = Color3.fromRGB(5, 0, 0)
ScrollFrame.ScrollBarThickness = 8
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, num2 * (num + spacing))
ScrollFrame.Parent = MainFrame

-- إنشاء 40 مكان استهداف
for i = 1, num2 do
    local PFrame = Instance.new("Frame")
    PFrame.Size = UDim2.new(1, 0, 0, num)
    PFrame.Position = UDim2.new(0, 0, 0, (i - 1) * (num + spacing))
    PFrame.BackgroundColor3 = Color3.fromRGB(18, 0, 0)
    PFrame.BorderSizePixel = 2
    PFrame.BorderColor3 = Color3.fromRGB(80, 0, 0)
    PFrame.Parent = ScrollFrame
    local PFrameCorner = Instance.new("UICorner")
    PFrameCorner.CornerRadius = UDim.new(0, 10)
    PFrameCorner.Parent = PFrame

    if i > 1 then
        local Separator = Instance.new("Frame")
        Separator.Size = UDim2.new(1, 0, 0, 3)
        Separator.Position = UDim2.new(0, 0, 0, -3)
        Separator.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
        Separator.BorderSizePixel = 0
        Separator.Parent = PFrame
    end

    local ImageContainer = Instance.new("Frame")
    ImageContainer.Size = UDim2.new(0, 70, 1, 0)
    ImageContainer.Position = UDim2.new(0, 0, 0, 0)
    ImageContainer.BackgroundColor3 = Color3.fromRGB(25, 0, 0)
    ImageContainer.BorderSizePixel = 0
    ImageContainer.Parent = PFrame
    local ImgContainerCorner = Instance.new("UICorner")
    ImgContainerCorner.CornerRadius = UDim.new(0, 10)
    ImgContainerCorner.Parent = ImageContainer

    local Image = Instance.new("ImageLabel")
    Image.Size = UDim2.new(0, 50, 0, 50)
    Image.Position = UDim2.new(0.5, -25, 0.5, -25)
    Image.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
    Image.BorderSizePixel = 2
    Image.BorderColor3 = Color3.fromRGB(100, 0, 0)
    Image.Parent = ImageContainer
    local ImageCorner = Instance.new("UICorner")
    ImageCorner.CornerRadius = UDim.new(0, 8)
    ImageCorner.Parent = Image

    local PlayerNameLabel = Instance.new("TextLabel")
    PlayerNameLabel.Size = UDim2.new(1, 0, 0, 14)
    PlayerNameLabel.Position = UDim2.new(0, 0, 0.85, 0)
    PlayerNameLabel.BackgroundTransparency = 1
    PlayerNameLabel.Font = Enum.Font.GothamBold
    PlayerNameLabel.TextColor3 = Color3.new(1, 1, 1)
    PlayerNameLabel.TextSize = 10
    PlayerNameLabel.TextXAlignment = Enum.TextXAlignment.Center
    PlayerNameLabel.Text = ""
    PlayerNameLabel.Parent = ImageContainer

    local DataContainer = Instance.new("Frame")
    DataContainer.Size = UDim2.new(1, -75, 1, -10)
    DataContainer.Position = UDim2.new(0, 75, 0, 5)
    DataContainer.BackgroundTransparency = 1
    DataContainer.Parent = PFrame

    local TextBox = Instance.new("TextBox")
    TextBox.PlaceholderText = "اسم اللاعب " .. i
    TextBox.Size = UDim2.new(0.65, 0, 0, 26)
    TextBox.Position = UDim2.new(0, 0, 0, 0)
    TextBox.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
    TextBox.TextColor3 = Color3.new(1, 1, 1)
    TextBox.Font = Enum.Font.GothamSemibold
    TextBox.TextSize = 12
    TextBox.ClearTextOnFocus = true
    TextBox.BorderSizePixel = 1
    TextBox.BorderColor3 = Color3.fromRGB(70, 0, 0)
    TextBox.Parent = DataContainer
    local TextBoxCorner = Instance.new("UICorner")
    TextBoxCorner.CornerRadius = UDim.new(0, 6)
    TextBoxCorner.Parent = TextBox

    local StatsContainer = Instance.new("Frame")
    StatsContainer.Size = UDim2.new(1, 0, 0, 25)
    StatsContainer.Position = UDim2.new(0, 0, 0, 28)
    StatsContainer.BackgroundTransparency = 1
    StatsContainer.Parent = DataContainer

    local JoinLabel = Instance.new("TextLabel")
    JoinLabel.Size = UDim2.new(0.25, 0, 1, 0)
    JoinLabel.Position = UDim2.new(0, 0, 0, 0)
    JoinLabel.BackgroundTransparency = 1
    JoinLabel.Font = Enum.Font.GothamBold
    JoinLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    JoinLabel.Text = "دخول:0"
    JoinLabel.TextSize = 11
    JoinLabel.TextXAlignment = Enum.TextXAlignment.Left
    JoinLabel.Parent = StatsContainer

    local LeaveLabel = Instance.new("TextLabel")
    LeaveLabel.Size = UDim2.new(0.25, 0, 1, 0)
    LeaveLabel.Position = UDim2.new(0.27, 0, 0, 0)
    LeaveLabel.BackgroundTransparency = 1
    LeaveLabel.Font = Enum.Font.GothamBold
    LeaveLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    LeaveLabel.Text = "خروج:0"
    LeaveLabel.TextSize = 11
    LeaveLabel.TextXAlignment = Enum.TextXAlignment.Left
    LeaveLabel.Parent = StatsContainer

    local TimeLabel = Instance.new("TextLabel")
    TimeLabel.Size = UDim2.new(0.75, 0, 1, 0)
    TimeLabel.Position = UDim2.new(0.25, 0, 0, 0)
    TimeLabel.BackgroundTransparency = 1
    TimeLabel.Font = Enum.Font.GothamBold
    TimeLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    TimeLabel.Text = "00:00:00"
    TimeLabel.TextSize = 12
    TimeLabel.TextXAlignment = Enum.TextXAlignment.Right
    TimeLabel.Parent = StatsContainer

    PlayersData[i] = {
        TextBox = TextBox,
        Image = Image,
        PlayerNameLabel = PlayerNameLabel,
        JoinLabel = JoinLabel,
        LeaveLabel = LeaveLabel,
        TimeLabel = TimeLabel,
        Time = 0,
        Running = false,
        currentPlayer = nil,
        isTargeted = false,
    }

    TextBox:GetPropertyChangedSignal("Text"):Connect(function()
        local text = TextBox.Text
        if #text >= 2 then
            local exactMatch = nil
            local partialMatch = nil
            for _, pl in pairs(Players:GetPlayers()) do
                if pl ~= LocalPlayer then
                    local nameLower = pl.Name:lower()
                    local displayLower = pl.DisplayName:lower()
                    local searchLower = text:lower()
                    if nameLower == searchLower or displayLower == searchLower then
                        exactMatch = pl
                        break
                    elseif nameLower:find(searchLower, 1, true) or displayLower:find(searchLower, 1, true) then
                        partialMatch = pl
                    end
                end
            end
            local target = exactMatch or partialMatch
            if target then
                TextBox.Text = target.Name
                PlayersData[i].currentPlayer = target
                PlayersData[i].isTargeted = true
                Image.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. target.UserId .. "&width=150&height=150&format=png"
                PlayerNameLabel.Text = string.sub(target.DisplayName, 1, 8)
                PlayersData[i].Running = true
                PlayersData[i].Time = AllPlayersStats[target.UserId] and AllPlayersStats[target.UserId].Time or 0
                local stats = AllPlayersStats[target.UserId] or { JoinCount = 0, LeaveCount = 0, Time = 0 }
                JoinLabel.Text = "دخول:" .. stats.JoinCount
                LeaveLabel.Text = "خروج:" .. stats.LeaveCount
                TimeLabel.Text = formatPlayerTime(stats.Time)
            end
        elseif #text == 0 then
            PlayersData[i].currentPlayer = nil
            PlayersData[i].isTargeted = false
            Image.Image = ""
            PlayerNameLabel.Text = ""
            PlayersData[i].Running = false
            JoinLabel.Text = "دخول:0"
            LeaveLabel.Text = "خروج:0"
            TimeLabel.Text = "00:00:00"
        end
    end)
end

-- تحديث الوقت
RunService.Heartbeat:Connect(function(deltaTime)
    for i = 1, num2 do
        local data = PlayersData[i]
        if data.currentPlayer and data.Running and data.currentPlayer ~= LocalPlayer then
            data.Time = data.Time + deltaTime
            data.TimeLabel.Text = formatPlayerTime(data.Time)
        end
    end
end)

-- دخول لاعب
Players.PlayerAdded:Connect(function(pl)
    if pl == LocalPlayer then return end
    if not AllPlayersStats[pl.UserId] then
        AllPlayersStats[pl.UserId] = { JoinCount = 0, LeaveCount = 0, Time = 0 }
    end
    AllPlayersStats[pl.UserId].JoinCount = AllPlayersStats[pl.UserId].JoinCount + 1

    for i = 1, num2 do
        local data = PlayersData[i]
        if data.currentPlayer and data.currentPlayer.UserId == pl.UserId then
            data.JoinLabel.Text = "دخول:" .. AllPlayersStats[pl.UserId].JoinCount
            data.Running = true
            data.Time = AllPlayersStats[pl.UserId].Time or 0
            showNotification("🟢 دخل: " .. pl.DisplayName, Color3.fromRGB(0, 150, 0))
        end
    end
end)

-- خروج لاعب
Players.PlayerRemoving:Connect(function(pl)
    if pl == LocalPlayer then return end
    if not AllPlayersStats[pl.UserId] then
        AllPlayersStats[pl.UserId] = { JoinCount = 0, LeaveCount = 0, Time = 0 }
    end
    AllPlayersStats[pl.UserId].LeaveCount = AllPlayersStats[pl.UserId].LeaveCount + 1

    for i = 1, num2 do
        local data = PlayersData[i]
        if data.currentPlayer and data.currentPlayer.UserId == pl.UserId then
            data.LeaveLabel.Text = "خروج:" .. AllPlayersStats[pl.UserId].LeaveCount
            data.Running = false
            AllPlayersStats[pl.UserId].Time = data.Time
            showNotification("🔴 خرج: " .. pl.DisplayName, Color3.fromRGB(150, 0, 0))
        end
    end
end)

-- فتح/غلق القائمة
local function toggleFrame()
    if MainFrame.Visible == false then
        MainFrame.Visible = true
        MainFrame.Size = UDim2.new(0, 0, 0, 0)
        local tween = TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 390, 0, 380)
        })
        tween:Play()
    else
        local tween = TweenService:Create(MainFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0)
        })
        tween:Play()
        tween.Completed:Connect(function()
            MainFrame.Visible = false
            MainFrame.Size = UDim2.new(0, 390, 0, 380)
        end)
    end
end

ToggleButton.MouseButton1Click:Connect(toggleFrame)

showNotification("✅ تم تشغيل لانشر على الجوال", Color3.fromRGB(0, 200, 0))
print("🇦🇱 لانشر / lansher🇦🇱 - نسخة الجوال")
