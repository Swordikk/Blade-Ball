loadstring(game:HttpGet("https://raw.githubusercontent.com/zakater5/LuaRepo/main/YBA/v3.lua"))()
game.CoreGui:WaitForChild("Bitch Boy V3"):Destroy()

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Script by Swordikk | ⚡️YBA", HidePremium = false, IntroText = "Script for YBA", SaveConfig = true, IntroEnabled = true, ConfigFolder = "Scripts"})

local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:FindFirstChildOfClass("Humanoid")
local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

local LuckyArrow = {
    [1] = "PurchaseShopItem",
    [2] = {
        ["ItemName"] = "1x Lucky Arrow"
    }
}

local function getItem(itemName)
    return Player.Backpack:FindFirstChild(itemName) or Player.Character:FindFirstChild(itemName)
end

local function AutoItem(itemName)
    while _G[itemName] do
        wait(0.01)
        local item = getItem(itemName)  -- Получаем текущий статус предмета
        if item then
            item.Parent = Character  -- Берем предмет в руки
            wait(1)  -- Ожидание перед продажей или использованием
            local args = {
                [1] = "EndDialogue",
                [2] = {
                    ["Option"] = "Option2",
                    ["NPC"] = "Merchant",
                    ["Dialogue"] = "Dialogue5"
                }
            }
            game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(args))
        end
    end
end

---- Tab Home ----
local Tab = Window:MakeTab({
    Name = "Home",
    Icon = "rbxassetid://4370345144",
    PremiumOnly = false
})

---- Tab Farming ----
local Tab = Window:MakeTab({
    Name = "Farming",
    Icon = "rbxassetid://4483364237",
    PremiumOnly = false
})

Tab:AddToggle({
        Name = "AutoFarm",
        Default = false,
        Callback = function(Value)
		
  	end    
})


---- Tab Items ----
local Tab = Window:MakeTab({
    Name = "Items",
    Icon = "rbxassetid://4335482575",
    PremiumOnly = false
})

local items = {
    "Rokakaka",
    "Gold Coin",
    "Mysterious Arrow",
    "Diamond",
    "Rib Cage of The Saint's Corpse",
    "Pure Rokakaka",
    "Stone Mask",
    "Dio's Diary",
    "Quinton's Glove",
    "Ancient Scroll",
    "SteelBallRunWins"
}

for _, itemName in ipairs(items) do
    Tab:AddToggle({
        Name = "Auto Sell " .. itemName,
        Default = false,
        Callback = function(Value)
            _G[itemName] = Value  -- Устанавливаем глобальную переменную для этого предмета
            if Value then
                AutoItem(itemName)
            end
        end
    })
end

---- Tab Misc ----
local Tab = Window:MakeTab({
    Name = "Misc",
    Icon = "",
    PremiumOnly = false
})

Tab:AddToggle({
        Name = "Buy Lucky Arrow",
        Default = false,
        Callback = function(Value)
while Value == true do wait(0.5)
game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(LuckyArrow))
end
  	end
})

OrionLib:Init()
