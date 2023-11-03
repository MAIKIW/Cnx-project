local function onPromptTriggered(prompt)
    local player = game.Players:GetPlayerFromCharacter(prompt.Parent)
    if player then
        local character = player.Character
        if character and not character:FindFirstChild("Seat") then
            -- สร้าง Seat เพื่อนั่ง
            local seat = Instance.new("Seat")
            seat.Parent = workspace
            seat.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0, -2, 0) -- ปรับตำแหน่งของ Seat
            character:MoveTo(seat.Position)
            character.Humanoid.Sit = true -- เปลี่ยนสถานะให้นั่ง
        end
    end
end

-- สร้าง ProximityPrompt
local proximityPrompt = Instance.new("ProximityPrompt")
proximityPrompt.ActionText = "Press E to Sit"
proximityPrompt.ObjectText = "Seat"
proximityPrompt.Parent = workspace -- นำ ProximityPrompt มาใส่ใน workspace หรือเป็นส่วนหนึ่งของตัวละคร

proximityPrompt.Triggered:Connect(onPromptTriggered)
