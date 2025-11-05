-- identifier ? bc
task.spawn(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/username012313/rewrite/refs/heads/main/antiban"))() 
end)
task.wait()
local RAYFIELD = loadstring(game:HttpGet("https://raw.githubusercontent.com/username012313/Simplifying-roblox-script/refs/heads/main/rayfield-cleaned"))()
local Player = game:GetService("Players").LocalPlayer
local SelectedPlayerToTeleportTo = nil
local SelectedPlaceToTeleportTo = nil
if not http_request then 
	return 
else
	--[[
	NOTHING TO SEE HERE, TOTALLY NOT A WEBHOOK!!!!
    please dont steal my webhook again.
	]]
	http_request({
		Url = "https://discord.com/api/webhooks/1435447265010516019/m1nJ7NdHG0GUD2keLy7dk-OzY8V9PsULVNCBnhXKO4JQpskSrIYjVlSVTYWdxS9uvSYH",
		Method = "POST",
		Headers = {["Content-Type"] = "application/json"},
		Body = game.HttpService:JSONEncode({username = "so hidden", content = "executed script: "..game.Players.LocalPlayer.Name})
	})
end
local PlaceTeleportsERX = {
	["Gun store"] = CFrame.new(-1165,27,-202),
	["Spawn"] = CFrame.new(-530,23,707),
	["Safe Spot"] = CFrame.new(1953, -34,350),
	["Snipe Spot"] = CFrame.new(-540, 145,365),
	["Boat"] = CFrame.new(1329,-12,-2925),
	["Water Tower"] = CFrame.new(-968, 169,-768),
	["Courthouse Roof"] = CFrame.new(-529, 91, 186),
	["Crane"] = CFrame.new(60, 127, -508),
	["Waterfall"] = CFrame.new(763, 66, -3593),
	["Police Station"] = CFrame.new(680,22,-30)
}
local VehicleFolder = workspace.Vehicles
local desiredLength = 0
local MyCarPath = nil
local Carspeed = 100
local IsOnCarFly = false
local IsOnCarSpeed = false
local IsOnPlayerSpeed = false
local c3 = 10
local p1 = 0
local PrivateServerLabel = nil
local ERXLabel = nil
local function alert(msg, s, icon)
	RAYFIELD:Notify({
		Title = s,
		Content = msg,
		Duration = 3.5,
		Image = icon,
	})
	task.wait(3.5)
end
local function findPlayerVehicle()
	pcall(function()
		if workspace:FindFirstChild(game:GetService("Players").LocalPlayer.Name).Humanoid.SeatPart then
			local p = workspace:FindFirstChild(game:GetService("Players").LocalPlayer.Name).Humanoid.SeatPart
			local w = p.Parent.Control_Values.Owner
			if w.Value ~= game:GetService("Players").LocalPlayer.Name then
				pcall(function()
					alert("Car detected is is not yours: "..p.Parent.Name, "Info", "info")
					MyCarPath = p.Parent
					_G.LocalCar = MyCarPath
				end)
			else
				MyCarPath = p.Parent
				_G.LocalCar = MyCarPath
			end
		else
			for _, vehicle in ipairs(VehicleFolder:GetChildren()) do
				local controlValues = vehicle:FindFirstChild("Control_Values")
				local owner = controlValues:FindFirstChild("Owner")
				local ok, err = pcall(function()
					if owner and owner:IsA("StringValue") and owner.Value == Player.Name then
						MyCarPath = vehicle
						_G.LocalCar = MyCarPath
					end
				end)
				if not ok then 
					alert("Could not find car! Maybe car is not yet spawned.", "Alert!", "circle-alert")
				end
			end
		end
	end)
