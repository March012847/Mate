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

    -- Create RemoteEvent Button
    local createButton = Instance.new("TextButton")
    createButton.Size = UDim2.new(0.9, 0, 0.2, 0)
    createButton.Position = UDim2.new(0.05, 0, 0.15, 0)
    createButton.Text = "Create RemoteEvent"
    createButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    createButton.Font = Enum.Font.SourceSansBold
    createButton.TextSize = 20
    createButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    createButton.BorderSizePixel = 0
    createButton.Parent = frame

    -- Function to open naming GUI
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

        -- Function Code Button
        local functionCodeButton = Instance.new("TextButton")
        functionCodeButton.Size = UDim2.new(0.9, 0, 0.2, 0)
        functionCodeButton.Position = UDim2.new(0.05, 0, 0.75, 0)
        functionCodeButton.Text = "Set Function Code"
        functionCodeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        functionCodeButton.Font = Enum.Font.SourceSansBold
        functionCodeButton.TextSize = 20
        functionCodeButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
        functionCodeButton.BorderSizePixel = 0
        functionCodeButton.Parent = namingFrame

        -- Variable to hold function code
        local functionCode = ""

        -- Button functionality to set function code
        functionCodeButton.MouseButton1Click:Connect(function()
            local codeInputFrame = Instance.new("Frame")
            codeInputFrame.Size = UDim2.new(0.5, 0, 0.4, 0)
            codeInputFrame.Position = UDim2.new(0.25, 0, 0.3, 0)
            codeInputFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            codeInputFrame.Parent = gui

            local codeCorner = Instance.new("UICorner")
            codeCorner.Parent = codeInputFrame

            local codeTitle = Instance.new("TextLabel")
            codeTitle.Size = UDim2.new(1, 0, 0.2, 0)
            codeTitle.BackgroundTransparency = 1
            codeTitle.Text = "Enter Function Code"
            codeTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            codeTitle.Font = Enum.Font.SourceSansBold
            codeTitle.TextSize = 24
            codeTitle.Parent = codeInputFrame

            local codeInput = Instance.new("TextBox")
            codeInput.Size = UDim2.new(0.9, 0, 0.5, 0)
            codeInput.Position = UDim2.new(0.05, 0, 0.25, 0)
            codeInput.PlaceholderText = "Function code here..."
            codeInput.TextColor3 = Color3.fromRGB(255, 255, 255)
            codeInput.Font = Enum.Font.SourceSans
            codeInput.TextSize = 18
            codeInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            codeInput.BorderSizePixel = 0
            codeInput.MultiLine = true
            codeInput.Parent = codeInputFrame

            local setCodeButton = Instance.new("TextButton")
            setCodeButton.Size = UDim2.new(0.9, 0, 0.2, 0)
            setCodeButton.Position = UDim2.new(0.05, 0, 0.8, 0)
            setCodeButton.Text = "Set Function Code"
            setCodeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            setCodeButton.Font = Enum.Font.SourceSansBold
            setCodeButton.TextSize = 20
            setCodeButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            setCodeButton.BorderSizePixel = 0
            setCodeButton.Parent = codeInputFrame

            setCodeButton.MouseButton1Click:Connect(function()
                functionCode = codeInput.Text
                codeInputFrame:Destroy()  -- Close the function code input
                print("Function code set!")
            end)
        end)

        -- Create Event Functionality
        createEventButton.MouseButton1Click:Connect(function()
            local eventName = eventNameInput.Text

            if eventName and eventName ~= "" then
                -- Create RemoteEvent in ReplicatedStorage
                local remoteEvent = Instance.new("RemoteEvent")
                remoteEvent.Name = eventName
                remoteEvent.Parent = game.ReplicatedStorage

                -- Connect function to the RemoteEvent if available
                if functionCode and functionCode ~= "" then
                    local success, errorMsg = pcall(function()
                        local func = loadstring(functionCode)
                        if func then
                            remoteEvent.OnServerEvent:Connect(func)
                        end
                    end)

                    if not success then
                        print("Error creating function for RemoteEvent: " .. errorMsg)
                    end
                end

                namingFrame:Destroy()  -- Close the naming GUI
                print("RemoteEvent '" .. eventName .. "' created successfully!")
            else
                print("Please enter a valid name for the RemoteEvent.")
            end
        end)
    end

    -- Button click event to open naming GUI
    createButton.MouseButton1Click:Connect(openNamingGUI)
end

-- Create the Admin System GUI
createAdminSystemGUI()
