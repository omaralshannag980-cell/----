local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local PlayerGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
PlayerGui.Name = "lansher🇦🇱"
PlayerGui.ResetOnSpawn = false

local NotificationsGui = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
NotificationsGui.Name = "Notifications_lansher"
NotificationsGui.ResetOnSpawn = false

local Frame = Instance.new("Frame", PlayerGui)
Frame.Size = UDim2.new(0, 420, 0, 400)
Frame.Position = UDim2.new(0.5, -210, 0.5, -150)
Frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Frame.Visible = false
Frame.Active = true
Frame.Draggable = false
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 12)

local Shadow = Instance.new("ImageLabel", Frame)
Shadow.ZIndex = -1
Shadow.Size = UDim2.new(1, 30, 1, 30)
Shadow.Position = UDim2.new(0, -15, 0, -15)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://1316045217"
Shadow.ImageColor3 = Color3.fromRGB(128, 0, 128)
Shadow.ImageTransparency = 0.4

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundColor3 = Color3.fromRGB(20, 0, 20)
Title.Font = Enum.Font.GothamBlack
Title.TextColor3 = Color3.fromRGB(200, 50, 200)
Title.Text = "lansher🇦🇱 / لانشر🇦🇱"
Title.TextSize = 18
Instance.new("UICorner", Title).CornerRadius = UDim.new(0, 12)

local Button = Instance.new("TextButton", PlayerGui)
Button.Size = UDim2.new(0, 180, 0, 45)
Button.Position = UDim2.new(1, -350, 0, -50)
Button.BackgroundColor3 = Color3.fromRGB(15, 0, 15)
Button.Text = "lansher🇦🇱 / لانشر🇦🇱"
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Font = Enum.Font.GothamBold
Button.TextSize = 14
Button.ZIndex = 10
Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 8)

local AllPlayersStats = {}
local PlayersData = {}
local num = 55
local spacing = 5
local num2 = 40

local function formatPlayerTime(t)
    local hours = math.floor(t / 3600)
    local minutes = math.floor((t % 3600) / 60)
    local seconds = math.floor(t % 60)
    return string.format("%02d:%02d:%02d", hours, minutes, seconds)
end

local function showNotification(message, color)
    local Notification = Instance.new("Frame", NotificationsGui)
    Notification.Size = UDim2.new(0, 280, 0, 80)
    Notification.Position = UDim2.new(1, 300, 0, 20)
    Notification.BackgroundColor3 = Color3.fromRGB(20, 0, 20)
    Notification.BorderSizePixel = 0
    Instance.new("UICorner", Notification).CornerRadius = UDim.new(0, 12)

    local Glow = Instance.new("ImageLabel", Notification)
    Glow.Size = UDim2.new(1, 25, 1, 25)
    Glow.Position = UDim2.new(0, -12, 0, -12)
    Glow.BackgroundTransparency = 1
    Glow.Image = "rbxassetid://1316045217"
    Glow.ImageColor3 = color
    Glow.ImageTransparency = 0.5
    Glow.ZIndex = -1

    local MessageLabel = Instance.new("TextLabel", Notification)
    MessageLabel.Size = UDim2.new(0.9, 0, 0.8, 0)
    MessageLabel.Position = UDim2.new(0.05, 0, 0.1, 0)
    MessageLabel.BackgroundTransparency = 1
    MessageLabel.TextColor3 = Color3.new(1, 1, 1)
    MessageLabel.Text = message
    MessageLabel.Font = Enum.Font.GothamBold
    MessageLabel.TextSize = 14
    MessageLabel.TextScaled = false

    local tweenInfo = TweenService:Create(Notification, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -300, 0, 20)
    })
    tweenInfo:Play()

    task.delay(3, function()
        local exitTween = TweenService:Create(Notification, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Position = UDim2.new(1, 300, 0, 20)
        })
        exitTween:Play()
        exitTween.Completed:Connect(function()
            Notification:Destroy()
        end)
    end)
end

local ScrollFrame = Instance.new("ScrollingFrame", Frame)
ScrollFrame.Size = UDim2.new(0.95, 0, 0, 350)
ScrollFrame.Position = UDim2.new(0.025, 0, 0, 50)
ScrollFrame.BackgroundColor3 = Color3.fromRGB(5, 0, 5)
ScrollFrame.ScrollBarThickness = 8
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, num2 * (num + spacing))
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(128, 0, 128)

