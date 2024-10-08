-- Admin System GUI Script
local function createAdminSystemGUI()
    local gui = Instance.new("ScreenGui")
    gui.Name = "AdminSystem"
    gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Main Frame
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0.4, 0, 0.5, 0)
    mainFrame.Position = UDim2.new(0.3, 0, 0.25, 0)
    mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    mainFrame.Parent = gui

    local UICorner = Instance.new("UICorner")
    UICorner.Parent = mainFrame

    -- Title
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0.2, 0)
    title.BackgroundTransparency = 1
    title.Text = "Admin System"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.SourceSansBold
    title.TextSize = 24
    title.Parent = mainFrame

    -- Create Remote Event Button
    local createRemoteEventButton = Instance.new("TextButton")
    createRemoteEventButton.Size = UDim2.new(0.9, 0, 0.1, 0)
    createRemoteEventButton.Position = UDim2.new(0.05, 0, 0.25, 0)
    createRemoteEventButton.Text = "Create Remote Event"
    createRemoteEventButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    createRemoteEventButton.Font = Enum.Font.SourceSans
    createRemoteEventButton.TextSize = 20
    createRemoteEventButton.BackgroundColor3 = Color3.fromRGB(0, 128, 255)
    createRemoteEventButton.BorderSizePixel = 0
    createRemoteEventButton.Parent = mainFrame

    -- Create Script Button
    local createScriptButton = Instance.new("TextButton")
    createScriptButton.Size = UDim2.new(0.9, 0, 0.1, 0)
    createScriptButton.Position = UDim2.new(0.05, 0, 0.36, 0)
    createScriptButton.Text = "Create Script"
    createScriptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    createScriptButton.Font = Enum.Font.SourceSans
    createScriptButton.TextSize = 20
    createScriptButton.BackgroundColor3 = Color3.fromRGB(0, 128, 255)
    createScriptButton.BorderSizePixel = 0
    createScriptButton.Parent = mainFrame

    -- Set Player Health Button
    local setPlayerHealthButton = Instance.new("TextButton")
    setPlayerHealthButton.Size = UDim2.new(0.9, 0, 0.1, 0)
    setPlayerHealthButton.Position = UDim2.new(0.05, 0, 0.47, 0)
    setPlayerHealthButton.Text = "Set Player Health"
    setPlayerHealthButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    setPlayerHealthButton.Font = Enum.Font.SourceSans
    setPlayerHealthButton.TextSize = 20
    setPlayerHealthButton.BackgroundColor3 = Color3.fromRGB(0, 128, 255)
    setPlayerHealthButton.BorderSizePixel = 0
    setPlayerHealthButton.Parent = mainFrame

    -- Set Player Speed Button
    local setPlayerSpeedButton = Instance.new("TextButton")
    setPlayerSpeedButton.Size = UDim2.new(0.9, 0, 0.1, 0)
    setPlayerSpeedButton.Position = UDim2.new(0.05, 0, 0.58, 0)
    setPlayerSpeedButton.Text = "Set Player Speed"
    setPlayerSpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    setPlayerSpeedButton.Font = Enum.Font.SourceSans
    setPlayerSpeedButton.TextSize = 20
    setPlayerSpeedButton.BackgroundColor3 = Color3.fromRGB(0, 128, 255)
    setPlayerSpeedButton.BorderSizePixel = 0
    setPlayerSpeedButton.Parent = mainFrame

    -- Kill Player Button
    local killPlayerButton = Instance.new("TextButton")
    killPlayerButton.Size = UDim2.new(0.9, 0, 0.1, 0)
    killPlayerButton.Position = UDim2.new(0.05, 0, 0.69, 0)
    killPlayerButton.Text = "Kill Player"
    killPlayerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    killPlayerButton.Font = Enum.Font.SourceSans
    killPlayerButton.TextSize = 20
    killPlayerButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    killPlayerButton.BorderSizePixel = 0
    killPlayerButton.Parent = mainFrame

    -- Function to open Naming GUI for Remote Event
    local function openNamingGUI()
        local namingFrame = Instance.new("Frame")
        namingFrame.Size = UDim2.new(0.5, 0, 0.3, 0)
        namingFrame.Position = UDim2.new(0.25, 0, 0.35, 0)
        namingFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        namingFrame.Parent = gui

        local UICorner = Instance.new("UICorner")
        UICorner.Parent = namingFrame

        -- Title
        local namingTitle = Instance.new("TextLabel")
        namingTitle.Size = UDim2.new(1, 0, 0.2, 0)
        namingTitle.BackgroundTransparency = 1
        namingTitle.Text = "Create Remote Event"
        namingTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        namingTitle.Font = Enum.Font.SourceSansBold
        namingTitle.TextSize = 24
        namingTitle.Parent = namingFrame

        -- Name Input
        local nameInput = Instance.new("TextBox")
        nameInput.Size = UDim2.new(0.9, 0, 0.2, 0)
        nameInput.Position = UDim2.new(0.05, 0, 0.25, 0)
        nameInput.PlaceholderText = "Remote Event Name"
        nameInput.TextColor3 = Color3.fromRGB(255, 255, 255)
        nameInput.Font = Enum.Font.SourceSans
        nameInput.TextSize = 18
        nameInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        nameInput.BorderSizePixel = 0
        nameInput.Parent = namingFrame

        -- Create Button
        local createButton = Instance.new("TextButton")
        createButton.Size = UDim2.new(0.9, 0, 0.2, 0)
        createButton.Position = UDim2.new(0.05, 0, 0.5, 0)
        createButton.Text = "Create Remote Event"
        createButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        createButton.Font = Enum.Font.SourceSansBold
        createButton.TextSize = 20
        createButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        createButton.BorderSizePixel = 0
        createButton.Parent = namingFrame

        createButton.MouseButton1Click:Connect(function()
            local remoteName = nameInput.Text
            if remoteName ~= "" then
                local remoteEvent = Instance.new("RemoteEvent")
                remoteEvent.Name = remoteName
                remoteEvent.Parent = game.ReplicatedStorage -- Change to desired location
                print("Remote Event '" .. remoteName .. "' created in ReplicatedStorage.")
                namingFrame:Destroy() -- Close the naming frame
            else
                print("Please enter a valid remote event name.")
            end
        end)
    end

    -- Function to open Script Creation GUI
    local function openScriptCreationGUI()
        local scriptFrame = Instance.new("Frame")
        scriptFrame.Size = UDim2.new(0.5, 0, 0.4, 0)
        scriptFrame.Position = UDim2.new(0.25, 0, 0.3, 0)
        scriptFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        scriptFrame.Parent = gui

        local UICorner = Instance.new("UICorner")
        UICorner.Parent = scriptFrame

        -- Title
        local scriptTitle = Instance.new("TextLabel")
        scriptTitle.Size = UDim2.new(1, 0, 0.2, 0)
        scriptTitle.BackgroundTransparency = 1
        scriptTitle.Text = "Create Script"
        scriptTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        scriptTitle.Font = Enum.Font.SourceSansBold
        scriptTitle.TextSize = 24
        scriptTitle.Parent = scriptFrame

        -- Script Name Input
        local scriptNameInput = Instance.new("TextBox")
        scriptNameInput.Size = UDim2.new(0.9, 0, 0.2, 0)
        scriptNameInput.Position = UDim2.new(0.05, 0, 0.25, 0)
        scriptNameInput.PlaceholderText = "Script Name"
        scriptNameInput.TextColor3 = Color3.fromRGB(255, 255, 255)
        scriptNameInput.Font = Enum.Font.SourceSans
        scriptNameInput.TextSize = 18
        scriptNameInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        scriptNameInput.BorderSizePixel = 0
        scriptNameInput.Parent = scriptFrame

        -- Create Button
        local createScriptButton = Instance.new("TextButton")
        createScriptButton.Size = UDim2.new(0.9, 0, 0.2, 0)
        createScriptButton.Position = UDim2.new(0.05, 0, 0.5, 0)
        createScriptButton.Text = "Create Script"
        createScriptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        createScriptButton.Font = Enum.Font.SourceSansBold
        createScriptButton.TextSize = 20
        createScriptButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        createScriptButton.BorderSizePixel = 0
        createScriptButton.Parent = scriptFrame

        createScriptButton.MouseButton1Click:Connect(function()
            local scriptName = scriptNameInput.Text
            if scriptName ~= "" then
                local newScript = Instance.new("Script")
                newScript.Name = scriptName
                newScript.Source = "-- Your script goes here"
                newScript.Parent = game.ServerScriptService -- Change to desired location
                print("Script '" .. scriptName .. "' created in ServerScriptService.")
                scriptFrame:Destroy() -- Close the script creation frame
            else
                print("Please enter a valid script name.")
            end
        end)
    end

    -- Set Player Health Functionality
    local function openSetPlayerHealthGUI()
        local healthFrame = Instance.new("Frame")
        healthFrame.Size = UDim2.new(0.5, 0, 0.4, 0)
        healthFrame.Position = UDim2.new(0.25, 0, 0.3, 0)
        healthFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        healthFrame.Parent = gui

        local UICorner = Instance.new("UICorner")
        UICorner.Parent = healthFrame

        -- Title
        local healthTitle = Instance.new("TextLabel")
        healthTitle.Size = UDim2.new(1, 0, 0.2, 0)
        healthTitle.BackgroundTransparency = 1
        healthTitle.Text = "Set Player Health"
        healthTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        healthTitle.Font = Enum.Font.SourceSansBold
        healthTitle.TextSize = 24
        healthTitle.Parent = healthFrame

        -- Player Selection
        local playerSelection = Instance.new("TextBox")
        playerSelection.Size = UDim2.new(0.9, 0, 0.2, 0)
        playerSelection.Position = UDim2.new(0.05, 0, 0.25, 0)
        playerSelection.PlaceholderText = "Enter Player Name"
        playerSelection.TextColor3 = Color3.fromRGB(255, 255, 255)
        playerSelection.Font = Enum.Font.SourceSans
        playerSelection.TextSize = 18
        playerSelection.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        playerSelection.BorderSizePixel = 0
        playerSelection.Parent = healthFrame

        -- Health Input
        local healthInput = Instance.new("TextBox")
        healthInput.Size = UDim2.new(0.9, 0, 0.2, 0)
        healthInput.Position = UDim2.new(0.05, 0, 0.5, 0)
        healthInput.PlaceholderText = "Enter Health Value"
        healthInput.TextColor3 = Color3.fromRGB(255, 255, 255)
        healthInput.Font = Enum.Font.SourceSans
        healthInput.TextSize = 18
        healthInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        healthInput.BorderSizePixel = 0
        healthInput.Parent = healthFrame

        -- Set Health Button
        local setHealthButton = Instance.new("TextButton")
        setHealthButton.Size = UDim2.new(0.9, 0, 0.2, 0)
        setHealthButton.Position = UDim2.new(0.05, 0, 0.75, 0)
        setHealthButton.Text = "Set Health"
        setHealthButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        setHealthButton.Font = Enum.Font.SourceSansBold
        setHealthButton.TextSize = 20
        setHealthButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        setHealthButton.BorderSizePixel = 0
        setHealthButton.Parent = healthFrame

        setHealthButton.MouseButton1Click:Connect(function()
            local playerName = playerSelection.Text
            local healthValue = tonumber(healthInput.Text)
            local player = game.Players:FindFirstChild(playerName)

            if player and healthValue then
                player.Character.Humanoid.Health = healthValue
                print("Set health of " .. playerName .. " to " .. healthValue)
                healthFrame:Destroy() -- Close the health setting frame
            else
                print("Invalid player name or health value.")
            end
        end)
    end

    -- Set Player Speed Functionality
    local function openSetPlayerSpeedGUI()
        local speedFrame = Instance.new("Frame")
        speedFrame.Size = UDim2.new(0.5, 0, 0.4, 0)
        speedFrame.Position = UDim2.new(0.25, 0, 0.3, 0)
        speedFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        speedFrame.Parent = gui

        local UICorner = Instance.new("UICorner")
        UICorner.Parent = speedFrame

        -- Title
        local speedTitle = Instance.new("TextLabel")
        speedTitle.Size = UDim2.new(1, 0, 0.2, 0)
        speedTitle.BackgroundTransparency = 1
        speedTitle.Text = "Set Player Speed"
        speedTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        speedTitle.Font = Enum.Font.SourceSansBold
        speedTitle.TextSize = 24
        speedTitle.Parent = speedFrame

        -- Player Selection
        local playerSelection = Instance.new("TextBox")
        playerSelection.Size = UDim2.new(0.9, 0, 0.2, 0)
        playerSelection.Position = UDim2.new(0.05, 0, 0.25, 0)
        playerSelection.PlaceholderText = "Enter Player Name"
        playerSelection.TextColor3 = Color3.fromRGB(255, 255, 255)
        playerSelection.Font = Enum.Font.SourceSans
        playerSelection.TextSize = 18
        playerSelection.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        playerSelection.BorderSizePixel = 0
        playerSelection.Parent = speedFrame

        -- Speed Input
        local speedInput = Instance.new("TextBox")
        speedInput.Size = UDim2.new(0.9, 0, 0.2, 0)
        speedInput.Position = UDim2.new(0.05, 0, 0.5, 0)
        speedInput.PlaceholderText = "Enter Speed Value"
        speedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
        speedInput.Font = Enum.Font.SourceSans
        speedInput.TextSize = 18
        speedInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        speedInput.BorderSizePixel = 0
        speedInput.Parent = speedFrame

        -- Set Speed Button
        local setSpeedButton = Instance.new("TextButton")
        setSpeedButton.Size = UDim2.new(0.9, 0, 0.2, 0)
        setSpeedButton.Position = UDim2.new(0.05, 0, 0.75, 0)
        setSpeedButton.Text = "Set Speed"
        setSpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        setSpeedButton.Font = Enum.Font.SourceSansBold
        setSpeedButton.TextSize = 20
        setSpeedButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        setSpeedButton.BorderSizePixel = 0
        setSpeedButton.Parent = speedFrame

        setSpeedButton.MouseButton1Click:Connect(function()
            local playerName = playerSelection.Text
            local speedValue = tonumber(speedInput.Text)
            local player = game.Players:FindFirstChild(playerName)

            if player and speedValue then
                player.Character.Humanoid.WalkSpeed = speedValue
                print("Set speed of " .. playerName .. " to " .. speedValue)
                speedFrame:Destroy() -- Close the speed setting frame
            else
                print("Invalid player name or speed value.")
            end
        end)
    end

    -- Kill Player Functionality
    killPlayerButton.MouseButton1Click:Connect(function()
        local playerName = playerSelection.Text
        local player = game.Players:FindFirstChild(playerName)

        if player then
            player.Character.Humanoid.Health = 0
            print("Killed player " .. playerName)
        else
            print("Invalid player name.")
        end
    end)

    -- Connect Buttons
    createRemoteEventButton.MouseButton1Click:Connect(openNamingGUI)
    createScriptButton.MouseButton1Click:Connect(openScriptCreationGUI)
    setPlayerHealthButton.MouseButton1Click:Connect(openSetPlayerHealthGUI)
    setPlayerSpeedButton.MouseButton1Click:Connect(openSetPlayerSpeedGUI)
end

createAdminSystemGUI()
