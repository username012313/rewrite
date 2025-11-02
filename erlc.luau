local RAYFIELD = loadstring(game:HttpGet("https://raw.githubusercontent.com/username012313/Simplifying-roblox-script/refs/heads/main/rayfield-cleaned"))()
local Player = game:GetService("Players").LocalPlayer
local VehicleFolder = workspace.Vehicles
local desiredLength = 0
local MyCarPath = nil
local Carspeed = 100
local IsOnCarFly = false
local IsOnCarSpeed = false
local PrivateServerLabel
local function alert(msg, s, icon)
    RAYFIELD:Notify({
        Title = s,
        Content = msg,
        Duration = 3.5,
        Image = icon,
    })
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
                end)
            else
                MyCarPath = p.Parent
            end
        else
            for _, vehicle in ipairs(VehicleFolder:GetChildren()) do
                local controlValues = vehicle:FindFirstChild("Control_Values")
                local owner = controlValues and controlValues:FindFirstChild("Owner")
                local ok, err = pcall(function()
                    if owner and owner:IsA("StringValue") and owner.Value == Player.Name then
                        MyCarPath = vehicle
                    end
                end)
                if not ok then 
                    alert("Could not find car! Maybe car is not yet spawned.", "Alert!", "alert")
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
        DisableRayfieldPrompts = false,
    DisableBuildWarnings = false, 
        ConfigurationSaving = {
        Enabled = false,
        FolderName = nil, 
        FileName = "Big Hub"
    },
        Discord = {
        Enabled = false, 
        Invite = "noinvitelink", 
        RememberJoins = true 
    },
        KeySystem = false, 
    KeySettings = {
        Title = "",
        Subtitle = "",
        Note = "", 
        FileName = "1", 
        SaveKey = true, 
        GrabKeyFromSite = false, 
        Key = {""} 
    }
})
local Tab = MAINUI:CreateTab("Main", "atom")
if game:GetService("Players").LocalPlayer.PlayerGui.GameGui.MainHUD.Options.PrivateServer.Visible == true then
    PrivateServerLabel = Tab:CreateLabel("You are in a private server.", "info", Color3.fromRGB(255, 255, 255), false)
end
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
local Tab2 = MAINUI:CreateTab("Second Tab", "atom")
local desiredHeight = Tab2:CreateSlider({
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
local rearSet = Tab2:CreateButton({
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
local frontSet = Tab2:CreateButton({
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


local Tab3 = MAINUI:CreateTab("Better Stuff!!", "external-link")
local CarspeedSlider = Tab3:CreateSlider({
    Name = "Car speed",
    Range = {0, 100},
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
        if running then
            local seat = MyCarPath.DriverSeat
            local base = MyCarPath.Body.Base
            task.spawn(function()
                while running do
                    seat.AssemblyLinearVelocity = seat.CFrame.LookVector * Carspeed
                    task.wait()
                end
            end)
        end
    end,
})
local CarFlySpeed = Tab3:CreateSlider({
    Name = "Car Fly speed",
    Range = {0, 100},
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
            IsOnCarFly = not IsOnCarFly
            task.spawn(function()
                while running do
                    if c3 < 2 then
                        MyCarPath.PrimaryPart.Anchored = true
                    else
                        pcall(function()
                            local c0 = MyCarPath.DriverSeat
                            local c1 = MyCarPath.PrimaryPart
                            local c2 = workspace.CurrentCamera.CFrame.LookVector
                            c1.AssemblyLinearVelocity = c2 * c3 + Vector3.new(0, 2, 0)
                            c0.Flip.D = 100000
                            c0.Flip.P = 100000
                            c0.Flip.MaxTorque = Vector3.new(100000, 1000, 100000)
                            c0.Flip.CFrame = CFrame.new(c0.Position, c0.Position + c2)
                        end)
                        task.wait()
                    end
                end
            end)
        else
            local c0 = MyCarPath.DriverSeat
            c0.Flip.D = 0
            c0.Flip.P = 0
            c0.Flip.MaxTorque = Vector3.new(0, 0, 0)
            c0.Flip.CFrame = CFrame.new(0,0,0)
        end
    end,
})
local Tab4 = MAINUI:CreateTab("Ease of use", "external-link")
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
local CarFlyKB = Tab4:CreateKeybind({
    Name = "Turn on/off car fly ",
    CurrentKeybind = "G",
    HoldToInteract = false,
    Flag = "Keybind3",
    Callback = function(Keybind)
        if IsOncarFly == true then
            CarFlyToggle:Set(false)
            IsOncarFly = false
        else
            CarFlyToggle:Set(true)
            IsOncarFly = true
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
            while base.AssemblyLinearVelocity.Magnitude > 1 do
                base.AssemblyLinearVelocity = Vector3.new(0,0,0)
                task.wait()
            end
        end)
    end,
})
local EjectAllPlayers = Tab4:CreateButton({
    Name = "Eject all players in your car",
    Callback = function(Keybind)
        if MyCarPath == nil then
            alert("Please detect Car first!", "Alert", "triangle-alert")
            return
        end
        task.spawn(function()
            pcall(function ()
                local seat1 = MyCarPath.PassengerSeatFR
                if MyCarPath.PassengerSeatRL then
                    local seat2 = MyCarPath.PassengerSeatRL
                end
                if MyCarPath.PassengerSeatRR then
                    local seat3 = MyCarPath.PassengerSeatRR
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