for i = 1, num2 do
    local PFrame = Instance.new("Frame", ScrollFrame)
    PFrame.Size = UDim2.new(1, 0, 0, num)
    PFrame.Position = UDim2.new(0, 0, 0, (i - 1) * (num + spacing))
    PFrame.BackgroundColor3 = Color3.fromRGB(18, 0, 18)
    PFrame.BorderSizePixel = 2
    PFrame.BorderColor3 = Color3.fromRGB(128, 0, 128)
    Instance.new("UICorner", PFrame).CornerRadius = UDim.new(0, 10)

    if i > 1 then
        local Separator = Instance.new("Frame", PFrame)
        Separator.Size = UDim2.new(1, 0, 0, 3)
        Separator.Position = UDim2.new(0, 0, 0, -3)
        Separator.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
        Separator.BorderSizePixel = 0
    end

    local ImageContainer = Instance.new("Frame", PFrame)
    ImageContainer.Size = UDim2.new(0, 70, 1, 0)
    ImageContainer.Position = UDim2.new(0, 0, 0, 0)
    ImageContainer.BackgroundColor3 = Color3.fromRGB(25, 0, 25)
    ImageContainer.BorderSizePixel = 0
    Instance.new("UICorner", ImageContainer).CornerRadius = UDim.new(0, 10)

    local Image = Instance.new("ImageLabel", ImageContainer)
    Image.Size = UDim2.new(0, 50, 0, 50)
    Image.Position = UDim2.new(0.5, -25, 0.5, -25)
    Image.BackgroundColor3 = Color3.fromRGB(40, 0, 40)
    Image.BorderSizePixel = 2
    Image.BorderColor3 = Color3.fromRGB(128, 0, 128)
    Instance.new("UICorner", Image).CornerRadius = UDim.new(0, 8)

    local PlayerNameLabel = Instance.new("TextLabel", ImageContainer)
    PlayerNameLabel.Size = UDim2.new(1, 0, 0, 14)
    PlayerNameLabel.Position = UDim2.new(0, 0, 0.85, 0)
    PlayerNameLabel.BackgroundTransparency = 1
    PlayerNameLabel.Font = Enum.Font.GothamBold
    PlayerNameLabel.TextColor3 = Color3.new(1, 1, 1)
    PlayerNameLabel.TextSize = 10
    PlayerNameLabel.TextXAlignment = Enum.TextXAlignment.Center
    PlayerNameLabel.Text = ""

    local DataContainer = Instance.new("Frame", PFrame)
    DataContainer.Size = UDim2.new(1, -75, 1, -10)
    DataContainer.Position = UDim2.new(0, 75, 0, 5)
    DataContainer.BackgroundTransparency = 1

    local TextBox = Instance.new("TextBox", DataContainer)
    TextBox.PlaceholderText = "اسم اللاعب " .. i
    TextBox.Size = UDim2.new(0.65, 0, 0, 26)
    TextBox.Position = UDim2.new(0, 0, 0, 0)
    TextBox.BackgroundColor3 = Color3.fromRGB(30, 0, 30)
    TextBox.TextColor3 = Color3.new(1, 1, 1)
    TextBox.Font = Enum.Font.GothamSemibold
    TextBox.TextSize = 12
    TextBox.ClearTextOnFocus = true
    TextBox.BorderSizePixel = 1
    TextBox.BorderColor3 = Color3.fromRGB(128, 0, 128)
    Instance.new("UICorner", TextBox).CornerRadius = UDim.new(0, 6)

    local StatsContainer = Instance.new("Frame", DataContainer)
    StatsContainer.Size = UDim2.new(1, 0, 0, 25)
    StatsContainer.Position = UDim2.new(0, 0, 0, 28)
    StatsContainer.BackgroundTransparency = 1

    local JoinLabel = Instance.new("TextLabel", StatsContainer)
    JoinLabel.Size = UDim2.new(0.25, 0, 1, 0)
    JoinLabel.Position = UDim2.new(0, 0, 0, 0)
    JoinLabel.BackgroundTransparency = 1
    JoinLabel.Font = Enum.Font.GothamBold
    JoinLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    JoinLabel.Text = "دخول:0"
    JoinLabel.TextSize = 11
    JoinLabel.TextXAlignment = Enum.TextXAlignment.Left

    local LeaveLabel = Instance.new("TextLabel", StatsContainer)
    LeaveLabel.Size = UDim2.new(0.25, 0, 1, 0)
    LeaveLabel.Position = UDim2.new(0.27, 0, 0, 0)
    LeaveLabel.BackgroundTransparency = 1
    LeaveLabel.Font = Enum.Font.GothamBold
    LeaveLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    LeaveLabel.Text = "خروج:0"
    LeaveLabel.TextSize = 11
    LeaveLabel.TextXAlignment = Enum.TextXAlignment.Left

    local TimeLabel = Instance.new("TextLabel", StatsContainer)
    TimeLabel.Size = UDim2.new(0.75, 0, 1, 0)
    TimeLabel.Position = UDim2.new(0.25, 0, 0, 0)
    TimeLabel.BackgroundTransparency = 1
    TimeLabel.Font = Enum.Font.GothamBold
    TimeLabel.TextColor3 = Color3.fromRGB(200, 100, 200)
    TimeLabel.Text = "00:00:00"
    TimeLabel.TextSize = 12
    TimeLabel.TextXAlignment = Enum.TextXAlignment.Right

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
        isTargeted = false
    }

    TextBox:GetPropertyChangedSignal("Text"):Connect(function()
        local text = TextBox.Text
        local pdata = PlayersData[i]

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
                if pdata.currentPlayer == target then
                    TextBox.Text = target.Name
                    return
                end

                if pdata.currentPlayer then
                    if not AllPlayersStats[pdata.currentPlayer.UserId] then
                        AllPlayersStats[pdata.currentPlayer.UserId] = {JoinCount = 0, LeaveCount = 0, Time = 0}
                    end
                    AllPlayersStats[pdata.currentPlayer.UserId].Time = pdata.Time
                end

                TextBox.Text = target.Name
                pdata.currentPlayer = target
                pdata.isTargeted = true
                Image.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. target.UserId .. "&width=150&height=150&format=png"
                PlayerNameLabel.Text = string.sub(target.DisplayName, 1, 8)
                pdata.Running = true

                if not AllPlayersStats[target.UserId] then
                    AllPlayersStats[target.UserId] = {JoinCount = 0, LeaveCount = 0, Time = 0}
                end
                pdata.Time = AllPlayersStats[target.UserId].Time or 0

                local stats = AllPlayersStats[target.UserId]
                JoinLabel.Text = "دخول:" .. stats.JoinCount
                LeaveLabel.Text = "خروج:" .. stats.LeaveCount
                TimeLabel.Text = formatPlayerTime(pdata.Time)
            end
        elseif #text == 0 then
            if pdata.currentPlayer then
                if not AllPlayersStats[pdata.currentPlayer.UserId] then
                    AllPlayersStats[pdata.currentPlayer.UserId] = {JoinCount = 0, LeaveCount = 0, Time = 0}
                end
                AllPlayersStats[pdata.currentPlayer.UserId].Time = pdata.Time
            end

            pdata.currentPlayer = nil
            pdata.isTargeted = false
            Image.Image = ""
            PlayerNameLabel.Text = ""
            pdata.Running = false
            pdata.Time = 0
            JoinLabel.Text = "دخول:0"
            LeaveLabel.Text = "خروج:0"
            TimeLabel.Text = "00:00:00"
        end
    end)
