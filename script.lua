local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Script by Swordikk | ⚡Realistik_Driving_Simulator", HidePremium = false, IntroText = "Script for Malfoy4ik", SaveConfig = true, IntroEnabled = true, ConfigFolder = "Scripts"})

local Humanoid = game.Players.LocalPlayer.Character.Humanoid
local HumanoidRootPart = game.Players.LocalPlayer.Character.HumanoidRootPart

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

local Tab = Window:MakeTab({
	Name = "AutoFarm",
	Icon = "rbxassetid://4483362748",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "AutoFarm Cash/Miles",
	Callback = function()
		game.Workspace.PanikPassCar.Body:WaitForChild("#Weight").CFrame = CFrame.new(-1017.6805419921875, 210.262760162353516, 2818.939697265625)
  	end    
})

Tab:AddDropdown({
	Name = "Spawn Car",
	Default = "None",
	Options = {"Favia 500", "Pegasus Nexus", "", ""},
	Callback = function(Option)
		if Option == "Favia 500" then
			game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SpawnCar"):FireServer("Favia 500")
		elseif Option == "Pegasus Nexus" then
			game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SpawnCar"):FireServer("Pegasus Nexus")
		end
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
