-- Configuration
local Admins = { "Player1", "Player2" }  -- Add your Roblox usernames here
local prefix = "!" -- Command prefix

-- List of available commands
local commands = {
    help = function()
        return "Available commands:\n1. help - Lists all commands\n2. print <text> - Prints the specified text"
    end,
    
    print = function(text)
        return text or "No text provided!"
    end
}

-- Function to check if a player is an admin
local function isAdmin(player)
    for _, adminName in pairs(Admins) do
        if player.Name == adminName then
            return true
        end
    end
    return false
end

-- Function to create the Admin Console GUI
local function createAdminConsole(player)
    -- Only allow admins to create the GUI
    if not isAdmin(player) then return end

    -- Create ScreenGui for the console
    local adminGui = Instance.new("ScreenGui")
    adminGui.Name = "AdminConsoleGui"
    adminGui.Parent = player:WaitForChild("PlayerGui")

    -- Create Command Input Box (TextBox)
    local commandBox = Instance.new("TextBox")
    commandBox.Size = UDim2.new(0.5, 0, 0.1, 0) -- Half width, 10% height
    commandBox.Position = UDim2.new(0.25, 0, 0.7, 0) -- Centered near the bottom
    commandBox.PlaceholderText = "Enter command..."
    commandBox.Text = ""
    commandBox.TextScaled = true
    commandBox.Parent = adminGui

    -- Create Output Box (TextLabel)
    local outputBox = Instance.new("TextLabel")
    outputBox.Size = UDim2.new(0.5, 0, 0.6, 0) -- Half width, 60% height
    outputBox.Position = UDim2.new(0.25, 0, 0.05, 0) -- Centered near the top
    outputBox.Text = "Output will appear here..."
    outputBox.TextScaled = true
    outputBox.TextWrapped = true
    outputBox.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    outputBox.TextColor3 = Color3.new(1, 1, 1)
    outputBox.Parent = adminGui

    -- Function to process commands
    local function processCommand(input)
        -- Check if the command starts with the defined prefix
        if string.sub(input, 1, #prefix) == prefix then
            -- Remove the prefix from the input
            local strippedInput = string.sub(input, #prefix + 1)
            
            -- Split the input into command and arguments
            local splitInput = string.split(strippedInput, " ")
            local command = splitInput[1]
            table.remove(splitInput, 1) -- Remove the first part (command), leaving the arguments
            local args = table.concat(splitInput, " ")

            -- Check if the command exists in the command list
            if commands[command] then
                -- Execute the command and get the output
                local result = commands[command](args)
                outputBox.Text = result
            else
                -- Invalid command message
                outputBox.Text = "This command is not found. Use 'help' for help."
            end
        else
            outputBox.Text = "Please use the correct prefix (" .. prefix .. ") for commands."
        end
    end

    -- Detect when the admin enters a command and executes it
    commandBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local command = commandBox.Text
            processCommand(command)
            commandBox.Text = "" -- Clear the input after execution
        end
    end)
end

-- Setup admin GUI when a player joins
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        createAdminConsole(player)
    end)
end)
