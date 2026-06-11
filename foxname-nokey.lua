-- Tạo ScreenGui để chứa Menu Key tùy chỉnh tránh bị lỗi cắt chữ của thư viện
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CopyButton = Instance.new("TextButton")
local KeyInput = Instance.new("TextBox")
local SubmitButton = Instance.new("TextButton")
local NoteText = Instance.new("TextLabel")

-- Cấu hình hiển thị ScreenGui
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "FoxNameKeySystem"
ScreenGui.ResetOnSpawn = false

-- 1. Khung nền chính: Màu Tím đen huyền bí (#120E1E)
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromHex("#120E1E")
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -175)
MainFrame.Size = UDim2.new(0, 400, 0, 350)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true -- Cho phép người chơi di chuyển bảng trên màn hình

-- Bo góc khung nền
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = MainFrame

-- 2. Tiêu đề: Fox Name - Build a ring farm (Màu đỏ nhẹ sắc nét)
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 0, 0, 15)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Font = Enum.Font.GothamBold
Title.Text = "Fox Name - Build a ring farm"
Title.TextColor3 = Color3.fromHex("#FF4D4D") -- Đỏ nhẹ rõ nét
Title.TextSize = 20

-- 3. NÚT ẤN SAO CHÉP LINK GET KEY
CopyButton.Name = "CopyButton"
CopyButton.Parent = MainFrame
CopyButton.BackgroundColor3 = Color3.fromHex("#FF4D4D") -- Nút copy màu đỏ nhẹ đồng bộ
CopyButton.Position = UDim2.new(0.1, 0, 0, 65)
CopyButton.Size = UDim2.new(0.8, 0, 0, 35)
CopyButton.Font = Enum.Font.GothamBold
CopyButton.Text = "SAO CHÉP LINK GET KEY"
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.TextSize = 14

local CornerCopy = Instance.new("UICorner")
CornerCopy.CornerRadius = UDim.new(0, 8)
CornerCopy.Parent = CopyButton

