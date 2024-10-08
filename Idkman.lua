local Players = game:GetService("Players")

local function createAdminSystemGUI()
    -- Main GUI Setup
    local gui = Instance.new("ScreenGui")
    gui.Name = "AdminSystem"
    gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0.5, 0, 0.5, 0)
    mainFrame.Position = UDim2.new(0.25, 0, 0.25, 0)
    mainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    mainFrame.Parent = gui

    local UICorner = Instance.new("UICorner")
    UICorner.Parent = mainFrame

    -- Title
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0.2, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "Admin System"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextSize = 24
    titleLabel.Parent = mainFrame

    -- Create Script Button
    local createScriptButton = Instance.new("TextButton")
    createScriptButton.Size = UDim2.new(0.9, 0, 0.15, 0)
    createScriptButton.Position = UDim2.new(0.05, 0, 0.25, 0)
    createScriptButton.Text = "Create Script"
    createScriptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    createScriptButton.Font = Enum.Font.SourceSansBold
    createScriptButton.TextSize = 20
    createScriptButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    createScriptButton.BorderSizePixel = 0
    createScriptButton.Parent = mainFrame

    -- Set Player Health Button
    local setPlayerHealthButton = Instance.new("TextButton")
    setPlayerHealthButton.Size = UDim2.new(0.9, 0, 0.15, 0)
    setPlayerHealthButton.Position = UDim2.new(0.05, 0, 0.45, 0)
    setPlayerHealthButton.Text = "Set Player Health"
    setPlayerHealthButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    setPlayerHealthButton.Font = Enum.Font.SourceSansBold
    setPlayerHealthButton.TextSize = 20
    setPlayerHealthButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    setPlayerHealthButton.BorderSizePixel = 0
    setPlayerHealthButton.Parent = mainFrame

    -- Set Player Speed Button
    local setPlayerSpeedButton = Instance.new("TextButton")
    setPlayerSpeedButton.Size = UDim2.new(0.9, 0, 0.15, 0)
    setPlayerSpeedButton.Position = UDim2.new(0.05, 0, 0.65, 0)
    setPlayerSpeedButton.Text = "Set Player Speed"
    setPlayerSpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    setPlayerSpeedButton.Font = Enum.Font.SourceSansBold
    setPlayerSpeedButton.TextSize = 20
    setPlayerSpeedButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    setPlayerSpeedButton.BorderSizePixel = 0
    setPlayerSpeedButton.Parent = mainFrame

    -- Kill Player Button
    local killPlayerButton = Instance.new("TextButton")
    killPlayerButton.Size = UDim2.new(0.9, 0, 0.15, 0)
    killPlayerButton.Position = UDim2.new(0.05, 0, 0.85, 0)
    killPlayerButton.Text = "Kill Player"
    killPlayerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    killPlayerButton.Font = Enum.Font.SourceSansBold
    killPlayerButton.TextSize = 20
    killPlayerButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    killPlayerButton.BorderSizePixel = 0
    killPlayerButton.Parent = mainFrame

    -- Player Selection Dropdown for Actions
    local playerSelectionDropdown = Instance.new("TextButton")
    playerSelectionDropdown.Size = UDim2.new(0.9, 0, 0.15, 0)
    playerSelectionDropdown.Position = UDim2.new(0.05, 0, 1.05, 0)
    playerSelectionDropdown.Text = "Select Player"
    playerSelectionDropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
    playerSelectionDropdown.Font = Enum.Font.SourceSans
    playerSelectionDropdown.TextSize = 18
    playerSelectionDropdown.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    playerSelectionDropdown.BorderSizePixel = 0
    playerSelectionDropdown.Parent = mainFrame

    -- Health Input Box
    local healthInputBox = Instance.new("TextBox")
    healthInputBox.Size = UDim2.new(0.9, 0, 0.15, 0)
    healthInputBox.Position = UDim2.new(0.05, 0, 1.25, 0)
    healthInputBox.PlaceholderText = "Enter Health Value"
    healthInputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    healthInputBox.Font = Enum.Font.SourceSans
    healthInputBox.TextSize = 18
    healthInputBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    healthInputBox.BorderSizePixel = 0
    healthInputBox.Parent = mainFrame

    -- Speed Input Box
    local speedInputBox = Instance.new("TextBox")
    speedInputBox.Size = UDim2.new(0.9, 0, 0.15, 0)
    speedInputBox.Position = UDim2.new(0.05, 0, 1.45, 0)
    speedInputBox.PlaceholderText = "Enter Speed Value"
    speedInputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    speedInputBox.Font = Enum.Font.SourceSans
    speedInputBox.TextSize = 18
    speedInputBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    speedInputBox.BorderSizePixel = 0
    speedInputBox.Parent = mainFrame

    -- Open Script Creation GUI Functionality
    local function openScriptCreationGUI()
        -- Add functionality for creating Scripts
    end

    -- Set Player Health Functionality
    setPlayerHealthButton.MouseButton1Click:Connect(function()
        local playerName = playerSelectionDropdown.Text
        local player = Players:FindFirstChild(playerName)

        local healthValue = tonumber(healthInputBox.Text)
        if player and player.Character and player.Character:FindFirstChild("Humanoid") and healthValue then
            player.Character.Humanoid.Health = healthValue
            print("Set " .. playerName .. "'s health to " .. healthValue)
        else
            print("Invalid player name or health value.")
        end
    end)

    -- Set Player Speed Functionality
    setPlayerSpeedButton.MouseButton1Click:Connect(function()
        local playerName = playerSelectionDropdown.Text
        local player = Players:FindFirstChild(playerName)

        local speedValue = tonumber(speedInputBox.Text)
        if player and player.Character and player.Character:FindFirstChild("Humanoid") and speedValue then
            player.Character.Humanoid.WalkSpeed = speedValue
            print("Set " .. playerName .. "'s speed to " .. speedValue)
        else
            print("Invalid player name or speed value.")
        end
    end)

    -- Kill Player Functionality
    killPlayerButton.MouseButton1Click:Connect(function()
        local playerName = playerSelectionDropdown.Text
        local player = Players:FindFirstChild(playerName)

        if player and player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.Health = 0
            print("Killed player " .. playerName)
        else
            print("Invalid player name.")
        end
    end)

    -- Populate Player Selection Dropdown
    local function populatePlayerDropdown()
        local playerNames = {}
        for _, player in ipairs(Players:GetPlayers()) do
            table.insert(playerNames, player.Name)
        end

        playerSelectionDropdown.Text = table.concat(playerNames, ", ") -- Displaying all player names for selection
    end

    -- Initialize Dropdown
    populatePlayerDropdown()

    -- Connect Buttons
    createScriptButton.MouseButton1Click:Connect(openScriptCreationGUI)
end

createAdminSystemGUI()
