--[[ 
    COLA HUB - MATRIX NEON EDITION (MÃ HÓA BẢO MẬT)
    LINK GET KEY: https://link4m.net/fzWlNR2f
]]

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local Title = Instance.new("TextLabel")
local KeyInput = Instance.new("TextBox")
local CopyBtn = Instance.new("TextButton")
local SubmitBtn = Instance.new("TextButton")
local NoteLabel = Instance.new("TextLabel")

-- Cấu hình ScreenGui
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "ColaHub_Encrypted_UI"
ScreenGui.ResetOnSpawn = false

-- Giải mã động Key và Script (Ngăn chặn đọc trộm mã nguồn)
local function _decode(b)
    local s = {}
    for i = 1, #b do s[i] = string.char(b[i]) end
    return table.concat(s)
end

-- Dữ liệu đã mã hóa thành chuỗi Byte ngẫu nhiên
local _kData = {71,114,111,119,97,103,97,114,100,101,110,50,45,107,101,121,99,111,108,97,104,117,98,55,48,49,51,56,53,50,57,50,49,52}
local _sData = {104,116,116,112,115,58,47,47,97,112,105,46,108,117,97,114,109,111,114,46,110,101,116,47,102,105,108,101,115,47,118,52,47,108,111,97,100,101,114,115,47,97,49,54,51,101,50,50,49,101,100,49,56,52,56,98,98,56,56,102,50,102,101,52,48,57,56,100,97,54,99,56,50,46,108,117,97}

-- Hàm tạo THÔNG BÁO CHỮ ĐỎ NHẸ khi sao chép
local function NotifyRed(text)
    local NotifyGui = Instance.new("ScreenGui")
    NotifyGui.Parent = game.CoreGui
    
    local Label = Instance.new("TextLabel")
    Label.Parent = NotifyGui
    Label.Size = UDim2.new(0, 500, 0, 50)
    Label.Position = UDim2.new(0.5, -250, 0.22, 0)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = Color3.fromRGB(255, 115, 115) 
    Label.Text = text
    Label.Font = Enum.Font.GothamBold
    Label.TextSize = 25
    Label.TextStrokeTransparency = 0.4
    Label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    
    task.spawn(function()
        task.wait(3.5)
        for i = 0, 1, 0.1 do
            Label.TextTransparency = i
            Label.TextStrokeTransparency = 0.4 + (i * 0.6)
            task.wait(0.05)
        end
        NotifyGui:Destroy()
    end)
end

-- Khung Menu Chính (#120E1E)
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 14, 30)
MainFrame.Position = UDim2.new(0.5, -170, 0.5, -150)
MainFrame.Size = UDim2.new(0, 340, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

UIStroke.Parent = MainFrame
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(0, 255, 102)
UIStroke.Transparency = 0.4

-- Tiêu đề Cola Hub
Title.Parent = MainFrame
Title.Text = "COLA HUB"
Title.Font = Enum.Font.GothamBlack
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 22
Title.Size = UDim2.new(1, 0, 0, 55)
Title.BackgroundTransparency = 1

-- Ô nhập Key (#1D182E)
KeyInput.Parent = MainFrame
KeyInput.PlaceholderText = "Nhập mã Key tại đây..."
KeyInput.Text = ""
KeyInput.BackgroundColor3 = Color3.fromRGB(29, 24, 46)
KeyInput.Position = UDim2.new(0.1, 0, 0.22, 0)
KeyInput.Size = UDim2.new(0.8, 0, 0, 38)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.GothamSemibold
KeyInput.TextSize = 13
Instance.new("UICorner", KeyInput).CornerRadius = UDim.new(0, 8)

-- Nút GET KEY (#00FF66)
CopyBtn.Parent = MainFrame
CopyBtn.Text = "SAO CHÉP LINK GET KEY"
CopyBtn.Font = Enum.Font.GothamBold
CopyBtn.TextSize = 13
CopyBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 102)
CopyBtn.TextColor3 = Color3.fromRGB(18, 14, 30)
CopyBtn.Position = UDim2.new(0.1, 0, 0.40, 5)
CopyBtn.Size = UDim2.new(0.8, 0, 0, 32)
Instance.new("UICorner", CopyBtn).CornerRadius = UDim.new(0, 6)

-- Nút Xác nhận
SubmitBtn.Parent = MainFrame
SubmitBtn.Text = "XÁC NHẬN KEY"
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.TextSize = 14
SubmitBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.TextColor3 = Color3.fromRGB(18, 14, 30)
SubmitBtn.Position = UDim2.new(0.1, 0, 0.56, 8)
SubmitBtn.Size = UDim2.new(0.8, 0, 0, 40)
Instance.new("UICorner", SubmitBtn).CornerRadius = UDim.new(0, 10)

-- Note (Màu vàng đỏ nhẹ)
NoteLabel.Parent = MainFrame
NoteLabel.Text = "Việc lấy ( Key )giúp mình có thêm chút chi phí để duy trì và cập nhật script mỗi ngày. Chỉ mất 1-2 phút mong bạn đừng tức giận và tiếp tục ủng hộ mình nhé! Chúc các bạn chơi game vui vẻ!"
NoteLabel.Font = Enum.Font.GothamMedium
NoteLabel.TextColor3 = Color3.fromRGB(235, 150, 75)
NoteLabel.TextSize = 11
NoteLabel.Size = UDim2.new(0.9, 0, 0, 65)
NoteLabel.Position = UDim2.new(0.05, 0, 0.75, 5)
NoteLabel.BackgroundTransparency = 1
NoteLabel.TextWrapped = true

--- XỬ LÝ HỆ THỐNG ---

CopyBtn.MouseButton1Click:Connect(function()
    setclipboard("https://link4m.net/fzWlNR2f")
    CopyBtn.Text = "ĐÃ SAO CHÉP LINK!"
    NotifyRed("Dán lên trình duyệt để getkey")
    task.wait(2)
    CopyBtn.Text = "SAO CHÉP LINK GET KEY"
end)

SubmitBtn.MouseButton1Click:Connect(function()
    -- Hệ thống tự giải mã so sánh động mà không lưu text gốc trong code
    if KeyInput.Text == _decode(_kData) then
        SubmitBtn.Text = "XÁC MINH THÀNH CÔNG!"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
        SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        task.wait(1)
        ScreenGui:Destroy()
        -- Thực thi script đã mã hóa an toàn
        loadstring(game:HttpGet(_decode(_sData)))()
    else
        SubmitBtn.Text = "SAI KEY! KIỂM TRA LẠI"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(235, 75, 75)
        SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        task.wait(2)
        SubmitBtn.Text = "XÁC NHẬN KEY"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SubmitBtn.TextColor3 = Color3.fromRGB(18, 14, 30)
    end
end)
