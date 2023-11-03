-- ฟังก์ชันที่จะทำงานเมื่อผู้เล่นกดปุ่ม E
local function onPromptTriggered()
    local player = game.Players:GetPlayerFromCharacter(prompt.Parent)
    if player then
        local character = player.Character
        if character then
            -- สร้าง Seat เพื่อนั่ง
            local seat = Instance.new("Seat")
            seat.Parent = workspace
            seat.CFrame = CFrame.new(yourSeatPositionHere) -- ตำแหน่งที่คุณต้องการให้นั่ง
            character.Humanoid.Sit = true -- เปลี่ยนสถานะให้นั่ง
        end
    end
end

-- เชื่อม ProximityPrompt กับฟังก์ชันเมื่อกดปุ่ม E
prompt.Triggered:Connect(onPromptTriggered)
