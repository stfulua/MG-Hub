local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "StatsGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local fpsLabel = Instance.new("TextLabel")
fpsLabel.Size = UDim2.new(0, 200, 0, 50)
fpsLabel.Position = UDim2.new(0, 10, 0, 10)
fpsLabel.BackgroundTransparency = 0.5
fpsLabel.TextScaled = true
fpsLabel.TextColor3 = Color3.new(1, 1, 1)
fpsLabel.TextStrokeTransparency = 0.8
fpsLabel.Font = Enum.Font.SourceSansBold
fpsLabel.Parent = screenGui

local partsLabel = Instance.new("TextLabel")
partsLabel.Size = UDim2.new(0, 200, 0, 50)
partsLabel.Position = UDim2.new(0, 10, 0, 70)
partsLabel.BackgroundTransparency = 0.5
partsLabel.TextScaled = true
partsLabel.TextColor3 = Color3.new(1, 1, 1)
partsLabel.TextStrokeTransparency = 0.8
partsLabel.Font = Enum.Font.SourceSansBold
partsLabel.Parent = screenGui

local meshesLabel = Instance.new("TextLabel")
meshesLabel.Size = UDim2.new(0, 200, 0, 50)
meshesLabel.Position = UDim2.new(0, 10, 0, 130)
meshesLabel.BackgroundTransparency = 0.5
meshesLabel.TextScaled = true
meshesLabel.TextColor3 = Color3.new(1, 1, 1)
meshesLabel.TextStrokeTransparency = 0.8
meshesLabel.Font = Enum.Font.SourceSansBold
meshesLabel.Parent = screenGui

local modelsLabel = Instance.new("TextLabel")
modelsLabel.Size = UDim2.new(0, 200, 0, 50)
modelsLabel.Position = UDim2.new(0, 10, 0, 190)
modelsLabel.BackgroundTransparency = 0.5
modelsLabel.TextScaled = true
modelsLabel.TextColor3 = Color3.new(1, 1, 1)
modelsLabel.TextStrokeTransparency = 0.8
modelsLabel.Font = Enum.Font.SourceSansBold
modelsLabel.Parent = screenGui

local serverLabel = Instance.new("TextLabel")
serverLabel.Size = UDim2.new(0, 200, 0, 50)
serverLabel.Position = UDim2.new(0, 10, 0, 250)
serverLabel.BackgroundTransparency = 0.5
serverLabel.TextScaled = true
serverLabel.TextColor3 = Color3.new(1, 1, 1)
serverLabel.TextStrokeTransparency = 0.8
serverLabel.Font = Enum.Font.SourceSansBold
serverLabel.Parent = screenGui
serverLabel.Text = "User Performance Stats!"

local checkLagButton = Instance.new("TextButton")
checkLagButton.Size = UDim2.new(0, 200, 0, 50)
checkLagButton.Position = UDim2.new(0, 10, 0, 310)
checkLagButton.Text = "Check Lag Problems"
checkLagButton.TextScaled = true
checkLagButton.BackgroundTransparency = 0.5
checkLagButton.TextColor3 = Color3.new(1, 1, 1)
checkLagButton.Font = Enum.Font.SourceSansBold
checkLagButton.Parent = screenGui

local lagGui = Instance.new("ScreenGui")
lagGui.Name = "LagGui"
lagGui.ResetOnSpawn = false
lagGui.Parent = player:WaitForChild("PlayerGui")
lagGui.Enabled = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.8, 0, 0.8, 0)
frame.Position = UDim2.new(0.1, 0, 0.1, 0)
frame.BackgroundTransparency = 0.3
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.Parent = lagGui

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 100, 0, 50)
closeButton.Position = UDim2.new(1, -110, 0, 10)
closeButton.Text = "Close"
closeButton.TextScaled = true
closeButton.BackgroundTransparency = 0.5
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Font = Enum.Font.SourceSansBold
closeButton.Parent = frame

local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, -20, 1, -70)
scrollingFrame.Position = UDim2.new(0, 10, 0, 60)
scrollingFrame.BackgroundTransparency = 0.5
scrollingFrame.ScrollBarThickness = 10
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.Parent = frame

local function countWorkspaceItems()
	local partCount = 0
	local meshCount = 0
	local modelCount = 0
	for _, obj in ipairs(workspace:GetDescendants()) do
		if obj:IsA("Part") then
			partCount = partCount + 1
		elseif obj:IsA("MeshPart") or obj:IsA("SpecialMesh") then
			meshCount = meshCount + 1
		elseif obj:IsA("Model") then
			modelCount = modelCount + 1
		end
	end
	return partCount, meshCount, modelCount
end

local function analyzeWorkspace()
	local items = {}
	for _, obj in ipairs(workspace:GetDescendants()) do
		if obj:IsA("Model") then
			local descendants = #obj:GetDescendants()
			table.insert(items, {Name = obj:GetFullName(), Count = descendants})
		end
	end
	table.sort(items, function(a, b) return a.Count > b.Count end)
	scrollingFrame:ClearAllChildren()
	local totalHeight = 0
	for i, item in ipairs(items) do
		local textLabel = Instance.new("TextLabel")
		textLabel.Size = UDim2.new(1, -20, 0, 30)
		textLabel.Position = UDim2.new(0, 10, 0, (i-1) * 35)
		textLabel.Text = item.Name .. " - " .. item.Count .. " items"
		textLabel.TextScaled = true
		textLabel.BackgroundTransparency = 0.5
		textLabel.TextColor3 = Color3.new(1, 1, 1)
		textLabel.Font = Enum.Font.SourceSans
		textLabel.Parent = scrollingFrame
		totalHeight = totalHeight + 35
	end
	scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, totalHeight)
end

checkLagButton.MouseButton1Click:Connect(function()
	lagGui.Enabled = not lagGui.Enabled
	if lagGui.Enabled then
		analyzeWorkspace()
	end
end)

closeButton.MouseButton1Click:Connect(function()
	lagGui.Enabled = false
end)

local frames = 0
local elapsedTime = 0
local minuteFrameCount = 0
local elapsedMinutes = 0

RunService.RenderStepped:Connect(function(deltaTime)
	frames = frames + 1
	minuteFrameCount = minuteFrameCount + 1
	elapsedTime = elapsedTime + deltaTime
	elapsedMinutes = elapsedMinutes + deltaTime / 60
	if elapsedTime >= 1 then
		if frames > 5 then
			fpsLabel.Text = "FPS: " .. frames
		else
			local fpm = math.floor(minuteFrameCount / elapsedMinutes)
			fpsLabel.Text = "FPM: " .. fpm
		end
		local partCount, meshCount, modelCount = countWorkspaceItems()
		partsLabel.Text = "Parts: " .. partCount
		meshesLabel.Text = "Meshes: " .. meshCount
		modelsLabel.Text = "Models: " .. modelCount
		frames = 0
		elapsedTime = 0
	end
end)
