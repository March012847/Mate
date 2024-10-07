-- List of admin User IDs
local admins = {
    2633490764, -- Replace with actual User IDs
    87654321,   -- Another example User ID
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

-- Function to find the closest player match
local function findClosestPlayer(name)
    local closestPlayer = nil
    local shortestDistance = math.huge  -- Start with a large distance

    for _, player in pairs(game.Players:GetPlayers()) do
        local distance = string.len(name) - string.len(player.Name)  -- Simple length comparison
        if distance < shortestDistance then
            shortestDistance = distance
            closestPlayer = player
        end
    end

    return closestPlayer
end

-- Create the GUI only if the player is an admin
local player = game.Players.LocalPlayer
if isAdmin(player) then
    -- Create the ScreenGui (store it in ReplicatedStorage to keep it active)
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local guiClone = replicatedStorage:FindFirstChild("AdminGUI") or Instance.new("ScreenGui")
    guiClone.Name = "AdminGUI"
    
    -- Create the Frame
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.3, 0, 0.5, 0)
    frame.Position = UDim2.new(0.35, 0, 0.25, 0)
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.Parent = guiClone

    -- Create the Close Button
    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0.2, 0, 0.1, 0)
    closeButton.Position = UDim2.new(0.4, 0, 0.9, 0)
    closeButton.Text = "Close"
    closeButton.Parent = frame

    closeButton.MouseButton1Click:Connect(function()
        guiClone:Destroy()  -- Close the GUI
    end)

    -- Create a TextBox for command input
    local commandInput = Instance.new("TextBox")
    commandInput.Size = UDim2.new(0.8, 0, 0.2, 0)
    commandInput.Position = UDim2.new(0.1, 0, 0.1, 0)
    commandInput.PlaceholderText = "Enter Command"
    commandInput.Parent = frame

    -- Create an Execute Button
    local executeButton = Instance.new("TextButton")
    executeButton.Size = UDim2.new(0.2, 0, 0.1, 0)
    executeButton.Position = UDim2.new(0.4, 0, 0.4, 0)
    executeButton.Text = "Execute"
    executeButton.Parent = frame

    executeButton.MouseButton1Click:Connect(function()
        local command = commandInput.Text
        if command and command ~= "" then
            -- Handle the command execution here
            print("Executing command: " .. command)

            -- Help command
            if command:lower() == "help" then
                print("Available Commands:")
                print("1. kick <PlayerName> <Reason> - Kicks the specified player with a reason.")
                print("2. load <URL> - Loads and executes a script from the specified URL.")
                print("3. unload - Unloads the admin GUI.")
                print("4. announce <Message> - Announces a message to all players.")
                print("5. give <PlayerName> 2633490764 - Gives the specified item to the player.")
                print("6. help - Shows this help message.")
                commandInput.Text = ""
                return
            end

            -- Announcement command
            local announcement = command:match("^announce (.+)$")
            if announcement then
                game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(announcement, "All")
                print("Announcement sent: " .. announcement)
                commandInput.Text = ""
                return
            end

            -- Give item command
            local giveCommand = command:match("^give (%S+)$")
            if giveCommand then
                local targetPlayerName = giveCommand
                local targetPlayer = findClosestPlayer(targetPlayerName)
                
                if targetPlayer then
                    local success, errorMessage = pcall(function()
                        local item = Instance.new("Tool")  -- Create a Tool instance
                        item.Name = "Item"  -- Set a default name for the item
                        -- Set the item properties (you can customize this as needed)
                        item.Parent = targetPlayer.Backpack  -- Give the item to the target player’s backpack
                    end)
                    if success then
                        print("Gave " .. targetPlayer.Name .. " the item with ID: 2633490764")
                    else
                        print("Error giving item: " .. errorMessage)
                    end
                else
                    print("Player not found matching: " .. targetPlayerName)
                end
                commandInput.Text = ""
                return
            end

            -- Kick command with reason
            local kickCommand = command:match("^kick (%S+) (.+)$")
            if kickCommand then
                local targetPlayerName, reason = kickCommand:match("(%S+) (.+)")
                local targetPlayer = findClosestPlayer(targetPlayerName)
                if targetPlayer then
                    targetPlayer:Kick("You have been kicked by an admin: " .. reason)
                    print(targetPlayer.Name .. " has been kicked. Reason: " .. reason)
                else
                    print("Player not found matching: " .. targetPlayerName)
                end
            elseif command:match("^load (.+)$") then
                -- Command to load a script from GitHub
                local url = command:match("^load (.+)$")
                local success, result = pcall(function()
                    return game:HttpGet(url) -- Fetch the code from the URL
                end)
                
                if success then
                    -- Use loadstring to execute the fetched code
                    local func, loadError = loadstring(result)
                    if func then
                        func() -- Execute the loaded function
                        print("Successfully executed script from: " .. url)
                    else
                        print("Error loading script: " .. loadError)
                    end
                else
                    print("Error fetching script: " .. result)
                end
            end
            
            -- Clear the command input after execution
            commandInput.Text = ""
        end
    end)

    -- Create an Unload Button
    local unloadButton = Instance.new("TextButton")
    unloadButton.Size = UDim2.new(0.2, 0, 0.1, 0)
    unloadButton.Position = UDim2.new(0.4, 0, 0.7, 0)
    unloadButton.Text = "Unload"
    unloadButton.Parent = frame

    unloadButton.MouseButton1Click:Connect(function()
        guiClone:Destroy()  -- Remove the GUI from the player
        print("Admin GUI unloaded.")
    end)

    -- Create a ListBox for player selection
    local playerList = Instance.new("ScrollingFrame")
    playerList.Size = UDim2.new(0.8, 0, 0.3, 0)
    playerList.Position = UDim2.new(0.1, 0, 0.5, 0)
    playerList.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    playerList.Parent = frame

    local uiListLayout = Instance.new("UIListLayout")
    uiListLayout.Parent = playerList

    -- Populate the ListBox with players
    local function populatePlayerList()
        for _, player in ipairs(game.Players:GetPlayers()) do
            local playerButton = Instance.new("TextButton")
            playerButton.Size = UDim2.new(1, 0, 0, 30)
            playerButton.Text = player.Name
            playerButton.Parent = playerList

            playerButton.MouseButton1Click:Connect(function()
                commandInput.Text = "kick " .. player.Name .. " <reason>"  -- Set the command input to kick the selected player with a placeholder for the reason
            end)
        end
    end

    populatePlayerList()

    -- Parent the GUI to the PlayerGui, but keep a reference in ReplicatedStorage
    guiClone.Parent = player:WaitForChild("PlayerGui")
    replicatedStorage:ClearAllChildren() -- Clear any previous instances to avoid duplicates
    guiClone:Clone().Parent = replicatedStorage -- Store the GUI in ReplicatedStorage
end
