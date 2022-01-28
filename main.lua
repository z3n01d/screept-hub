local ScreeptHub = Instance.new("ScreenGui")
local Hub = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local HubName = Instance.new("TextLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIGridLayout = Instance.new("UIGridLayout")

function addButton(text : string,name : string,code : string,parent : Instance)
	if not text or not name or not code or not parent then return end
	local Button = Instance.new("TextButton")
	local UICorner = Instance.new("UICorner")

	Button.Name = name
	Button.Text = text
	Button.Parent = parent
	Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Button.Size = UDim2.new(0, 200, 0, 50)
	Button.Font = Enum.Font.RobotoMono
	Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	Button.TextScaled = true
	Button.TextSize = 14.000
	Button.TextStrokeTransparency = 0.000
	Button.TextWrapped = true
	
	pcall(function()
		local localScript = Instance.new("LocalScript")
		localScript.Name = "MainScript"
		localScript.Source = [[
		script.Parent.Activated:Connect(function()]] 
			.. code .. [[
		end)]]
		localScript.Parent = Button
	end)

	UICorner.CornerRadius = UDim.new(0, 32)
	UICorner.Parent = Button

	return Button
end

ScreeptHub.Name = "ScreeptHub"

repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")

ScreeptHub.Parent = game.Players.LocalPlayer:FindFirstChild("PlayerGui")
ScreeptHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Hub.Name = "Hub"
Hub.Parent = ScreeptHub
Hub.Active = true
Hub.Draggable = true
Hub.AnchorPoint = Vector2.new(0.5, 0.5)
Hub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Hub.Position = UDim2.new(0.49999997, 0, 0.498444825, 0)
Hub.Size = UDim2.new(0, 600, 0, 350)

UICorner.CornerRadius = UDim.new(0, 32)
UICorner.Parent = Hub

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(16, 16, 16)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(50, 50, 50))}
UIGradient.Rotation = 45
UIGradient.Parent = Hub

HubName.Name = "HubName"
HubName.AnchorPoint = Vector2.new(0.5,0)
HubName.Parent = Hub
HubName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HubName.BackgroundTransparency = 1.000
HubName.Size = UDim2.new(0, 300, 0, 50)
HubName.Font = Enum.Font.RobotoCondensed
HubName.Text = "Screept hub"
HubName.TextColor3 = Color3.fromRGB(255, 255, 255)
HubName.TextScaled = true
HubName.TextSize = 14.000
HubName.TextStrokeTransparency = 0.000
HubName.TextWrapped = true
HubName.Position = UDim2.new(0.5,0,0,0)

ScrollingFrame.Parent = Hub
ScrollingFrame.Active = true
ScrollingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame.BackgroundTransparency = 1.000
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0.5, 0, 0.571428478, 0)
ScrollingFrame.Size = UDim2.new(1, 0, 0.214285627, 225)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 5, 0)
ScrollingFrame.ScrollBarThickness = 10

UIGridLayout.Parent = ScrollingFrame
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellSize = UDim2.new(0, 150, 0, 50)

--Add buttons

addButton("c00lgui", "coolgui", [[
loadstring(game:GetObjects("rbxassetid://8127297852")[1].Source)()
]], ScrollingFrame)

addButton("The Rake", "rake", [[
loadstring(game:HttpGet("http://gameovers.net/Scripts/Free/The%20Rake/TheRake.lua", true))()
]], ScrollingFrame)