-- 4. Ô nhập Key: Màu Tím sáng hơn một chút (#1D182E)
KeyInput.Name = "KeyInput"
KeyInput.Parent = MainFrame
KeyInput.BackgroundColor3 = Color3.fromHex("#1D182E")
KeyInput.Position = UDim2.new(0.1, 0, 0, 115)
KeyInput.Size = UDim2.new(0.8, 0, 0, 40)
KeyInput.Font = Enum.Font.Gotham
KeyInput.PlaceholderText = "Dán hoặc Nhập Key tại đây..."
KeyInput.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextSize = 14

local CornerInput = Instance.new("UICorner")
CornerInput.CornerRadius = UDim.new(0, 8)
CornerInput.Parent = KeyInput

-- 5. Nút bấm "GET KEY": Màu xanh lục Matrix / Neon tiền đô (#00FF66) kích thích thị giác
SubmitButton.Name = "SubmitButton"
SubmitButton.Parent = MainFrame
SubmitButton.BackgroundColor3 = Color3.fromHex("#00FF66")
SubmitButton.Position = UDim2.new(0.1, 0, 0, 170)
SubmitButton.Size = UDim2.new(0.8, 0, 0, 45)
SubmitButton.Font = Enum.Font.GothamBold
SubmitButton.Text = "GET KEY"
SubmitButton.TextColor3 = Color3.fromHex("#120E1E") -- Chữ màu tối nổi bật trên nền xanh neon
SubmitButton.TextSize = 16

local CornerSubmit = Instance.new("UICorner")
CornerSubmit.CornerRadius = UDim.new(0, 8)
CornerSubmit.Parent = SubmitButton

-- 6. Khối văn bản NOTE đầy đủ nội dung chữ nhỏ màu vàng pha đỏ nhẹ
NoteText.Name = "NoteText"
NoteText.Parent = MainFrame
NoteText.BackgroundTransparency = 1
NoteText.Position = UDim2.new(0.05, 0, 0, 230)
NoteText.Size = UDim2.new(0.9, 0, 0, 100)
NoteText.Font = Enum.Font.Gotham
-- Nội dung chuẩn xác 100% không bị cắt chữ
NoteText.Text = "Việc lấy ( Key ) giúp mình có thêm chút chi phí để duy trì và cập nhật script mỗi ngày. Chỉ mất 1-2 phút mong bạn đừng tức giận và tiếp tục ủng hộ mình nhé! Chúc các bạn chơi game vui vẻ!"
NoteText.TextColor3 = Color3.fromHex("#FFCC00") -- Màu vàng pha chút đỏ nhẹ tinh tế
NoteText.TextSize = 12
NoteText.TextWrapped = true -- Tự động xuống dòng khi hết hàng
NoteText.TextYAlignment = Enum.TextYAlignment.Top

-- HÀM TẠO THÔNG BÁO NỔI TRÊN MÀN HÌNH (TOAST NOTIFICATION) CHỮ ĐỎ NHẸ
local function showToast(message)
    local ToastFrame = Instance.new("Frame")
    local ToastText = Instance.new("TextLabel")
    
    ToastFrame.Parent = ScreenGui
    ToastFrame.BackgroundColor3 = Color3.fromHex("#120E1E") -- Nền tím đen huyền bí
    ToastFrame.Size = UDim2.new(0, 280, 0, 45)
    ToastFrame.Position = UDim2.new(0.5, -140, 0, -60) -- Xuất phát ở ngoài màn hình phía trên
    ToastFrame.BorderSizePixel = 0
    
    local ToastCorner = Instance.new("UICorner")
    ToastCorner.CornerRadius = UDim.new(0, 8)
    ToastCorner.Parent = ToastFrame
    
    -- Viền đỏ nhẹ cho thông báo sắc nét
    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color3.fromHex("#FF4D4D")
    Stroke.Thickness = 1.5
    Stroke.Parent = ToastFrame

    ToastText.Parent = ToastFrame
    ToastText.BackgroundTransparency = 1
    ToastText.Size = UDim2.new(1, 0, 1, 0)
    ToastText.Font = Enum.Font.GothamBold
    ToastText.Text = message
    ToastText.TextColor3 = Color3.fromHex("#FF4D4D") -- Chữ hiện trên màn hình màu đỏ nhẹ rõ nét
    ToastText.TextSize = 13
    
    -- Hiệu ứng trượt xuống mượt mà
    ToastFrame:TweenPosition(UDim2.new(0.5, -140, 0, 30), "Out", "Quad", 0.4, true)
    
    -- Tự biến mất sau 3 giây
    task.wait(3)
    ToastFrame:TweenPosition(UDim2.new(0.5, -140, 0, -60), "In", "Quad", 0.4, true)
    task.wait(0.4)
    ToastFrame:Destroy()
end

-- XỬ LÝ SỰ KIỆN KHI BẤM NÚT SAO CHÉP LINK
CopyButton.MouseButton1Click:Connect(function()
    setclipboard("https://link4m.org/HKGGs2Xy")
    -- Hiện chữ đỏ nhẹ trên màn hình yêu cầu người chơi dán lên trình duyệt để getkey
    task.spawn(function()
        showToast("Dán lên trình duyệt để getkey")
    end)
end)

-- XỬ LÝ SỰ KIỆN KIỂM TRA KEY
SubmitButton.MouseButton1Click:Connect(function()
    local enteredKey = KeyInput.Text
    local correctKey = "BUILDARINGFARM-KEY1689932390921140085"
    
    if enteredKey == correctKey then
        task.spawn(function()
            showToast("Key chính xác! Đang tải Script...")
        end)
        task.wait(1.5)
        ScreenGui:Destroy() -- Xóa bảng nhập Key đi
        
        -- KHỞI ĐỘNG SCRIPT TỔNG HỢP SAU KHI ĐÚNG KEY
        loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/Fn_BARF.lua"))()
    else
        task.spawn(function()
            showToast("Sai Key rồi! Vui lòng kiểm tra lại.")
        end)
    end
end)