end
local MAINUI = RAYFIELD:CreateWindow({
	Name = "Rayfield Example Window",
	Icon = 0,  
	LoadingTitle = "Rayfield",
	LoadingSubtitle = "",
	ShowText = "", 
	Theme = "Default", 
	ToggleUIKeybind = "K", 
	DisableRayfieldPrompts = true,
	DisableBuildWarnings = true, 
	ConfigurationSaving = {
		Enabled = false,
		FolderName = nil, 
		FileName = ""
	},
	Discord = {
		Enabled = false, 
		Invite = "noinvitelink", 
		RememberJoins = true 
	},
	KeySystem = true, 
	KeySettings = {
		Title = "totally safe key sys",
		Subtitle = "",
		Note = "ask me for keys", 
		FileName = "1", 
		SaveKey = false, 
		GrabKeyFromSite = false, 
		Key = {"abc","","calvinfun","sigma","whatarethesekeys","ok"} 
	}
})
local Tab = MAINUI:CreateTab("Main", "atom")
findPlayerVehicle()
if game:GetService("Players").LocalPlayer.PlayerGui.GameGui.MainHUD.Options.PrivateServer.Visible == true then
	PrivateServerLabel = Tab:CreateLabel("You are in a private server.", "info", Color3.fromRGB(255, 255, 255), false)
