--[[
Exploit Concept: Fast Auto-Poop with Big Poop Focus (Compkiller UI Integration)
Description: Auto-fires `PoopChargeStart` and `PoopEvent` on toggle.
Includes button to equip heaviest poop tool and auto-sell filtered by tool weight.
Note: Requires Compkiller UI. Use in exploit executor. Violates Roblox TOS.
]]--

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local poopChargeStart = ReplicatedStorage:WaitForChild("PoopChargeStart")
local poopEvent = ReplicatedStorage:WaitForChild("PoopEvent")
local poopResponseChosen = ReplicatedStorage:WaitForChild("PoopResponseChosen")

local Compkiller = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/CompKiller/refs/heads/main/src/source.luau"))()
local Window = Compkiller.new({
    Name = "Auto Pooper",
    Keybind = "LeftAlt",
    Logo = "rbxassetid://109700863387451",
    Scale = Compkiller.Scale.Window,
    TextSize = 15,
})

local Tab = Window:DrawTab({
    Name = "Pooper",
    Icon = "poo",
    EnableScrolling = false
})

local Section = Tab:DrawSection({
    Name = "Main",
    Position = "left"
})

-- Auto Poop Delay
local delayValue = 0.08
local chargeDelay = 0.08
local loopEnabled = false
local sellLoopEnabled = false

-- Auto Poop Function
local function fastPoopLoop()
    while loopEnabled do
        pcall(function()
            poopChargeStart:FireServer()
            task.wait(chargeDelay)
            poopEvent:FireServer(1)
        end)
        task.wait(delayValue)
    end
end

-- Auto Sell Function (no weight filtering)
local function autoSellLoop()
    while sellLoopEnabled do
        poopResponseChosen:FireServer("2. [I want to sell my inventory.]")
        task.wait(2.2)
    end
end

-- Equip Heaviest Poop Tool Function
local function equipHeaviestTool()
    local heaviestTool = nil
    local maxLbs = -1
    for _, tool in ipairs(backpack:GetChildren()) do
        if tool:IsA("Tool") then
            local lbsString = tool.Name:match("%((%d+%.?%d*) lbs%)")
            if lbsString then
                local lbs = tonumber(lbsString)
                if lbs and lbs > maxLbs then
                    maxLbs = lbs
                    heaviestTool = tool
                end
            end
        end
    end
    if heaviestTool then
        humanoid:EquipTool(heaviestTool)
    end
end

-- UI Elements
Section:AddToggle({
    Name = "Auto Poop Fast",
    Flag = "Auto_Poop_Toggle",
    Default = false,
    Callback = function(state)
        loopEnabled = state
        if state then
            task.spawn(fastPoopLoop)
        end
    end
})

Section:AddButton({
    Name = "Equip Heaviest Poop",
    Callback = equipHeaviestTool
})

Section:AddToggle({
    Name = "Auto Sell All",
    Flag = "Auto_Sell_Toggle",
    Default = false,
    Callback = function(state)
        sellLoopEnabled = state
        if state then
            task.spawn(autoSellLoop)
        end
    end
})
