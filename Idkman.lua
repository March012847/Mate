-- Admin GUI Script

-- Function to create the admin GUI
local function createAdminGUI()
    -- Create the ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AdminGui"
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Create a Frame
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.4, 0, 0.5, 0)
    frame.Position = UDim2.new(0.3, 0, 0.3, 0)
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame.Parent = screenGui

    -- Create a Title Label
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0.2, 0)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.Text = "Admin Panel"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Parent = frame

    -- Create a Close Button
    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0.2, 0, 0.1, 0)
    closeButton.Position = UDim2.new(0.1, 0, 0.8, 0)
    closeButton.Text = "Close"
    closeButton.Parent = frame

    -- Create an Unload Button
    local unloadButton = Instance.new("TextButton")
    unloadButton.Size = UDim2.new(0.2, 0, 0.1, 0)
    unloadButton.Position = UDim2.new(0.7, 0, 0.8, 0)
    unloadButton.Text = "Unload"
    unloadButton.Parent = frame

    -- Function to close the GUI
    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    -- Function to unload the GUI
    unloadButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    -- Create a Description Label
    local descriptionLabel = Instance.new("TextLabel")
    descriptionLabel.Size = UDim2.new(1, 0, 0.2, 0)
    descriptionLabel.Position = UDim2.new(0, 0, 0.2, 0)
    descriptionLabel.Text = "Choose Announcement Target:"
    descriptionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    descriptionLabel.BackgroundTransparency = 1
    descriptionLabel.Parent = frame

    -- Create Buttons for Target Selection
    local targetAllButton = Instance.new("TextButton")
    targetAllButton.Size = UDim2.new(0.4, 0, 0.1, 0)
    targetAllButton.Position = UDim2.new(0.1, 0, 0.3, 0)
    targetAllButton.Text = "All Players"
    targetAllButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    targetAllButton.Parent = frame

    local targetOneButton = Instance.new("TextButton")
    targetOneButton.Size = UDim2.new(0.4, 0, 0.1, 0)
    targetOneButton.Position = UDim2.new(0.1, 0, 0.45, 0)
    targetOneButton.Text = "One Player"
    targetOneButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    targetOneButton.Parent = frame

    -- Create a Message Box
    local messageBox = Instance.new("TextBox")
    messageBox.Size = UDim2.new(0.5, 0, 0.2, 0)
    messageBox.Position = UDim2.new(0.25, 0, 0.6, 0)
    messageBox.PlaceholderText = "Enter announcement message"
    messageBox.Parent = frame

    -- Create a Player Input Box
    local playerInput = Instance.new("TextBox")
    playerInput.Size = UDim2.new(0.5, 0, 0.2, 0)
    playerInput.Position = UDim2.new(0.25, 0, 0.8, 0)
    playerInput.PlaceholderText = "Enter player name (optional)"
    playerInput.Visible = false -- Hide initially
    playerInput.Parent = frame

    -- Create a Send Button
    local sendButton = Instance.new("TextButton")
    sendButton.Size = UDim2.new(0.2, 0, 0.1, 0)
    sendButton.Position = UDim2.new(0.4, 0, 1, 0)
    sendButton.Text = "Send"
    sendButton.Parent = frame

    -- Create a Kick Button
    local kickButton = Instance.new("TextButton")
    kickButton.Size = UDim2.new(0.2, 0, 0.1, 0)
    kickButton.Position = UDim2.new(0.75, 0, 0.3, 0)
    kickButton.Text = "Kick Player"
    kickButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    kickButton.Parent = frame

    -- Target selection logic
    local targetSelection = "All" -- Default target

    targetAllButton.MouseButton1Click:Connect(function()
        targetSelection = "All"
        targetAllButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Highlight selected
        targetOneButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Reset
        playerInput.Visible = false -- Hide player input
    end)

    targetOneButton.MouseButton1Click:Connect(function()
        targetSelection = "One"
        targetOneButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Highlight selected
        targetAllButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Reset
        playerInput.Visible = true -- Show player input
        updatePlayerInput() -- Update player input box with closest name
    end)

    -- Function to handle sending the announcement
    sendButton.MouseButton1Click:Connect(function()
        local announcement = messageBox.Text
        local targetPlayerName = playerInput.Text

        if announcement ~= "" then
            if targetSelection == "All" then
                -- Send announcement to all players
                for _, player in ipairs(game.Players:GetPlayers()) do
                    player:SendNotification({
                        Title = "Announcement",
                        Text = announcement,
                        Duration = 5
                    })
                end
            elseif targetSelection == "One" and targetPlayerName ~= "" then
                -- Send announcement to a specific player
                local targetPlayer = game.Players:FindFirstChild(targetPlayerName)
                if targetPlayer then
                    targetPlayer:SendNotification({
                        Title = "Announcement",
                        Text = announcement,
                        Duration = 5
                    })
                else
                    warn("Player not found: " .. targetPlayerName)
                end
            end
            messageBox.Text = "" -- Clear the message box
            playerInput.Text = "" -- Clear the player input
        end
    end)

    -- Function to handle kicking a player
    kickButton.MouseButton1Click:Connect(function()
        local targetPlayerName = playerInput.Text
        if targetPlayerName ~= "" then
            local targetPlayer = game.Players:FindFirstChild(targetPlayerName)
            if targetPlayer then
                targetPlayer:Kick("You have been kicked by an admin.") -- Kicking the player with a message
            else
                warn("Player not found: " .. targetPlayerName)
            end
        end
    end)

    -- Function to update the player input with the closest name
    local function updatePlayerInput()
        local closestName = ""
        local playerName = playerInput.Text:lower() -- Get lowercase input for comparison
        local closestDistance = math.huge

        for _, player in ipairs(game.Players:GetPlayers()) do
            if player.Name:lower():sub(1, #playerName) == playerName then
                local distance = #player.Name - #playerName
                if distance < closestDistance then
                    closestDistance = distance
                    closestName = player.Name
                end
            end
        end

        if closestName ~= "" then
            playerInput.Text = closestName -- Set the player input to the closest name
        end
    end

    -- Refresh player input on player added
    game.Players.PlayerAdded:Connect(function()
        wait(0.1) -- Short delay for the player to fully join
        updatePlayerInput()
    end)

    -- Update on typing in the player input
    playerInput:GetPropertyChangedSignal("Text"):Connect(function()
        if targetSelection == "One" then
            updatePlayerInput()
        end
    end)
end

-- Create the GUI when the script is executed
createAdminGUI()
