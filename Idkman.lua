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

    -- Code Input TextBox
    local codeInput = Instance.new("TextBox")
    codeInput.Size = UDim2.new(0.9, 0, 0.4, 0)
    codeInput.Position = UDim2.new(0.05, 0, 0.15, 0)
    codeInput.PlaceholderText = "Enter your Lua script here"
    codeInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    codeInput.Font = Enum.Font.SourceSans
    codeInput.TextSize = 18
    codeInput.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    codeInput.BorderSizePixel = 0
    codeInput.ClearTextOnFocus = true
    codeInput.MultiLine = true
    codeInput.Parent = frame

    -- Execute Button
    local executeButton = Instance.new("TextButton")
    executeButton.Size = UDim2.new(0.9, 0, 0.1, 0)
    executeButton.Position = UDim2.new(0.05, 0, 0.55, 0)
    executeButton.Text = "Execute Script"
    executeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    executeButton.Font = Enum.Font.SourceSansBold
    executeButton.TextSize = 20
    executeButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    executeButton.BorderSizePixel = 0
    executeButton.Parent = frame

    -- Output TextBox
    local outputBox = Instance.new("TextBox")
    outputBox.Size = UDim2.new(0.9, 0, 0.3, 0)
    outputBox.Position = UDim2.new(0.05, 0, 0.65, 0)
    outputBox.PlaceholderText = "Output"
    outputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    outputBox.Font = Enum.Font.SourceSans
    outputBox.TextSize = 18
    outputBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    outputBox.BorderSizePixel = 0
    outputBox.ClearTextOnFocus = false
    outputBox.MultiLine = true
    outputBox.TextWrapped = true
    outputBox.Parent = frame

    -- Switch to Server-Sided Command Button
    local commandBarButton = Instance.new("TextButton")
    commandBarButton.Size = UDim2.new(0.9, 0, 0.1, 0)
    commandBarButton.Position = UDim2.new(0.05, 0, 0.9, 0)
    commandBarButton.Text = "Switch to Server Command Bar"
    commandBarButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    commandBarButton.Font = Enum.Font.SourceSansBold
    commandBarButton.TextSize = 20
    commandBarButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
    commandBarButton.BorderSizePixel = 0
    commandBarButton.Parent = frame

    -- Execute Button Functionality
    executeButton.MouseButton1Click:Connect(function()
        local code = codeInput.Text
        if code and code ~= "" then
            local success, errorMsg = pcall(function()
                local output = loadstring(code)()  -- Execute the script
                outputBox.Text = "Output:\n" .. (output or "Script executed successfully.")
            end)
            if not success then
                outputBox.Text = "Error:\n" .. errorMsg  -- Show error in output box
            end
        else
            outputBox.Text = "Error:\nNo code provided."  -- Warn if no code is entered
        end
    end)

    -- Command Bar Functionality
    commandBarButton.MouseButton1Click:Connect(function()
        local commandCode = codeInput.Text
        if commandCode and commandCode ~= "" then
            -- Execute command in server-side context
            local success, errorMsg = pcall(function()
                loadstring(commandCode)()  -- Execute the command
                outputBox.Text = "Command executed successfully."
            end)
            if not success then
                outputBox.Text = "Error:\n" .. errorMsg
            end
        else
            outputBox.Text = "Error:\nNo command provided."  -- Warn if no command is entered
        end
    end)
end

-- Create the GUI
createScriptCreationGUI()
