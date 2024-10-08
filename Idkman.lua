local function createAdminSystemGUI()
    -- Main GUI Setup
    local gui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0.5, 0, 0.5, 0)
    mainFrame.Position = UDim2.new(0.25, 0, 0.25, 0)
    mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    mainFrame.Parent = gui

    local UICorner = Instance.new("UICorner")
    UICorner.Parent = mainFrame

    -- Main GUI Title
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0.2, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "Admin System"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextSize = 24
    titleLabel.Parent = mainFrame

    -- Create RemoteEvent Button
    local createRemoteEventButton = Instance.new("TextButton")
    createRemoteEventButton.Size = UDim2.new(0.9, 0, 0.2, 0)
    createRemoteEventButton.Position = UDim2.new(0.05, 0, 0.25, 0)
    createRemoteEventButton.Text = "Create RemoteEvent"
    createRemoteEventButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    createRemoteEventButton.Font = Enum.Font.SourceSansBold
    createRemoteEventButton.TextSize = 20
    createRemoteEventButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    createRemoteEventButton.BorderSizePixel = 0
    createRemoteEventButton.Parent = mainFrame

    -- Create Script Button
    local createScriptButton = Instance.new("TextButton")
    createScriptButton.Size = UDim2.new(0.9, 0, 0.2, 0)
    createScriptButton.Position = UDim2.new(0.05, 0, 0.5, 0)
    createScriptButton.Text = "Create Script"
    createScriptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    createScriptButton.Font = Enum.Font.SourceSansBold
    createScriptButton.TextSize = 20
    createScriptButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    createScriptButton.BorderSizePixel = 0
    createScriptButton.Parent = mainFrame

    -- Set Player Health Button
    local setPlayerHealthButton = Instance.new("TextButton")
    setPlayerHealthButton.Size = UDim2.new(0.9, 0, 0.2, 0)
    setPlayerHealthButton.Position = UDim2.new(0.05, 0, 0.75, 0)
    setPlayerHealthButton.Text = "Set Player Health"
    setPlayerHealthButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    setPlayerHealthButton.Font = Enum.Font.SourceSansBold
    setPlayerHealthButton.TextSize = 20
    setPlayerHealthButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    setPlayerHealthButton.BorderSizePixel = 0
    setPlayerHealthButton.Parent = mainFrame

    -- Function to open naming GUI for RemoteEvent creation
    local function openNamingGUI()
        local namingFrame = Instance.new("Frame")
        namingFrame.Size = UDim2.new(0.5, 0, 0.4, 0)
        namingFrame.Position = UDim2.new(0.25, 0, 0.3, 0)
        namingFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        namingFrame.Parent = gui

        local UICorner = Instance.new("UICorner")
        UICorner.Parent = namingFrame

        -- Naming Title
        local namingTitle = Instance.new("TextLabel")
        namingTitle.Size = UDim2.new(1, 0, 0.2, 0)
        namingTitle.BackgroundTransparency = 1
        namingTitle.Text = "Create RemoteEvent"
        namingTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        namingTitle.Font = Enum.Font.SourceSansBold
        namingTitle.TextSize = 24
        namingTitle.Parent = namingFrame

        -- Event Name TextBox
        local eventNameInput = Instance.new("TextBox")
        eventNameInput.Size = UDim2.new(0.9, 0, 0.2, 0)
        eventNameInput.Position = UDim2.new(0.05, 0, 0.25, 0)
        eventNameInput.PlaceholderText = "Enter Event Name"
        eventNameInput.TextColor3 = Color3.fromRGB(255, 255, 255)
        eventNameInput.Font = Enum.Font.SourceSans
        eventNameInput.TextSize = 18
        eventNameInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        eventNameInput.BorderSizePixel = 0
        eventNameInput.Parent = namingFrame

        -- Create Event Button
        local createEventButton = Instance.new("TextButton")
        createEventButton.Size = UDim2.new(0.9, 0, 0.2, 0)
        createEventButton.Position = UDim2.new(0.05, 0, 0.5, 0)
        createEventButton.Text = "Create RemoteEvent"
        createEventButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        createEventButton.Font = Enum.Font.SourceSansBold
        createEventButton.TextSize = 20
        createEventButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        createEventButton.BorderSizePixel = 0
        createEventButton.Parent = namingFrame

        -- Event Creation Logic
        createEventButton.MouseButton1Click:Connect(function()
            local eventName = eventNameInput.Text

            if eventName ~= "" then
                local newEvent = Instance.new("RemoteEvent")
                newEvent.Name = eventName
                newEvent.Parent = game:GetService("ReplicatedStorage")
                namingFrame:Destroy()
                print("RemoteEvent '" .. eventName .. "' created.")
            else
                print("Please enter a name for the RemoteEvent.")
            end
        end)

        -- Go Back Button
        local goBackButton = Instance.new("TextButton")
        goBackButton.Size = UDim2.new(0.9, 0, 0.2, 0)
        goBackButton.Position = UDim2.new(0.05, 0, 0.75, 0)
        goBackButton.Text = "Go Back to Main GUI"
        goBackButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        goBackButton.Font = Enum.Font.SourceSansBold
        goBackButton.TextSize = 20
        goBackButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        goBackButton.BorderSizePixel = 0
        goBackButton.Parent = namingFrame

        goBackButton.MouseButton1Click:Connect(function()
            namingFrame:Destroy() -- Close the naming frame
        end)
    end

    -- Function to open script creation GUI
    local function openScriptCreationGUI()
        local scriptFrame = Instance.new("Frame")
        scriptFrame.Size = UDim2.new(0.5, 0, 0.6, 0)
        scriptFrame.Position = UDim2.new(0.25, 0, 0.2, 0)
        scriptFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        scriptFrame.Parent = gui

        local UICorner = Instance.new("UICorner")
        UICorner.Parent = scriptFrame

        -- Script Title
        local scriptTitle = Instance.new("TextLabel")
        scriptTitle.Size = UDim2.new(1, 0, 0.1, 0)
        scriptTitle.BackgroundTransparency = 1
        scriptTitle.Text = "Create Script"
        scriptTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        scriptTitle.Font = Enum.Font.SourceSansBold
        scriptTitle.TextSize = 24
        scriptTitle.Parent = scriptFrame

        -- Script Name TextBox
        local scriptNameInput = Instance.new("TextBox")
        scriptNameInput.Size = UDim2.new(0.9, 0, 0.1, 0)
        scriptNameInput.Position = UDim2.new(0.05, 0, 0.15, 0)
        scriptNameInput.PlaceholderText = "Enter Script Name"
        scriptNameInput.TextColor3 = Color3.fromRGB(255, 255, 255)
        scriptNameInput.Font = Enum.Font.SourceSans
        scriptNameInput.TextSize = 18
        scriptNameInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        scriptNameInput.BorderSizePixel = 0
        scriptNameInput.Parent = scriptFrame

        -- Script Code TextBox
        local scriptCodeInput = Instance.new("TextBox")
        scriptCodeInput.Size = UDim2.new(0.9, 0, 0.5, 0)
        scriptCodeInput.Position = UDim2.new(0.05, 0, 0.25, 0)
        scriptCodeInput.TextColor3 = Color3.fromRGB(255, 255, 255)
        scriptCodeInput.Font = Enum.Font.SourceSans
        scriptCodeInput.TextSize = 18
        scriptCodeInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        scriptCodeInput.BorderSizePixel = 0
        scriptCodeInput.MultiLine = true
        scriptCodeInput.Parent = scriptFrame

        -- Create Script Button
        local createScriptButton = Instance.new("TextButton")
        createScriptButton.Size = UDim2.new(0.9, 0, 0.1, 0)
        createScriptButton.Position = UDim2.new(0.05, 0, 0.8, 0)
        createScriptButton.Text = "Create Script"
        createScriptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        createScriptButton.Font = Enum.Font.SourceSansBold
        createScriptButton.TextSize = 20
        createScriptButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        createScriptButton.BorderSizePixel = 0
        createScriptButton.Parent = scriptFrame

        -- Script Creation Logic
        createScriptButton.MouseButton1Click:Connect(function()
            local scriptName = scriptNameInput.Text
            local scriptContent = scriptCodeInput.Text

            if scriptName ~= "" and scriptContent ~= "" then
                local newScript = Instance.new("Script")
                newScript.Name = scriptName
                newScript.Source = scriptContent
                newScript.Parent = game.Workspace -- Change to any service as needed
                scriptFrame:Destroy()
                print("Script '" .. scriptName .. "' created in Workspace.")
            else
                print("Please enter a name and content for the script.")
            end
        end)

        -- Go Back Button
        local goBackButton = Instance.new("TextButton")
        goBackButton.Size = UDim2.new(0.9, 0, 0.1, 0)
        goBackButton.Position = UDim2.new(0.05, 0, 0.9, 0)
        goBackButton.Text = "Go Back to Main GUI"
        goBackButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        goBackButton.Font = Enum.Font.SourceSansBold
        goBackButton.TextSize = 20
        goBackButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        goBackButton.BorderSizePixel = 0
        goBackButton.Parent = scriptFrame

        goBackButton.MouseButton1Click:Connect(function()
            scriptFrame:Destroy() -- Close the script frame
        end)
    end

    -- Function to set player health with dropdown selection
    local function openSetPlayerHealthGUI()
        local healthFrame = Instance.new("Frame")
        healthFrame.Size = UDim2.new(0.5, 0, 0.4, 0)
        healthFrame.Position = UDim2.new(0.25, 0, 0.3, 0)
        healthFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        healthFrame.Parent = gui

        local UICorner = Instance.new("UICorner")
        UICorner.Parent = healthFrame

        -- Health Title
        local healthTitle = Instance.new("TextLabel")
        healthTitle.Size = UDim2.new(1, 0, 0.2, 0)
        healthTitle.BackgroundTransparency = 1
        healthTitle.Text = "Set Player Health"
        healthTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        healthTitle.Font = Enum.Font.SourceSansBold
        healthTitle.TextSize = 24
        healthTitle.Parent = healthFrame

        -- Player Dropdown
        local playerDropdown = Instance.new("TextButton")
        playerDropdown.Size = UDim2.new(0.9, 0, 0.2, 0)
        playerDropdown.Position = UDim2.new(0.05, 0, 0.25, 0)
        playerDropdown.Text = "Select Player"
        playerDropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
        playerDropdown.Font = Enum.Font.SourceSans
        playerDropdown.TextSize = 18
        playerDropdown.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        playerDropdown.BorderSizePixel = 0
        playerDropdown.Parent = healthFrame

        local selectedPlayer = ""

        -- Create Dropdown for Players
        playerDropdown.MouseButton1Click:Connect(function()
            local playerListFrame = Instance.new("Frame")
            playerListFrame.Size = UDim2.new(0.9, 0, 0.3, 0)
            playerListFrame.Position = UDim2.new(0.05, 0, 0.5, 0)
            playerListFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            playerListFrame.Parent = healthFrame

            -- List Players
            for _, player in ipairs(game.Players:GetPlayers()) do
                local playerButton = Instance.new("TextButton")
                playerButton.Size = UDim2.new(1, 0, 0.2, 0)
                playerButton.Text = player.Name
                playerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                playerButton.Font = Enum.Font.SourceSans
                playerButton.TextSize = 18
                playerButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
                playerButton.BorderSizePixel = 0
                playerButton.Parent = playerListFrame

                playerButton.MouseButton1Click:Connect(function()
                    selectedPlayer = player.Name
                    playerDropdown.Text = "Selected: " .. selectedPlayer
                    playerListFrame:Destroy() -- Close the player list after selection
                end)
            end
        end)

        -- Health Value TextBox
        local healthValueInput = Instance.new("TextBox")
        healthValueInput.Size = UDim2.new(0.9, 0, 0.2, 0)
        healthValueInput.Position = UDim2.new(0.05, 0, 0.75, 0)
        healthValueInput.PlaceholderText = "Enter Health Value"
        healthValueInput.TextColor3 = Color3.fromRGB(255, 255, 255)
        healthValueInput.Font = Enum.Font.SourceSans
        healthValueInput.TextSize = 18
        healthValueInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        healthValueInput.BorderSizePixel = 0
        healthValueInput.Parent = healthFrame

        -- Set Health Button
        local setHealthButton = Instance.new("TextButton")
        setHealthButton.Size = UDim2.new(0.9, 0, 0.2, 0)
        setHealthButton.Position = UDim2.new(0.05, 0, 0.95, 0)
        setHealthButton.Text = "Set Health"
        setHealthButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        setHealthButton.Font = Enum.Font.SourceSansBold
        setHealthButton.TextSize = 20
        setHealthButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        setHealthButton.BorderSizePixel = 0
        setHealthButton.Parent = healthFrame

        -- Set Health Logic
        setHealthButton.MouseButton1Click:Connect(function()
            local healthValue = tonumber(healthValueInput.Text)

            if selectedPlayer ~= "" and healthValue then
                local player = game.Players:FindFirstChild(selectedPlayer)
                if player and player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid.Health = healthValue
                    print("Set health of " .. selectedPlayer .. " to " .. healthValue)
                    healthFrame:Destroy() -- Close the health frame
                else
                    print("Player not found or has no humanoid.")
                end
            else
                print("Please select a player and enter a valid health value.")
            end
        end)

        -- Go Back Button
        local goBackButton = Instance.new("TextButton")
        goBackButton.Size = UDim2.new(0.9, 0, 0.2, 0)
        goBackButton.Position = UDim2.new(0.05, 0, 1.1, 0)
        goBackButton.Text = "Go Back to Main GUI"
        goBackButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        goBackButton.Font = Enum.Font.SourceSansBold
        goBackButton.TextSize = 20
        goBackButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        goBackButton.BorderSizePixel = 0
        goBackButton.Parent = healthFrame

        goBackButton.MouseButton1Click:Connect(function()
            healthFrame:Destroy() -- Close the health frame
        end)
    end

    -- Connect Buttons to Functions
    createRemoteEventButton.MouseButton1Click:Connect(openNamingGUI)
    createScriptButton.MouseButton1Click:Connect(openScriptCreationGUI)
    setPlayerHealthButton.MouseButton1Click:Connect(openSetPlayerHealthGUI)
    
    -- Unload Button
    local unloadButton = Instance.new("TextButton")
    unloadButton.Size = UDim2.new(0.4, 0, 0.1, 0)
    unloadButton.Position = UDim2.new(0.05, 0, 0.9, 0)
    unloadButton.Text = "Unload"
    unloadButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    unloadButton.Font = Enum.Font.SourceSansBold
    unloadButton.TextSize = 20
    unloadButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    unloadButton.BorderSizePixel = 0
    unloadButton.Parent = mainFrame

    unloadButton.MouseButton1Click:Connect(function()
        gui:Destroy() -- Unload the GUI
    end)

    -- Minimize Button
    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Size = UDim2.new(0.4, 0, 0.1, 0)
    minimizeButton.Position = UDim2.new(0.55, 0, 0.9, 0)
    minimizeButton.Text = "Minimize"
    minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    minimizeButton.Font = Enum.Font.SourceSansBold
    minimizeButton.TextSize = 20
    minimizeButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    minimizeButton.BorderSizePixel = 0
    minimizeButton.Parent = mainFrame

    minimizeButton.MouseButton1Click:Connect(function()
        mainFrame.Visible = not mainFrame.Visible -- Toggle visibility
    end)

    -- Make the GUI draggable
    local dragging
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    mainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging then
            update(input)
        end
    end)
end

createAdminSystemGUI()
