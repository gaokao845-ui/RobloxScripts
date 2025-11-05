--// LocalScript ใน StarterGui

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "AutoXGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 220, 0, 120)
frame.Position = UDim2.new(0.4, 0, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 0, 30)
title.Position = UDim2.new(0, 10, 0, 5)
title.Text = "ระบบกด X อัตโนมัติ (รัวโคตร)"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSansBold
title.TextScaled = true
title.Parent = frame

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 25, 0, 25)
closeButton.Position = UDim2.new(1, -30, 0, 5)
closeButton.Text = "✖"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextScaled = true
closeButton.Parent = frame

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(1, -20, 0, 40)
toggleButton.Position = UDim2.new(0, 10, 0, 40)
toggleButton.Text = "เปิดระบบ"
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
toggleButton.TextColor3 = Color3.new(1,1,1)
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextScaled = true
toggleButton.Parent = frame

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -20, 0, 30)
statusLabel.Position = UDim2.new(0, 10, 0, 85)
statusLabel.Text = "สถานะ: ปิดอยู่"
statusLabel.TextColor3 = Color3.new(1,1,1)
statusLabel.BackgroundTransparency = 1
statusLabel.Font = Enum.Font.SourceSans
statusLabel.TextScaled = true
statusLabel.Parent = frame

-- ตัวแปรสถานะ
local running = false
local vim = game:GetService("VirtualInputManager")

-- ฟังก์ชันกดรัวสุด
task.spawn(function()
	while true do
		if running then
			for i = 1, 8 do -- ปรับจำนวนการกดซ้อน (8 ครั้งต่อเฟรม = เร็วมาก)
				vim:SendKeyEvent(true, Enum.KeyCode.X, false, game)
				vim:SendKeyEvent(false, Enum.KeyCode.X, false, game)
			end
		end
		task.wait() -- หน่วง 1 เฟรม
	end
end)

-- ปุ่มเปิด/ปิดระบบ
toggleButton.MouseButton1Click:Connect(function()
	running = not running
	if running then
		toggleButton.Text = "ปิดระบบ"
		toggleButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
		statusLabel.Text = "สถานะ: เปิดอยู่ (รัวสุดๆ)"
	else
		toggleButton.Text = "เปิดระบบ"
		toggleButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
		statusLabel.Text = "สถานะ: ปิดอยู่"
	end
end)

-- ปุ่มปิด GUI ถาวร
closeButton.MouseButton1Click:Connect(function()
	gui:Destroy()
end)