end

RunService.Heartbeat:Connect(function(deltaTime)
    for i = 1, num2 do
        local pdata = PlayersData[i]
        if pdata.currentPlayer and pdata.Running and pdata.currentPlayer ~= LocalPlayer then
            pdata.Time = pdata.Time + deltaTime
            pdata.TimeLabel.Text = formatPlayerTime(pdata.Time)
        end
    end
end)

Players.PlayerAdded:Connect(function(pl)
    if pl == LocalPlayer then return end
    if not AllPlayersStats[pl.UserId] then
        AllPlayersStats[pl.UserId] = { JoinCount = 0, LeaveCount = 0, Time = 0 }
    end
    AllPlayersStats[pl.UserId].JoinCount = AllPlayersStats[pl.UserId].JoinCount + 1

    for i = 1, num2 do
        local pdata = PlayersData[i]
        if pdata.currentPlayer and pdata.currentPlayer.UserId == pl.UserId then
            pdata.JoinLabel.Text = "دخول:" .. AllPlayersStats[pl.UserId].JoinCount
            pdata.Running = true
            pdata.Time = AllPlayersStats[pl.UserId].Time
            pdata.TimeLabel.Text = formatPlayerTime(pdata.Time)
            showNotification("🟢 دخل: " .. pl.DisplayName, Color3.fromRGB(0, 150, 0))
        end
    end
end)

Players.PlayerRemoving:Connect(function(pl)
    if pl == LocalPlayer then return end
    if not AllPlayersStats[pl.UserId] then
        AllPlayersStats[pl.UserId] = { JoinCount = 0, LeaveCount = 0, Time = 0 }
    end
    AllPlayersStats[pl.UserId].LeaveCount = AllPlayersStats[pl.UserId].LeaveCount + 1

    for i = 1, num2 do
        local pdata = PlayersData[i]
        if pdata.currentPlayer and pdata.currentPlayer.UserId == pl.UserId then
            pdata.LeaveLabel.Text = "خروج:" .. AllPlayersStats[pl.UserId].LeaveCount
            pdata.Running = false
            AllPlayersStats[pl.UserId].Time = pdata.Time
            showNotification("🔴 خرج: " .. pl.DisplayName, Color3.fromRGB(150, 0, 0))
        end
    end
end)

local function toggleFrame()
    if Frame.Visible == false then
        Frame.Visible = true
        Frame.Size = UDim2.new(0, 0, 0, 0)
        local tween = TweenService:Create(Frame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(0, 420, 0, 400) })
        tween:Play()
    else
        local tween = TweenService:Create(Frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Size = UDim2.new(0, 0, 0, 0) })
        tween:Play()
        tween.Completed:Connect(function()
            Frame.Visible = false
            Frame.Size = UDim2.new(0, 420, 0, 400)
        end)
    end
end

Button.MouseButton1Click:Connect(toggleFrame)

print("lansher🇦🇱 / لانشر🇦🇱")