addButton("Hamster ball", "hamsterball", [[
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

local SPEED_MULTIPLIER = 30
local JUMP_POWER = 60
local JUMP_GAP = 0.3

local character = game.Players.LocalPlayer.Character

for i,v in ipairs(character:GetDescendants()) do
   if v:IsA("BasePart") then
       v.CanCollide = false
   end
end

local ball = character.HumanoidRootPart
ball.Shape = Enum.PartType.Ball
ball.Size = Vector3.new(5,5,5)
local humanoid = character:WaitForChild("Humanoid")
local params = RaycastParams.new()
params.FilterType = Enum.RaycastFilterType.Blacklist
params.FilterDescendantsInstances = {character}

local tc = RunService.RenderStepped:Connect(function(delta)
   ball.CanCollide = true
   humanoid.PlatformStand = true
if UserInputService:GetFocusedTextBox() then return end
if UserInputService:IsKeyDown("W") then
ball.RotVelocity -= Camera.CFrame.RightVector * delta * SPEED_MULTIPLIER
end
if UserInputService:IsKeyDown("A") then
ball.RotVelocity -= Camera.CFrame.LookVector * delta * SPEED_MULTIPLIER
end
if UserInputService:IsKeyDown("S") then
ball.RotVelocity += Camera.CFrame.RightVector * delta * SPEED_MULTIPLIER
end
if UserInputService:IsKeyDown("D") then
ball.RotVelocity += Camera.CFrame.LookVector * delta * SPEED_MULTIPLIER
end
--ball.RotVelocity = ball.RotVelocity - Vector3.new(0,ball.RotVelocity.Y/50,0)
end)

UserInputService.JumpRequest:Connect(function()
local result = workspace:Raycast(
ball.Position,
Vector3.new(
0,
-((ball.Size.Y/2)+JUMP_GAP),
0
),
params
)
if result then
ball.Velocity = ball.Velocity + Vector3.new(0,JUMP_POWER,0)
end
end)

Camera.CameraSubject = ball
humanoid.Died:Connect(function() tc:Disconnect() end)
]], ScrollingFrame)

addButton("Flip (Z,X,C)", "flip", [[
wait(5)

	local ver = "2.00"
	local scriptname = "feFlip"

	local FrontflipKey = Enum.KeyCode.Z
	local BackflipKey = Enum.KeyCode.X
	local AirjumpKey = Enum.KeyCode.C

	local ca = game:GetService("ContextActionService")
	local zeezy = game:GetService("Players").LocalPlayer
	local h = 0.0174533
	local antigrav

	function zeezyFrontflip(act,inp,obj)
		if inp == Enum.UserInputState.Begin then
			zeezy.Character.Humanoid:ChangeState("Jumping")
			wait()
			zeezy.Character.Humanoid.Sit = true
			for i = 1,360 do 
				delay(i/720,function()
					zeezy.Character.Humanoid.Sit = true
					zeezy.Character.HumanoidRootPart.CFrame = zeezy.Character.HumanoidRootPart.CFrame * CFrame.Angles(-h,0,0)
				end)
			end
			wait(0.55)
			zeezy.Character.Humanoid.Sit = false
		end
	end

	function zeezyBackflip(act,inp,obj)
		if inp == Enum.UserInputState.Begin then
			zeezy.Character.Humanoid:ChangeState("Jumping")
			wait()
			zeezy.Character.Humanoid.Sit = true
			for i = 1,360 do
				delay(i/720,function()
					zeezy.Character.Humanoid.Sit = true
					zeezy.Character.HumanoidRootPart.CFrame = zeezy.Character.HumanoidRootPart.CFrame * CFrame.Angles(h,0,0)
				end)
			end
			wait(0.55)
			zeezy.Character.Humanoid.Sit = false
		end
	end

	function zeezyAirjump(act,inp,obj)
		if inp == Enum.UserInputState.Begin then
			zeezy.Character:FindFirstChildOfClass'Humanoid':ChangeState("Seated")
			wait()
			zeezy.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")	
		end
	end

	ca:BindAction("zeezyFrontflip",zeezyFrontflip,false,FrontflipKey)
	ca:BindAction("zeezyBackflip",zeezyBackflip,false,BackflipKey)
	ca:BindAction("zeezyAirjump",zeezyAirjump,false,AirjumpKey)

	print(scriptname .. " " .. ver .. " loaded successfully")
	print("made by Zeezy#7203")

	local notifSound = Instance.new("Sound",workspace)
	notifSound.PlaybackSpeed = 1.5
	notifSound.Volume = 0.15
	notifSound.SoundId = "rbxassetid://170765130"
	notifSound.PlayOnRemove = true
	notifSound:Destroy()
	game.StarterGui:SetCore("SendNotification", {Title = "feFlip", Text = "feFlip loaded successfully!", Icon = "rbxassetid://505845268", Duration = 5, Button1 = "Okay"})
]], ScrollingFrame)

game.StarterGui:SetCore("SendNotification",{
	title = "screept hub",
	text = "screept hub has been sucessfully loaded"
})
