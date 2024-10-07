-- List of admin User IDs
local admins = {
    2633490764, -- Replace with actual User IDs
}

-- Function to check if a player is an admin
local function isAdmin(player)
    for _, adminId in ipairs(admins) do
        if player.UserId == adminId then
            return true
        end
    end
    return false
end

-- Create the GUI only if the player is an admin
local player = game.Players.LocalPlayer
if isAdmin(player) then
    -- Create the ScreenGui
    local gui = Instance.new("ScreenGui")
    gui.Name = "AdminGUI"
    gui.Parent = player.PlayerGui

    -- Main Frame
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.4, 0, 0.6, 0)
    frame.Position = UDim2.new(0.3, 0, 0.2, 0)
    frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    frame.BorderSizePixel = 0
    frame.Parent = gui

    -- UICorner for rounded edges
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = frame

    -- Title Label
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0.1, 0)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "Admin Panel"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.SourceSansBold
    title.TextSize = 28
    title.Parent = frame

    -- Close Button
    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0.15, 0, 0.1, 0)
    closeButton.Position = UDim2.new(0.85, 0, 0, 0)
    closeButton.Text = "X"
    closeButton.TextColor3 = Color3.fromRGB(255, 0, 0)
    closeButton.Font = Enum.Font.SourceSansBold
    closeButton.TextSize = 24
    closeButton.BackgroundTransparency = 1
    closeButton.Parent = frame

    closeButton.MouseButton1Click:Connect(function()
        gui:Destroy()  -- Close the GUI
    end)

    -- Command Input Box
    local commandInput = Instance.new("TextBox")
    commandInput.Size = UDim2.new(0.9, 0, 0.1, 0)
    commandInput.Position = UDim2.new(0.05, 0, 0.15, 0)
    commandInput.PlaceholderText = "Enter Command"
    commandInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    commandInput.Font = Enum.Font.SourceSans
    commandInput.TextSize = 18
    commandInput.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    commandInput.BorderSizePixel = 0
    commandInput.Parent = frame

    local inputCorner = Instance.new("UICorner")
    inputCorner.CornerRadius = UDim.new(0, 5)
    inputCorner.Parent = commandInput

    -- Execute Button
    local executeButton = Instance.new("TextButton")
    executeButton.Size = UDim2.new(0.9, 0, 0.1, 0)
    executeButton.Position = UDim2.new(0.05, 0, 0.3, 0)
    executeButton.Text = "Execute"
    executeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    executeButton.Font = Enum.Font.SourceSansBold
    executeButton.TextSize = 20
    executeButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    executeButton.BorderSizePixel = 0
    executeButton.Parent = frame

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 5)
    buttonCorner.Parent = executeButton

    -- Player List for Selection
    local playerListFrame = Instance.new("ScrollingFrame")
    playerListFrame.Size = UDim2.new(0.9, 0, 0.35, 0)
    playerListFrame.Position = UDim2.new(0.05, 0, 0.45, 0)
    playerListFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    playerListFrame.BorderSizePixel = 0
    playerListFrame.ScrollBarThickness = 8
    playerListFrame.Parent = frame

    local listCorner = Instance.new("UICorner")
    listCorner.CornerRadius = UDim.new(0, 5)
    listCorner.Parent = playerListFrame

    local uiListLayout = Instance.new("UIListLayout")
    uiListLayout.Padding = UDim.new(0, 5)
    uiListLayout.Parent = playerListFrame

    -- Function to find the closest player match
    local function findClosestPlayer(name)
        local closestPlayer = nil
        local shortestDistance = math.huge

        for _, player in pairs(game.Players:GetPlayers()) do
            local distance = string.len(name) - string.len(player.Name)
            if distance < shortestDistance then
                shortestDistance = distance
                closestPlayer = player
            end
        end

        return closestPlayer
    end

    -- Populate player list
    local function populatePlayerList()
        for _, plr in pairs(game.Players:GetPlayers()) do
            local playerButton = Instance.new("TextButton")
            playerButton.Size = UDim2.new(1, 0, 0, 40)
            playerButton.Text = plr.Name
            playerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            playerButton.Font = Enum.Font.SourceSansBold
            playerButton.TextSize = 18
            playerButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            playerButton.BorderSizePixel = 0
            playerButton.Parent = playerListFrame

            local buttonCorner = Instance.new("UICorner")
            buttonCorner.CornerRadius = UDim.new(0, 5)
            buttonCorner.Parent = playerButton

            playerButton.MouseButton1Click:Connect(function()
                commandInput.Text = "kick " .. plr.Name .. " <reason>"
            end)
        end
    end

    populatePlayerList()

    -- Unload Button
    local unloadButton = Instance.new("TextButton")
    unloadButton.Size = UDim2.new(0.9, 0, 0.1, 0)
    unloadButton.Position = UDim2.new(0.05, 0, 0.85, 0)
    unloadButton.Text = "Unload Admin GUI"
    unloadButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    unloadButton.Font = Enum.Font.SourceSansBold
    unloadButton.TextSize = 20
    unloadButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    unloadButton.BorderSizePixel = 0
    unloadButton.Parent = frame

    local unloadCorner = Instance.new("UICorner")
    unloadCorner.CornerRadius = UDim.new(0, 5)
    unloadCorner.Parent = unloadButton

    unloadButton.MouseButton1Click:Connect(function()
        gui:Destroy()  -- Close the GUI
    end)

    -- Functionality for executing commands
    executeButton.MouseButton1Click:Connect(function()
        local command = commandInput.Text
        if command and command ~= "" then
            print("Executing command: " .. command)

            -- Help Command
            if command:lower() == "help" then
                print("Available Commands:")
                print("1. kick <PlayerName> <Reason>")
                print("2. load <URL>")
                print("3. unload")
                print("4. announce <Message>")
                print("5. give <PlayerName> 2633490764")
                print("6. help")
                commandInput.Text = ""

            -- Kick Command
            elseif command:lower():match("^kick (%S+) (.+)$") then
                local targetPlayerName, reason = command:match("kick (%S+) (.+)")
                local targetPlayer = findClosestPlayer(targetPlayerName)
                if targetPlayer then
                    targetPlayer:Kick("Kicked by admin: " .. reason)
                    print(targetPlayer.Name .. " has been kicked. Reason: " .. reason)
                else
                    print("Player not found")
                end

            -- Announcement Command
            elseif command:lower():match("^announce (.+)$") then
                local message = command:match("announce (.+)")
                game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(message, "All")
                print("Announcement sent: " .. message)

            -- Give Item Command
            elseif command:lower():match("^give (%S+)$") then
                local targetPlayerName = command:match("give (%S+)")
                local targetPlayer = findClosestPlayer(targetPlayerName)
                if targetPlayer then
                    print("Gave item 2633490764 to " .. targetPlayer.Name)
                else
                    print("Player not found")
                end
            else
                print("Invalid command")
            end
        end
    end)
end
