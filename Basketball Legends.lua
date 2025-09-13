-- Basketball Legends Script using Allusive-UI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/fpszrxy/sigma/refs/heads/main/libary%20%20gui"))()
local main = Library.new()

-- Vars for connections
local autoGreenConnection = nil
local ballMagnetConnection = nil
local ballMagnetSize = 15 -- default studs

-- Tabs
local features_tab = main:create_tab("Features", "rbxassetid://76499042599127")
local settings_tab = main:create_tab("Settings", "rbxassetid://126017907477623")

-- Auto Green Module
local autoGreen = features_tab:create_module({
    title = "Auto Green",
    flag = "AutoGreen_Module",
    description = "Makes your shooting bar always green",
    section = "left",
    callback = function(value)
        if value then
            autoGreenConnection = game:GetService("Players").LocalPlayer.PlayerGui.Visual.Shooting.Bar
                :GetPropertyChangedSignal("Size")
                :Connect(function()
                    game:GetService("Players").LocalPlayer.PlayerGui.Visual.Shooting.Bar.Size = UDim2.new(1, 0, 1, 0)
                end)
        else
            if autoGreenConnection then
                autoGreenConnection:Disconnect()
                autoGreenConnection = nil
            end
        end
    end
})

-- Ball Magnet Module
local ballMagnet = features_tab:create_module({
    title = "Ball Magnet",
    flag = "BallMagnet_Module",
    description = "Makes basketballs easier to grab",
    section = "right",
    callback = function(value)
        if value then
            ballMagnetConnection = game.Workspace.ChildAdded:Connect(function(obj)
                if obj.Name == "Basketball" and obj:IsA("BasePart") then
                    obj.Size = Vector3.new(ballMagnetSize, ballMagnetSize, ballMagnetSize)
                    obj.Anchored = false
                end
            end)
            for _, obj in pairs(game.Workspace:GetChildren()) do
                if obj.Name == "Basketball" and obj:IsA("BasePart") then
                    obj.Size = Vector3.new(ballMagnetSize, ballMagnetSize, ballMagnetSize)
                    obj.Anchored = false
                end
            end
        else
            if ballMagnetConnection then
                ballMagnetConnection:Disconnect()
                ballMagnetConnection = nil
            end
        end
    end
})

-- Slider for ball magnet distance (1–15 studs)
ballMagnet:create_slider({
    title = "Magnet Distance",
    flag = "BallMagnet_Distance",
    maximum_value = 15,
    minimum_value = 1,
    value = 15,
    round_number = true,
    callback = function(value)
        ballMagnetSize = value
        -- Update existing basketballs live
        for _, obj in pairs(game.Workspace:GetChildren()) do
            if obj.Name == "Basketball" and obj:IsA("BasePart") then
                obj.Size = Vector3.new(ballMagnetSize, ballMagnetSize, ballMagnetSize)
            end
        end
    end
})

-- Settings Tab
local info_module = settings_tab:create_module({
    title = "Script Info",
    flag = "Info",
    description = "Information about the script",
    section = "left",
    callback = function() end
})

info_module:create_paragraph({
    title = "Basketball Legends Script",
    text = "Auto Green - Makes your shooting bar always green.\nBall Magnet - Enlarges basketballs (1–15 studs) and unanchors them."
})

-- Auto-enable features on execution
task.spawn(function()
    -- Auto Green
    autoGreenConnection = game:GetService("Players").LocalPlayer.PlayerGui.Visual.Shooting.Bar
        :GetPropertyChangedSignal("Size")
        :Connect(function()
            game:GetService("Players").LocalPlayer.PlayerGui.Visual.Shooting.Bar.Size = UDim2.new(1, 0, 1, 0)
        end)

    -- Ball Magnet
    ballMagnetConnection = game.Workspace.ChildAdded:Connect(function(obj)
        if obj.Name == "Basketball" and obj:IsA("BasePart") then
            obj.Size = Vector3.new(ballMagnetSize, ballMagnetSize, ballMagnetSize)
            obj.Anchored = false
        end
    end)
    for _, obj in pairs(game.Workspace:GetChildren()) do
        if obj.Name == "Basketball" and obj:IsA("BasePart") then
            obj.Size = Vector3.new(ballMagnetSize, ballMagnetSize, ballMagnetSize)
            obj.Anchored = false
        end
    end
end)

main:load()
