function onKeyPress(input)
    if input.KeyCode == Enum.KeyCode.E then
        if not character:FindFirstChild("Seat") then
            -- สร้าง Seat เพื่อนั่ง
            local seat = Instance.new("Seat")
            seat.Parent = workspace
            seat.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0, -2, 0) -- ปรับตำแหน่งของ Seat
            character:MoveTo(seat.Position)
            character.Humanoid.Sit = true -- เปลี่ยนสถานะให้นั่ง
        else
            -- ลบ Seat เมื่อต้องการยืนขึ้น
            character:MoveTo(character.HumanoidRootPart.Position + Vector3.new(0, 2, 0)) -- ปรับตำแหน่งของตัวละคร
            character.Humanoid.Sit = false -- เปลี่ยนสถานะให้ยืน
            character.Seat:Destroy()
        end
    end
end

-- เมื่อผู้เล่นกดปุ่ม
UserInputService.InputBegan:Connect(onKeyPress)
