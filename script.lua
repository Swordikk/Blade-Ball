local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Script by Swordikk | ⚡Pet Simulator X", HidePremium = false, IntroText = "Script for Pet Simulator X", SaveConfig = true, IntroEnabled = true, ConfigFolder = "Scripts"})

local Humanoid = game.Players.LocalPlayer.Character.Humanoid
local HumanoidRootPart = game.Players.LocalPlayer.Character.HumanoidRootPart

function AutoFarmDiamonds()
	while _G.AutoFarmDiamonds == true do
		for i, v in pairs(game:GetService("Workspace"):WaitForChild("__THINGS").Coins:GetChildren()) do
            if (HumanoidRootPart.Position - v.Coin.Position).magnitude < 200 and (
				v.Coin.MeshId == "rbxassetid://13087914804" or 
				v.Coin.MeshId == "rbxassetid://13087826929" or 
				v.Coin.MeshId == "rbxassetid://13087884875"or 
				v.Coin.MeshId == "rbxassetid://6356575794") then wait(0.5)
                HumanoidRootPart.CFrame = v.Coin.CFrame
			else
				for i, v in pairs(game:GetService("Workspace"):WaitForChild("__THINGS").Lootbags:GetChildren()) do
					wait(0.5)
					HumanoidRootPart.CFrame = v.CFrame
				end
            end
		end
	end
end

function AutoOpenEggs()
	while _G.AutoOpenEggs == true do
		if HumanoidRootPart.CFrame ~= CFrame.new(6971.98975, -155.867203, 4101.33984, -0.0930883139, 1.1291386e-07, -0.995657861, 5.01153075e-08, 1, 1.08720798e-07, 0.995657861, -3.9777067e-08, -0.0930883139) then
			HumanoidRootPart.CFrame = CFrame.new(6971.98975, -155.867203, 4101.33984, -0.0930883139, 1.1291386e-07, -0.995657861, 5.01153075e-08, 1, 1.08720798e-07, 0.995657861, -3.9777067e-08, -0.0930883139)
		end
		wait(0.5)
		game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunction"):InvokeServer(unpack(BarnDoodleEgg))
		wait(3.3)
	end
end

function WalkSpeed()
	while _G.WalkSpeed do game:GetService("RunService").RenderStepped:wait()
	    Humanoid.WalkSpeed = _G.WalkSpeed
    end
end

function JumpPower()
	while _G.JumpPower do game:GetService("RunService").RenderStepped:wait()
	    Humanoid.JumpPower = _G.JumpPower
    end
end

local BarnDoodleEgg = {
    [1] = "Barn Doodle Egg",
    [2] = false,
    [3] = false
}

local Tab = Window:MakeTab({
	Name = "AutoFarm",
	Icon = "rbxassetid://4483362748",
	PremiumOnly = false
})

Tab:AddToggle({
	Name = "Auto Farm Diamonds",
	Default = false,
	Callback = function(Value)
		_G.AutoFarmDiamonds = Value
		AutoFarmDiamonds()
	end    
})

Tab:AddToggle({
	Name = "Auto Farm Fruits",
	Default = false,
	Callback = function(Value)
		
	end    
})

Tab:AddToggle({
	Name = "Auto Open Eggs",
	Default = false,
	Callback = function(Value)
		_G.AutoOpenEggs = Value
		AutoOpenEggs()
	end    
})

local Tab = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483362748",
	PremiumOnly = false
})

Tab:AddTextbox({
	Name = "WalkSpeed",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		_G.WalkSpeed = Value
		WalkSpeed()
	end
})

Tab:AddTextbox({
	Name = "JumpPower",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		_G.JumpPower = Value
		JumpPower()
	end
})

Tab:AddToggle({
	Name = "Anti-AFK",
	Default = false,
	Callback = function(Value)
		if Value == true then
			while not game:IsLoaded() do wait() end
			repeat wait() until game.Players.LocalPlayer.Character
			Players = game:GetService("Players")
			local GC = getconnections or get_signal_cons
			if GC then
				for i,v in pairs(GC(Players.LocalPlayer.Idled)) do
					if v["Disable"] then v["Disable"](v)
					elseif v["Disconnect"] then v["Disconnect"](v)
					end
				end
			else
			Players.LocalPlayer.Idled:Connect(function()
				VirtualUser:CaptureController()
				VirtualUser:ClickButton2(Vector2.new())
  				end)
			end
		end
	end
})
