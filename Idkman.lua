-- LocalScript

local function createScriptCreationGUI()
    -- Create the ScreenGui
    local gui = Instance.new("ScreenGui")
    gui.Name = "ScriptCreationGUI"
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
    title.Text = "Script Creator"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.SourceSansBold
    title.TextSize = 28
    title.Parent = frame

    -- Service Dropdown
    local serviceDropdown = Instance.new("TextButton")
    serviceDropdown.Size = UDim2.new(0.9, 0, 0.1, 0)
    serviceDropdown.Position = UDim2.new(0.05, 0, 0.15, 0)
    serviceDropdown.Text = "Select Service: ServerScriptService"
    serviceDropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
    serviceDropdown.Font = Enum.Font.SourceSans
    serviceDropdown.TextSize = 18
    serviceDropdown.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    serviceDropdown.BorderSizePixel = 0
    serviceDropdown.Parent = frame

    -- Code Input TextBox
    local codeInput = Instance.new("TextBox")
    codeInput.Size = UDim2.new(0.9, 0, 0.4, 0)
    codeInput.Position = UDim2.new(0.05, 0, 0.25, 0)
    codeInput.PlaceholderText = "Enter your Lua script here"
    codeInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    codeInput.Font = Enum.Font.SourceSans
    codeInput.TextSize = 18
    codeInput.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    codeInput.BorderSizePixel = 0
    codeInput.ClearTextOnFocus = true
    codeInput.MultiLine = true
    codeInput.Parent = frame

    -- Create Button
    local createButton = Instance.new("TextButton")
    createButton.Size = UDim2.new(0.9, 0, 0.1, 0)
    createButton.Position = UDim2.new(0.05, 0, 0.7, 0)
    createButton.Text = "Create Script"
    createButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    createButton.Font = Enum.Font.SourceSansBold
    createButton.TextSize = 20
    createButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    createButton.BorderSizePixel = 0
    createButton.Parent = frame

    -- List of services
    local services = {"ServerScriptService", "Workspace", "ReplicatedStorage", "StarterPlayer"}
    local currentService = "ServerScriptService"  -- Default service

    -- Function to handle service selection
    serviceDropdown.MouseButton1Click:Connect(function()
        local serviceIndex = table.find(services, currentService)
        currentService = services[(serviceIndex % #services) + 1]  -- Cycle through services
        serviceDropdown.Text = "Select Service: " .. currentService
    end)

    -- Create button functionality
    createButton.MouseButton1Click:Connect(function()
        local code = codeInput.Text
        if code and code ~= "" then
            -- Create a new Script in the selected service
            local newScript = Instance.new("Script")
            newScript.Source = code  -- Set the script source to the input code
            newScript.Name = "GeneratedScript_" .. os.time()  -- Name the script uniquely
            
            -- Parent the script to the selected service
            local parentService = game:FindFirstChild(currentService)
            if parentService then
                newScript.Parent = parentService
                print("Script created in " .. currentService .. ": " .. newScript.Name)
                codeInput.Text = ""  -- Clear the input field
            else
                warn("Selected service not found: " .. currentService)
            end
        else
            warn("No code provided.")  -- Warn if no code is entered
        end
    end)

    -- Server-Sided Command Bar Button
    local commandBarButton = Instance.new("TextButton")
    commandBarButton.Size = UDim2.new(0.9, 0, 0.1, 0)
    commandBarButton.Position = UDim2.new(0.05, 0, 0.85, 0)
    commandBarButton.Text = "Switch to Server Command Bar"
    commandBarButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    commandBarButton.Font = Enum.Font.SourceSansBold
    commandBarButton.TextSize = 20
    commandBarButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
    commandBarButton.BorderSizePixel = 0
    commandBarButton.Parent = frame

    -- Command Bar Functionality
    commandBarButton.MouseButton1Click:Connect(function()
        local commandCode = codeInput.Text
        if commandCode and commandCode ~= "" then
            -- Execute command in server-side context
            local success, errorMsg = pcall(function()
                loadstring(commandCode)()  -- Execute the command
            end)
            if not success then
                warn("Error executing command: " .. errorMsg)
            else
                print("Command executed successfully.")
                codeInput.Text = ""  -- Clear the input field
            end
        else
            warn("No command provided.")  -- Warn if no command is entered
        end
    end)
end

-- Create the GUI
createScriptCreationGUI()