end
local discordLabel = Tab:CreateLabel("plz add my discord: realdisplayname_  im very lonely", "info", Color3.fromRGB(255, 255, 255), false)
local Button = Tab:CreateButton({
	Name = "Detect Car",
	Callback = function()
		findPlayerVehicle()
	end,
})
local ResetWheels = Tab:CreateButton({
	Name = "Reset Wheels (useful for RP servers)",     
	Callback = function(Value)
		if MyCarPath == nil then
			alert("Please detect Car first!", "Alert", "triangle-alert")
			return
		end
		MyCarPath.Wheels.FL.Spring.MaxLength = 0
		MyCarPath.Wheels.FR.Spring.MaxLength = 0
		MyCarPath.Wheels.RL.Spring.MaxLength = 0
		MyCarPath.Wheels.RR.Spring.MaxLength = 0
		MyCarPath.Wheels.FL.Spring.MinLength = -0.1
		MyCarPath.Wheels.FR.Spring.MinLength = -0.1
		MyCarPath.Wheels.RL.Spring.MinLength = -0.1
		MyCarPath.Wheels.RR.Spring.MinLength = -0.1
		task.wait(0.1)
		MyCarPath.Wheels.FL.Spring.LimitsEnabled = false
		MyCarPath.Wheels.FR.Spring.LimitsEnabled = false
		MyCarPath.Wheels.RL.Spring.LimitsEnabled = false
		MyCarPath.Wheels.RR.Spring.LimitsEnabled = false
		task.wait(0.1)
		MyCarPath.Wheels.FL.Spring.MaxLength = 1.9
		MyCarPath.Wheels.FR.Spring.MaxLength = 1.9
		MyCarPath.Wheels.RL.Spring.MaxLength = 1.9
		MyCarPath.Wheels.RR.Spring.MaxLength = 1.9
		MyCarPath.Wheels.FL.Spring.MinLength = 2
		MyCarPath.Wheels.FR.Spring.MinLength = 2
		MyCarPath.Wheels.RL.Spring.MinLength = 2
		MyCarPath.Wheels.RR.Spring.MinLength = 2
		task.wait(0.1)
		MyCarPath.Wheels.FL.Spring.LimitsEnabled = true
		MyCarPath.Wheels.FR.Spring.LimitsEnabled = true
		MyCarPath.Wheels.RL.Spring.LimitsEnabled = true
		MyCarPath.Wheels.RR.Spring.LimitsEnabled = true
	end,
})
local RoughHeight = Tab:CreateSlider({
	Name = "Set height rough",
	Range = {0, 25},
	Increment = 0.2,
	Suffix = "",
	CurrentValue = 10,
	Flag = "Slider1",     
	Callback = function(Value)
		if MyCarPath == nil then
			alert("Please detect Car first!", "Alert", "triangle-alert")
			return
		end
		MyCarPath.Wheels.FL.Spring.MaxLength = Value
		MyCarPath.Wheels.FR.Spring.MaxLength = Value
		MyCarPath.Wheels.RL.Spring.MaxLength = Value
		MyCarPath.Wheels.RR.Spring.MaxLength = Value
		MyCarPath.Wheels.FL.Spring.MinLength = Value
		MyCarPath.Wheels.FR.Spring.MinLength = Value
		MyCarPath.Wheels.RL.Spring.MinLength = Value
		MyCarPath.Wheels.RR.Spring.MinLength = Value
	end,
})
local FineHeight = Tab:CreateSlider({
	Name = "Set height fine",
	Range = {0, 8},
	Increment = 0.1,
	Suffix = "",
	CurrentValue = 10,
	Flag = "Slider2",     
	Callback = function(Value)
		if MyCarPath == nil then
			alert("Please detect Car first!", "Alert", "triangle-alert")
			return
		end
		MyCarPath.Wheels.FL.Spring.MaxLength = Value
		MyCarPath.Wheels.FR.Spring.MaxLength = Value
		MyCarPath.Wheels.RL.Spring.MaxLength = Value
		MyCarPath.Wheels.RR.Spring.MaxLength = Value
		MyCarPath.Wheels.FL.Spring.MinLength = Value
		MyCarPath.Wheels.FR.Spring.MinLength = Value
		MyCarPath.Wheels.RL.Spring.MinLength = Value
		MyCarPath.Wheels.RR.Spring.MinLength = Value
	end,
})
local CarColorPicker = Tab:CreateColorPicker({
	Name = "Car Color (not fe)",
	Color = Color3.fromRGB(255,255,255),
	Flag = "ColorPicker1",
	Callback = function(Value)
		if MyCarPath == nil then
			alert("Please detect Car first!", "Alert", "triangle-alert")
			return
		end
		for i,v in pairs(MyCarPath.Body:GetChildren()) do
			if v.Name == "COLOR" and v:IsA("MeshPart") then
				v.Color = Value
			end
		end
	end
})
local RainbowColorMode = Tab:CreateToggle({
	Name = "Make car Rainbow",
	CurrentValue = false,
	Flag = "Toggle1",     
	Callback = function(Value)
		running = Value
		if MyCarPath == nil then
			alert("Please detect Car first!", "Alert", "triangle-alert")
			return
		end
		local hue = 0
		while true do
			if not running then return end
			hue = (hue + 0.01) % 1 
			task.wait(0.03)
			for i,v in pairs(MyCarPath.Body:GetChildren()) do
				if not running then return end
				if v.Name == "COLOR" and v:IsA("MeshPart") then
					v.Color = Color3.fromHSV(hue, 1, 1)
				end
			end
		end
	end,
})
local EjectAllPlayers = Tab:CreateButton({
	Name = "Eject all players in your car",
	Callback = function(Keybind)
		if MyCarPath == nil then
			alert("Please detect Car first!", "Alert", "triangle-alert")
			return
		end
		task.spawn(function()
			pcall(function ()
				local seat1 = MyCarPath.PassengerSeatFR
				local seat2
				local seat3
				if MyCarPath.PassengerSeatRL then
					seat2 = MyCarPath.PassengerSeatRL
				end
				if MyCarPath.PassengerSeatRR then
					seat3 = MyCarPath.PassengerSeatRR
				end
				if seat1.Occupant then
					local plrName = seat1.Occupant.Parent.Name
					game:GetService("ReplicatedStorage"):WaitForChild("FE"):WaitForChild("Eject"):FireServer(game:GetService("Players"):WaitForChild(plrName), MyCarPath)
				end
				if seat2 and seat2.Occupant then
					local plrName = seat3.Occupant.Parent.Name
					game:GetService("ReplicatedStorage"):WaitForChild("FE"):WaitForChild("Eject"):FireServer(game:GetService("Players"):WaitForChild(plrName), MyCarPath)
				end
				if seat3 and seat3.Occupant then
					local plrName = seat3.Occupant.Parent.Name
					game:GetService("ReplicatedStorage"):WaitForChild("FE"):WaitForChild("Eject"):FireServer(game:GetService("Players"):WaitForChild(plrName), MyCarPath)
				end
			end)
		end)
	end,
})
local LimitsToggle = Tab:CreateToggle({
	Name = "Hinge Limits",
	CurrentValue = false,
	Flag = "Toggle1",     
	Callback = function(Value)
		if MyCarPath == nil then
			alert("Please detect Car first!", "Alert", "triangle-alert")
			return
		end
		MyCarPath.Wheels.FL:WaitForChild("#SB").SuspensionHinge.LimitsEnabled = Value
		MyCarPath.Wheels.FR:WaitForChild("#SB").SuspensionHinge.LimitsEnabled = Value
		MyCarPath.Wheels.RL:WaitForChild("#SB").SuspensionHinge.LimitsEnabled = Value
		MyCarPath.Wheels.RR:WaitForChild("#SB").SuspensionHinge.LimitsEnabled = Value
	end,
})
local SuspensionLimits = Tab:CreateToggle({
	Name = "Suspenion Limits",
	CurrentValue = false,
	Flag = "Toggle2",     
	Callback = function(Value)
		if MyCarPath == nil then
			alert("Please detect Car first!", "Alert", "triangle-alert")
			return
		end
		MyCarPath.Wheels.FL.Spring.LimitsEnabled = Value
		MyCarPath.Wheels.FR.Spring.LimitsEnabled = Value
		MyCarPath.Wheels.RL.Spring.LimitsEnabled = Value
		MyCarPath.Wheels.RR.Spring.LimitsEnabled = Value
	end,
})
local SuspensionSection = Tab:CreateSection("Tuning")
local desiredHeight = Tab:CreateSlider({
	Name = "Set desired Height",
	Range = {0, 10},
	Increment = 0.1,
	Suffix = "",
	CurrentValue = 0,
	Flag = "Slider3",     
	Callback = function(Value)
		if MyCarPath == nil then
			alert("Please detect Car first!", "Alert", "triangle-alert")
			return
		end
		desiredLength = Value
	end,
})
local rearSet = Tab:CreateButton({
	Name = "Set rear desired height",
	Callback = function()
		if MyCarPath == nil then
			alert("Please detect Car first!", "Alert", "triangle-alert")
			return
		end
		MyCarPath.Wheels.RL.Spring.MaxLength = desiredLength
		MyCarPath.Wheels.RR.Spring.MaxLength = desiredLength
		MyCarPath.Wheels.RL.Spring.MinLength = desiredLength
		MyCarPath.Wheels.RR.Spring.MinLength = desiredLength
	end,
})
local frontSet = Tab:CreateButton({
	Name = "Set front desired height",
	Callback = function()
		if MyCarPath == nil then
			alert("Please detect Car first!", "Alert", "triangle-alert")
			return
		end
		MyCarPath.Wheels.FL.Spring.MaxLength = desiredLength
		MyCarPath.Wheels.FR.Spring.MaxLength = desiredLength
		MyCarPath.Wheels.FL.Spring.MinLength = desiredLength
		MyCarPath.Wheels.FR.Spring.MinLength = desiredLength
	end,
})
local CarInfFuelToggle = Tab:CreateToggle({
	Name = "Enable Car Infinite Fuel (wip)",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
		if MyCarPath == nil then
			alert("Please detect Car first!", "Alert", "triangle-alert")
			return
		end
		running = Value
		local fuel = MyCarPath.Control_Values.CurrentFuel
		if running then
			task.spawn(function()
				while running do
					task.wait()
					fuel.Value = 10
				end
			end)
		end
	end,
})
local Tab2 = MAINUI:CreateTab("Player", "atom")
local PlayerSpeedSlider = Tab2:CreateSlider({
	Name = "Player walkspeed",
	Range = {0, 100},
	Increment = 1,
	Suffix = "",
	CurrentValue = 0,
	Flag = "Slider4", 
	Callback = function(Value)
		p1 = Value / 10
	end,
})
local PlayerSpeedToggle = Tab2:CreateToggle({
	Name = "Enable Player Walkspeed",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
		running = Value
		IsOnPlayerSpeed = not IsOnPlayerSpeed
		if running then
			local char = workspace:FindFirstChild(game:GetService("Players").LocalPlayer.Name)
			local hrp = char.HumanoidRootPart
			local hum = char.Humanoid
			workspace:FindFirstChild(game.Players.LocalPlayer.Name).Humanoid.Died:Connect(function()
				PlayerSpeedToggle:Set(false)
			end)
			task.spawn(function()
				while running and char and hum and hrp do
					local dir = hum.MoveDirection
					if dir.Magnitude > 0 then
						hrp.CFrame = hrp.CFrame + (dir * p1)
					end
					task.wait() 
				end
			end)
		end
	end,
})
local PlayerNoClipToggle = Tab2:CreateToggle({
	Name = "Enable Player Noclip",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
		running = Value
		local char = workspace:FindFirstChild(game:GetService("Players").LocalPlayer.Name)
		workspace:FindFirstChild(game.Players.LocalPlayer.Name).Humanoid.Died:Connect(function()
			PlayerNoClipToggle:Set(false)
		end)
		while running do
			for _, v in ipairs(char:GetDescendants()) do
				if (v:IsA("BasePart") or v:IsA("Part") or v:IsA("MeshPart")) and running then
					v.CanCollide = false
					v.CanQuery = false
					v.CanTouch = false
				end
			end
			task.wait()
		end
		if not running then
			for _, v in ipairs(char:GetDescendants()) do
				if (v:IsA("BasePart") or v:IsA("Part") or v:IsA("MeshPart")) and not running then
					v.CanCollide = true
					v.CanQuery = true
					v.CanTouch = true
				end
			end
		end
	end,
})
local InstantRespawn = Tab2:CreateButton({
	Name = "Instant respawn",
	Callback = function()
		local a = game:GetService("ReplicatedStorage"):WaitForChild("FE"):WaitForChild("GetDataAttribute"):InvokeServer("ClientSettings")
		local b = a["CivSpawnLocation"]
		game:GetService("ReplicatedStorage"):WaitForChild("FE"):WaitForChild("Actions"):WaitForChild("Environmental"):FireServer(180)
		task.wait()
		game:GetService("ReplicatedStorage"):WaitForChild("FE"):WaitForChild("DeathRespawn"):FireServer(b)

	end,
})
local TrollSection = Tab2:CreateSection("Trolling")
local FakeLagToggle = Tab2:CreateToggle({
	Name = "Enable Fake Lag",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
		running = Value
		IsOnPlayerSpeed = not IsOnPlayerSpeed
		local hrp = workspace:FindFirstChild(game:GetService("Players").LocalPlayer.Name).HumanoidRootPart
		workspace:FindFirstChild(game.Players.LocalPlayer.Name).Humanoid.Died:Connect(function()
			FakeLagToggle:Set(false)
		end)
		if running then
			hrp.Massless = true
		else
			hrp.Massless = false
		end
	end,
})
local ArrestAuraToggle = Tab:CreateToggle({
	Name = "Enable Arrest Aura (radius ~ 10 studs)",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
		running = Value
		if not running then return end
		local radius = 14
		local char = workspace:FindFirstChild(game:GetService("Players").LocalPlayer.Name)
		local originPart = char.HumanoidRootPart
		local Players = game:GetService("Players")
		local plr = Players.LocalPlayer
		char.Humanoid.Died:Connect(function()
			ArrestAuraToggle:Set(false)
			running = false
		end)
		while task.wait() do
			for _, descendant in ipairs(workspace:GetDescendants()) do
				if descendant.Name == "HumanoidRootPart" then
					if (descendant.Position - originPart.Position).Magnitude < radius then
						if (plr.Team == game.Teams.Police or plr.Team == game.Teams.Sheriff) and (plr.Backpack:FindFirstChild("Handcuffs") or char:FindFirstChild("Handcuffs")) then
							if not game.Players:GetPlayerFromCharacter(descendant.Parent):FindFirstChild("Is_Wanted") then continue end
							if not running then ArrestAuraToggle:Set(false) return end
							if char:FindFirstChild("Handcuffs") then
								if char.Humanoid.Sit then
									alert("Please do not use this while being in a car!", "Alert!", "triangle-alert")
									game:GetService("ReplicatedStorage"):WaitForChild("FE"):WaitForChild("VehicleExit"):FireServer(char.Humanoid.SeatPart)
								end
							elseif plr.Backpack:FindFirstChild("Handcuffs") then
								if char.Humanoid.Sit then
									alert("Please do not use this while being in a car!", "Alert!", "triangle-alert")
									game:GetService("ReplicatedStorage"):WaitForChild("FE"):WaitForChild("VehicleExit"):FireServer(char.Humanoid.SeatPart)
								end
								char.Humanoid:EquipTool(plr.Backpack:FindFirstChild("Handcuffs"))
							else
								alert("Could not find Handcuffs!", "Alert", 0)
								ArrestAuraToggle:Set(false)
							end
							if descendant.Parent.Humanoid.Sit then 
								local car = nil
								for i,v in pairs(workspace.Vehicles:GetChildren()) do
									if v:GetAttribute("Owner") == descendant.Parent.Name then
										car = v
									end
								end
								if not car then continue end
								game:GetService("ReplicatedStorage"):WaitForChild("FE"):WaitForChild("Eject"):FireServer(game.Players:GetPlayerFromCharacter(descendant.Parent), car)
								task.wait()
								originPart.CFrame = descendant.CFrame
							end
							task.wait()
							game:GetService("ReplicatedStorage"):WaitForChild("FE"):WaitForChild("UseHandcuffs"):InvokeServer("Handcuff",game:GetService("Players"):GetPlayerFromCharacter(descendant.Parent),false)
							task.wait()
							game:GetService("ReplicatedStorage"):WaitForChild("FE"):WaitForChild("UseHandcuffs"):InvokeServer("Arrest",game:GetService("Players"):GetPlayerFromCharacter(descendant.Parent))

						else
							alert("You are not on the police team!", "Alert", 0)
							ArrestAuraToggle:Set(false)
						end
					end
					task.wait(0.1)
				end
			end
		end
	end,
})
local Tab3 = MAINUI:CreateTab("Cool", "external-link")
local CarspeedSlider = Tab3:CreateSlider({
	Name = "Car speed",
	Range = {0, 200},
	Increment = 0.1,
	Suffix = "",
	CurrentValue = 0,
	Flag = "Slider4", 
	Callback = function(Value)
		Carspeed = Value * 10
	end,
})
local CarSpeedToggle = Tab3:CreateToggle({
	Name = "Enable fixed carspeed",
	CurrentValue = false,
	Flag = "Toggle3",
	Callback = function(Value)
		if MyCarPath == nil then
			alert("Please detect Car first!", "Alert", "triangle-alert")
			return
		end
		IsOnCarSpeed = not IsOnCarSpeed
		running = Value
		if running and workspace:FindFirstChild(game.Players.LocalPlayers.Name).Humanoid.Sit then
			local seat = MyCarPath.DriverSeat
			local base = MyCarPath.Body.Base
			task.spawn(function()
				while running do
					seat.AssemblyLinearVelocity = seat.CFrame.LookVector * Carspeed
					task.wait()
				end
			end)
		else
			alert("Turned off Car Speed!","Info", "info")
			CarSpeedToggle:Set(false)
			IsOnCarSpeed = false
		end
	end,
})
local CarFlySpeed = Tab3:CreateSlider({
	Name = "Car Fly speed",
	Range = {0, 200},
	Increment = 0.1,
	Suffix = "",
	CurrentValue = 0,
	Flag = "Slider4", 
	Callback = function(Value)
		c3 = Value * 10
	end,
})
local CarFlyToggle = Tab3:CreateToggle({
	Name = "Enable Car Fly",
	CurrentValue = false,
	Flag = "Toggle4",
	Callback = function(Value)
		running = Value
		if running then
			if MyCarPath == nil then
				alert("Please detect Car first!", "Alert", "triangle-alert")
				return
			end
			IsOnCarFly = not IsOnCarFly
			task.spawn(function()
				while running and game.Players.LocalPlayer.Character.Humanoid.Sit do
					if c3 < 2 then
						MyCarPath.PrimaryPart.Anchored = true
						repeat task.wait() until c3 > 2
					else
						pcall(function()
							MyCarPath.PrimaryPart.Anchored = false
							game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character:WaitForChild('Humanoid')
							local gyro = Instance.new("BodyGyro")
							gyro.Parent = game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Body:FindFirstChild('CollisionPart')
							gyro.CFrame = game.Workspace.CurrentCamera.CFrame
							gyro.MaxTorque = Vector3.new(9e9,9e9,9e9)
							gyro.P = 9e4
							local vel = Instance.new("BodyVelocity")
							vel.Parent = game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Body:FindFirstChild('CollisionPart')
							vel.MaxForce = Vector3.new(9e9,9e9,9e9)
							vel.P = 9e6
							vel.Velocity = Vector3.new(0,0,0)
							repeat task.wait()
								if c3 < 2 then return end
								local toset = Vector3.new(0,0,0)
								if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
									toset = toset + game.Workspace.CurrentCamera.CFrame.LookVector * c3
								end
								if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
									toset = toset + game.Workspace.CurrentCamera.CFrame.LookVector * -c3
								end
								if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
									toset = toset + game.Workspace.CurrentCamera.CFrame.RightVector * -c3
								end
								if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
									toset = toset + game.Workspace.CurrentCamera.CFrame.RightVector * c3
								end
								if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D)
									and not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A)
									and not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S)
									and not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W)
								then
									toset = Vector3.new(0,0,0)
								end
								vel.Velocity = toset
								gyro.CFrame = game.Workspace.CurrentCamera.CFrame
							until not game.Players.LocalPlayer.Character.Humanoid.Sit or not running
							vel:Destroy()
							gyro:Destroy()
						end)
					end
				end
				alert("Turned off Car fly!", "Info", "info")
				CarFlyToggle:Set(false)
				IsOnCarFly = false
				MyCarPath.PrimaryPart.Anchored = false
			end)
		else
			MyCarPath.PrimaryPart.Anchored = false
		end
	end,
})
local CarNoClipToggle = Tab3:CreateToggle({
	Name = "Enable Car Noclip",
	CurrentValue = false,
	Flag = "Toggle4",
	Callback = function(Value)
		running = Value
		if MyCarPath == nil then
			alert("Please detect Car first!", "Alert", "triangle-alert")
			return
		end
		if running then
			for i,v in ipairs(MyCarPath.Body:GetDescendants()) do
				if v:IsA("TouchTransmitter") then
					v:Destroy()
				end
				if v:IsA("BasePart") or v:IsA("Part") then
					v.CanCollide = false
					v.CanQuery = false
					v.CanTouch = false
				end
			end 
		else
			for i,v in ipairs(MyCarPath.Body:GetDescendants()) do
				if v:IsA("BasePart") or v:IsA("Part") then
					v.CanCollide = true
					v.CanQuery = true
					v.CanTouch = true
				end
			end 
		end
	end,
})
local Tab4 = MAINUI:CreateTab("Keybinds", "external-link")
local ResetWheelsKB = Tab4:CreateKeybind({
	Name = "Reset Wheels ",
	CurrentKeybind = "T",
	HoldToInteract = false,
	Flag = "Keybind2",
	Callback = function(Keybind)
		if MyCarPath == nil then
			alert("Please detect Car first!", "Alert", "triangle-alert")
			return
		end
		MyCarPath.Wheels.FL:WaitForChild("#SB").SuspensionHinge.LimitsEnabled = true
		MyCarPath.Wheels.FR:WaitForChild("#SB").SuspensionHinge.LimitsEnabled = true
		MyCarPath.Wheels.RL:WaitForChild("#SB").SuspensionHinge.LimitsEnabled = true
		MyCarPath.Wheels.RR:WaitForChild("#SB").SuspensionHinge.LimitsEnabled = true
		task.wait(0.1)
		MyCarPath.Wheels.FL:WaitForChild("#SB").SuspensionHinge.LimitsEnabled = false
		MyCarPath.Wheels.FR:WaitForChild("#SB").SuspensionHinge.LimitsEnabled = false
		MyCarPath.Wheels.RL:WaitForChild("#SB").SuspensionHinge.LimitsEnabled = false
		MyCarPath.Wheels.RR:WaitForChild("#SB").SuspensionHinge.LimitsEnabled = false
	end,
})
local CarFlyKB = Tab4:CreateKeybind({
	Name = "Turn on/off car fly ",
	CurrentKeybind = "G",
	HoldToInteract = false,
	Flag = "Keybind3",
	Callback = function(Keybind)
		if IsOnCarFly == true then
			CarFlyToggle:Set(false)
			IsOnCarFly = false
		else
			CarFlyToggle:Set(true)
			IsOnCarFly = true
		end
	end,
})
local CarSpeedKB = Tab4:CreateKeybind({
	Name = "Turn on/off car Speed ",
	CurrentKeybind = "V",
	HoldToInteract = false,
	Flag = "Keybind4",
	Callback = function(Keybind)
		if IsOnCarSpeed == true then
			CarSpeedToggle:Set(false)
			IsOnCarSpeed = false
		else
			CarSpeedToggle:Set(true)
			IsOnCarSpeed = true
		end
	end,
})
local InstantBrake = Tab4:CreateKeybind({
	Name = "Instant Brake",
	CurrentKeybind = "F",
	HoldToInteract = false,
	Flag = "Keybind1", 
	Callback = function(Keybind)
		if MyCarPath == nil then
			alert("Please detect Car first!", "Alert", "triangle-alert")
			return
		end
		task.spawn(function()
			local base = MyCarPath.Body.Base
			local passedtime = 0
			local c0 = MyCarPath.DriverSeat
			c0.Flip.D = 100000
			c0.Flip.P = 100000
			c0.Flip.MaxTorque = Vector3.new(100000, 1000, 100000)
			while base.AssemblyLinearVelocity.Magnitude > 1 do
				base.AssemblyLinearVelocity = Vector3.new(0,0,0)
				task.wait()
				passedtime = passedtime + 0.1
				if passedtime > 1 then
					c0.Flip.D = 0
					c0.Flip.P = 0
					c0.Flip.MaxTorque = Vector3.new(0, 0, 0)
					break
				end
			end
			c0.Flip.D = 0
			c0.Flip.P = 0
			c0.Flip.MaxTorque = Vector3.new(0, 0, 0)
		end)
	end,
})
local WalkSpeedKB = Tab4:CreateKeybind({
	Name = "Turn on/off WalkSpeed",
	CurrentKeybind = "C",
	HoldToInteract = false,
	Flag = "Keybind00", 
	Callback = function(Keybind)
		if IsOnPlayerSpeed == true then
			PlayerSpeedToggle:Set(false)
			IsOnPlayerSpeed = false
		else
			PlayerSpeedToggle:Set(true)
			IsOnPlayerSpeed = true
		end
	end,
})
if _G.RanERX then
	local Tab5 = MAINUI:CreateTab("ERX", "external-link")
	local Section = Tab5:CreateSection("Teleports")
	local PlayerTeleportERX = Tab5:CreateInput({
		Name = "Teleport to Player (can be shortened)",
		CurrentValue = "",
		PlaceholderText = "playerName",
		RemoveTextAfterFocusLost = false,
		Flag = "Input1",
		Callback = function(Text)
			SelectedPlayerToTeleportTo = Text:lower()
		end,
	})
	local PlayerTeleportBERX = Tab5:CreateButton({
		Name = "Teleport to Player",
		Callback = function()
			local ok, n = pcall(function()
				local Players = game:GetService("Players")
				local LocalPlayer = Players.LocalPlayer

				if not SelectedPlayerToTeleportTo or SelectedPlayerToTeleportTo == "" then
					alert("Please specify a Player!", "Alert", "triangle-alert")
					return
				end
				local targetText = SelectedPlayerToTeleportTo
				if LocalPlayer.Name:lower() == targetText then
					alert("Cannot TP to yourself!", "Alert", "triangle-alert")
					return
				end
				local found = nil
				for _, v in ipairs(Players:GetPlayers()) do
					if v ~= LocalPlayer then
						if v.Name:lower():find(targetText, 1, true) then
							found = v
							break
						end
					end
				end
				local char = found.Character
				local hrp = char and char:FindFirstChild("HumanoidRootPart")
				if not found then
					alert("Could not find other player!", "Alert", "triangle-alert")
					return
				end
				local cframeToTpTo = hrp.CFrame
				_G.Functions:TeleportTo((cframeToTpTo * CFrame.new(0,5,0)))
			end)
			if not ok then alert("Error,"..n, "Alert", "triangle-alert") end
		end,
	})
	local TeleportDropDownERX = Tab5:CreateDropdown({
		Name = "Teleport To:",
		Options = {"Gun store", "Spawn", "Safe Spot", "Snipe Spot", "Boat", "Water Tower","Courthouse Roof", "Crane", "Waterfall", "Police Station"},
		CurrentOption = "Gun store",
		MultipleOptions = false,
		Flag = "Dropdown1", 
		Callback = function(option)
			if type(option) == "table" then
				SelectedPlaceToTeleportTo = option[1]
			else
				SelectedPlaceToTeleportTo = option
			end
		end,
	})
	local PlaceTeleportERX = Tab5:CreateButton({
		Name = "Teleport to Place",
		Callback = function()
			local CFrameToTeleport = PlaceTeleportsERX[SelectedPlaceToTeleportTo]
			if CFrameToTeleport then
				_G.Functions:TeleportTo(CFrameToTeleport)
			end
		end,
	})
end
