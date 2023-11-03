local Players = game:GetService("Players")
local startingMoney = 0 --กำหนดจำนวนเงินเริ่มต้น

Players.PlayerAdded:Connect(function(player)
	-- ตั้งleaderstat
	if not player:FindFirstChild("leaderstats") then
		local leaderstats = Instance.new("Folder")
		leaderstats.Name = "leaderstats"
		leaderstats.Parent = player
	end
	
	--ตัง
	if not player.leaderstats:FindFirstChild("Ticket") then
		local money = Instance.new("IntValue")
		money.Name = "Ticket"
		money.Value = startingMoney
		money.Parent = player.leaderstats
	end
end)


--[[
local item = game.Workspace.Part

item.Touched:Connect(function(hit)
	local character = hit.Parent
	local humanoid = character:FindFirstChildOfClass("Humanoid")

	if humanoid then
		local player = game.Players:GetPlayerFromCharacter(character)

		if player then
		-- ตรวจสอบว่ามี leaderstats และ Money หรือไม่
		if not player:FindFirstChild("leaderstats") then
			local leaderstats = Instance.new("Folder")
				leaderstats.Name = "leaderstats"
				leaderstats.Parent = player
			end

			if not player.leaderstats:FindFirstChild("Baht") then
				local money = Instance.new("IntValue")
				money.Name = "Baht"
				money.Value = 0
				money.Parent = player.leaderstats
			end

			-- เพิ่มเงินให้กับผู้เล่น
			player.leaderstats.Money.Value = player.leaderstats.Money.Value + 10

			-- ทำลายของที่เก็บเพื่อไม่ให้เก็บซ้ำ
			item:Destroy()
		end
	end
end)
]]--
