-- LocalScript

local function createAdminSystemGUI()
    -- Create the ScreenGui
    local gui = Instance.new("ScreenGui")
    gui.Name = "AdminSystem"
    gui.Parent = game.Players.LocalPlayer.PlayerGui

    -- Main Frame
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.5, 0, 0.5, 0)
    frame.Position = UDim2.new(0.25, 0, 0.25, 0)
    frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    frame.Active = true -- This makes the frame draggable
    frame.Draggable = true -- Enable dragging for the frame
    frame.Parent = gui

    -- UICorner for rounded edges
    local corner = Instance.new("UICorner")
    corner.Parent = frame

    -- Title Label
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0.1, 0)
    title.BackgroundTransparency = 1
    title.Text = "Admin System"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.SourceSansBold
    title.TextSize = 28
    title.Parent = frame

    -- Minimize Button
    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Size = UDim2.new(0.1, 0, 0.1, 0)
    minimizeButton.Position = UDim2.new(0.9, 0, 0, 0)
    minimizeButton.Text = "_"
    minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    minimizeButton.Font = Enum.Font.SourceSansBold
    minimizeButton.TextSize = 20
    minimizeButton.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
    minimizeButton.BorderSizePixel = 0
    minimizeButton.Parent = frame

    -- Unload Button
    local unloadButton = Instance.new("TextButton")
    unloadButton.Size = UDim2.new(0.1, 0, 0.1, 0)
    unloadButton.Position = UDim2.new(0.8, 0, 0, 0)
    unloadButton.Text = "X"
    unloadButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    unloadButton.Font = Enum.Font.SourceSansBold
    unloadButton.TextSize = 20
    unloadButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    unloadButton.BorderSizePixel = 0
    unloadButton.Parent = frame

    -- Create RemoteEvent Button
    local createRemoteEventButton = Instance.new("TextButton")
    createRemoteEventButton.Size = UDim2.new(0.9, 0, 0.1, 0)
    createRemoteEventButton.Position = UDim2.new(0.05, 0, 0.15, 0)
    createRemoteEventButton.Text = "Create RemoteEvent"
    createRemoteEventButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    createRemoteEventButton.Font = Enum.Font.SourceSansBold
    createRemoteEventButton.TextSize = 20
    createRemoteEventButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    createRemoteEventButton.BorderSizePixel = 0
    createRemoteEventButton.Parent = frame

    -- Create Script Button
    local createScriptButton = Instance.new("TextButton")
    createScriptButton.Size = UDim2.new(0.9, 0, 0.1, 0)
    createScriptButton.Position = UDim2.new(0.05, 0, 0.3, 0)
    createScriptButton.Text = "Create Script"
    createScriptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    createScriptButton.Font = Enum.Font.SourceSansBold
    createScriptButton.TextSize = 20
    createScriptButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    createScriptButton.BorderSizePixel = 0
    createScriptButton.Parent = frame

    -- Set Player Health Button
    local setPlayerHealthButton = Instance.new("TextButton")
    setPlayerHealthButton.Size = UDim2.new(0.9, 0, 0.1, 0)
    setPlayerHealthButton.Position = UDim2.new(0.05, 0, 0.45, 0)
    setPlayerHealthButton.Text = "Set Player Health"
    setPlayerHealthButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    setPlayerHealthButton.Font = Enum.Font.SourceSansBold
    setPlayerHealthButton.TextSize = 20
    setPlayerHealthButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
    setPlayerHealthButton.BorderSizePixel = 0
    setPlayerHealthButton.Parent = frame

    -- Minimized UI Frame
    local minimizedFrame = Instance.new("Frame")
    minimizedFrame.Size = UDim2.new(0.2, 0, 0.1, 0)
    minimizedFrame.Position = UDim2.new(0.75, 0, 0.85, 0)
    minimizedFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    minimizedFrame.Visible = false -- Initially hidden
    minimizedFrame.Parent = gui

    -- UICorner for minimized frame
    local minimizedCorner = Instance.new("UICorner")
    minimizedCorner.Parent = minimizedFrame

    -- Restore Button (to bring back the main frame)
    local restoreButton = Instance.new("TextButton")
    restoreButton.Size = UDim2.new(0.5, 0, 1, 0)
    restoreButton.Position = UDim2.new(0, 0, 0, 0)
    restoreButton.Text = "Restore"
    restoreButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    restoreButton.Font = Enum.Font.SourceSansBold
    restoreButton.TextSize = 18
    restoreButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    restoreButton.BorderSizePixel = 0
    restoreButton.Parent = minimizedFrame

    -- Unload Button in Minimized Frame
    local unloadMinimizedButton = Instance.new("TextButton")
    unloadMinimizedButton.Size = UDim2.new(0.5, 0, 1, 0)
    unloadMinimizedButton.Position = UDim2.new(0.5, 0, 0, 0)
    unloadMinimizedButton.Text = "Unload"
    unloadMinimizedButton.TextColor3 = Color3.fromRGB(255, 0, 0)
    unloadMinimizedButton.Font = Enum.Font.SourceSansBold
    unloadMinimizedButton.TextSize = 18
    unloadMinimizedButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    unloadMinimizedButton.BorderSizePixel = 0
    unloadMinimizedButton.Parent = minimizedFrame

    -- Minimize functionality
    minimizeButton.MouseButton1Click:Connect(function()
        frame.Visible = false
        minimizedFrame.Visible = true
    end)

    -- Restore functionality
    restoreButton.MouseButton1Click:Connect(function()
        frame.Visible = true
        minimizedFrame.Visible = false
    end)

    -- Unload functionality
    unloadButton.MouseButton1Click:Connect(function()
        gui:Destroy()
    end)

    unloadMinimizedButton.MouseButton1Click:Connect(function()
        gui:Destroy()
    end)

    -- RemoteEvent Creation Functionality
    local function openNamingGUI()
        -- Create the Naming Frame
        local namingFrame = Instance.new("Frame")
        namingFrame.Size = UDim2.new(0.5, 0, 0.4, 0)
        namingFrame.Position = UDim2.new(0.25, 0, 0.3, 0)
        namingFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        namingFrame.Parent = gui

        -- UICorner for naming frame
        local namingCorner = Instance.new("UICorner")
        namingCorner.Parent = namingFrame

        -- Naming Title
        local namingTitle = Instance.new("TextLabel")
        namingTitle.Size = UDim2.new(1, 0, 0.2, 0)
        namingTitle.BackgroundTransparency = 1
        namingTitle.Text = "Name Your RemoteEvent"
        namingTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        namingTitle.Font = Enum.Font.SourceSansBold
        namingTitle.TextSize = 24
        namingTitle.Parent = namingFrame

        -- RemoteEvent Name TextBox
        local eventNameInput = Instance.new("TextBox")
        eventNameInput.Size = UDim2.new(0.9, 0, 0.2, 0)
        eventNameInput.Position = UDim2.new(0.05, 0, 0.25, 0)
        eventNameInput.PlaceholderText = "Enter RemoteEvent Name"
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
    end

    -- Script Creation Functionality
    local function openScriptCreationGUI()
        -- Create Script Frame
        local scriptFrame = Instance.new("Frame")
        scriptFrame.Size = UDim2.new(0.5, 0, 0.6, 0)
        scriptFrame.Position = UDim2.new(0.25, 0, 0.2, 0)
        scriptFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        scriptFrame.Parent = gui

        -- UICorner for script frame
        local scriptCorner = Instance.new("UICorner")
        scriptCorner.Parent = scriptFrame

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

        -- Service Dropdown
        local scriptServiceDropdown = Instance.new("TextBox")
        scriptServiceDropdown.Size = UDim2.new(0.9, 0, 0.1, 0)
        scriptServiceDropdown.Position = UDim2.new(0.05, 0, 0.3, 0)
        scriptServiceDropdown.PlaceholderText = "Enter Service (e.g., Workspace, ReplicatedStorage)"
        scriptServiceDropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
        scriptServiceDropdown.Font = Enum.Font.SourceSans
        scriptServiceDropdown.TextSize = 18
        scriptServiceDropdown.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        scriptServiceDropdown.BorderSizePixel = 0
        scriptServiceDropdown.Parent = scriptFrame

        -- Script Code TextBox
        local scriptCodeInput = Instance.new("TextBox")
        scriptCodeInput.Size = UDim2.new(0.9, 0, 0.4, 0)
        scriptCodeInput.Position = UDim2.new(0.05, 0, 0.45, 0)
        scriptCodeInput.PlaceholderText = "Enter Script Code"
        scriptCodeInput.TextColor3 = Color3.fromRGB(255, 255, 255)
        scriptCodeInput.Font = Enum.Font.SourceSans
        scriptCodeInput.TextSize = 18
        scriptCodeInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        scriptCodeInput.BorderSizePixel = 0
        scriptCodeInput.MultiLine = true
        scriptCodeInput.Parent = scriptFrame

        -- Create Script Button
        local createScriptButton = Instance.new("TextButton")
        createScriptButton.Size = UDim2.new(0.9, 0, 0.2, 0)
        createScriptButton.Position = UDim2.new(0.05, 0, 1, 0)
        createScriptButton.Text = "Create Script"
        createScriptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        createScriptButton.Font = Enum.Font.SourceSansBold
        createScriptButton.TextSize = 20
        createScriptButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
        createScriptButton.BorderSizePixel = 0
        createScriptButton.Parent = scriptFrame

        -- Script Creation Logic
        createScriptButton.MouseButton1Click:Connect(function()
            local scriptName = scriptNameInput.Text
            local service = scriptServiceDropdown.Text
            local scriptCode = scriptCodeInput.Text

            if scriptName ~= "" and service ~= "" and scriptCode ~= "" then
                local newScript = Instance.new("Script")
                newScript.Name = scriptName
                newScript.Source = scriptCode

                if game:GetService(service) then
                    newScript.Parent = game:GetService(service)
                    scriptFrame:Destroy()
                    print("Script '" .. scriptName .. "' created in " .. service)
                else
                    print("Invalid service specified.")
                end
            else
                print("Please fill out all fields.")
            end
        end)
    end

    -- Set Player Health Logic
    local function openSetPlayerHealthGUI()
        -- Create Health Frame
        local healthFrame = Instance.new("Frame")
        healthFrame.Size = UDim2.new(0.5, 0, 0.4, 0)
        healthFrame.Position = UDim2.new(0.25, 0, 0.3, 0)
        healthFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        healthFrame.Parent = gui

        -- UICorner for health frame
        local healthCorner = Instance.new("UICorner")
        healthCorner.Parent = healthFrame

        -- Health Title
        local healthTitle = Instance.new("TextLabel")
        healthTitle.Size = UDim2.new(1, 0, 0.2, 0)
        healthTitle.BackgroundTransparency = 1
        healthTitle.Text = "Set Player Health"
        healthTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        healthTitle.Font = Enum.Font.SourceSansBold
        healthTitle.TextSize = 24
        healthTitle.Parent = healthFrame

        -- Player Name TextBox
        local playerNameInput = Instance.new("TextBox")
        playerNameInput.Size = UDim2.new(0.9, 0, 0.2, 0)
        playerNameInput.Position = UDim2.new(0.05, 0, 0.25, 0)
        playerNameInput.PlaceholderText = "Enter Player Name"
        playerNameInput.TextColor3 = Color3.fromRGB(255, 255, 255)
        playerNameInput.Font = Enum.Font.SourceSans
        playerNameInput.TextSize = 18
        playerNameInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        playerNameInput.BorderSizePixel = 0
        playerNameInput.Parent = healthFrame

        -- Health Value TextBox
        local healthValueInput = Instance.new("TextBox")
        healthValueInput.Size = UDim2.new(0.9, 0, 0.2, 0)
        healthValueInput.Position = UDim2.new(0.05, 0, 0.5, 0)
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
        setHealthButton.Position = UDim2.new(0.05, 0, 0.75, 0)
        setHealthButton.Text = "Set Health"
        setHealthButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        setHealthButton.Font = Enum.Font.SourceSansBold
        setHealthButton.TextSize = 20
        setHealthButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        setHealthButton.BorderSizePixel = 0
        setHealthButton.Parent = healthFrame

        -- Set Health Logic
        setHealthButton.MouseButton1Click:Connect(function()
            local playerName = playerNameInput.Text
            local healthValue = tonumber(healthValueInput.Text)

            if playerName ~= "" and healthValue then
                local player = game.Players:FindFirstChild(playerName)
                if player then
                    player.Character.Humanoid.Health = healthValue
                    print("Set health of " .. playerName .. " to " .. healthValue)
                    healthFrame:Destroy() -- Close the health frame
                else
                    print("Player not found.")
                end
            else
                print("Please enter a valid player name and health value.")
            end
        end)
    end

    -- Button Functions
    createRemoteEventButton.MouseButton1Click:Connect(openNamingGUI)
    createScriptButton.MouseButton1Click:Connect(openScriptCreationGUI)
    setPlayerHealthButton.MouseButton1Click:Connect(openSetPlayerHealthGUI)
end

createAdminSystemGUI()
