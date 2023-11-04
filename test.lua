local TweenService = game:GetService("TweenService")
local part = script.Parent  -- เปลี่ยนเป็นส่วนที่คุณต้องการเคลื่อนที่

-- ตั้งค่าเริ่มต้นและสิ้นสุดของการเคลื่อนที่
local startPos = part.Position
local endPos = Vector3.new(part.Position.X + 10, part.Position.Y, part.Position.Z) -- เปลี่ยนตามต้องการ

-- ตั้งค่า TweenInfo
local tweenInfo = TweenInfo.new(
    1,            -- ระยะเวลาของการเคลื่อนที่ (วินาที)
    Enum.EasingStyle.Linear, -- สไตล์ของการเคลื่อนที่ (Linear ให้เคลื่อนที่แบบเส้นตรง)
    Enum.EasingDirection.Out, -- ทิศทางของการเคลื่อนที่ (Out ให้กลับไปที่จุดเริ่มต้น)
    -1,           -- จำนวนครั้งที่ทำซ้ำ (-1 ให้ทำซ้ำไปเรื่อยๆ)
    false,        -- หมุนเชิงกลับหรือไม่
    0              -- ช่องว่างก่อนเริ่มทำซ้ำ (วินาที)
)

-- สร้าง Tween
local tween = TweenService:Create(part, tweenInfo, {Position = endPos})

-- ตัวอัพเดทเมื่อ Tween จบการเคลื่อนที่
tween.Completed:Connect(function()
    -- สลับตำแหน่งเริ่มต้นและสิ้นสุดเพื่อทำการเคลื่อนที่กลับ
    startPos, endPos = endPos, startPos
    -- สร้าง Tween ใหม่
    tween:Play()
end)

-- เริ่มการเคลื่อนที่แรก
tween:Play()
