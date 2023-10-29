local Players = game:GetService("Players")
local startingMoney = 500 --กำหนดจำนวนเงินเริ่มต้น
local LevelTime = 60

Players.PlayerAdded:Connect(function(player)
	-- ตั้งleaderstat
	if not player:FindFirstChild("leaderstats") then
		local leaderstats = Instance.new("Folder")
		leaderstats.Name = "leaderstats"
		leaderstats.Parent = player
	end
	
	if not player.leaderstats:FindFirstChild("Level") then
		local level = Instance.new("IntValue")
		level.Name = "Level"
		level.Value = 1 --ค่าเริ่มต้นของ Level
		level.Parent = player.leaderstats
	end

	--ตัง
	if not player.leaderstats:FindFirstChild("Baht") then
		local money = Instance.new("IntValue")
		money.Name = "Baht"
		money.Value = startingMoney
		money.Parent = player.leaderstats
	end
	
	-- ฟังก์ชันเพิ่ม Level
	local function increaseLevel()
		player.leaderstats.Level.Value = player.leaderstats.Level.Value + 1
	end
	
	local item = game.Workspace.SpawnPoints.Part

	item.Touched:Connect(function(hit)
		local character = hit.Parent
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		
			local player = game.Players:GetPlayerFromCharacter(character)
			if player then
				player.leaderstats.Baht.Value = player.leaderstats.Baht.Value + 10
				item:Destroy()
			end
		end)
	
	local spawningItem = game.Workspace.SpawnPoints.Part -- แทน YourPartName ด้วยชื่อของ Part ที่คุณต้องการให้สุ่มเกิด
	local spawnPoints = game.Workspace.SpawnPoints:GetChildren() -- Folder ที่มีจุดเกิด (แต่ละ Part เป็นจุดเกิด)

	local spawnTime = 5 -- เวลาที่ต้องการให้ Part สุ่มเกิด ในที่นี้คือทุก ๆ 5 วินาที
	local partexist = workspace:FindFirstChild("SpawnPoints")
	
	if not partexist then
		
		while wait(spawnTime) do
			local randomSpawnPoint = spawnPoints[math.random(1, #spawnPoints)]
			local newItem = spawningItem:Clone()
			newItem.Position = randomSpawnPoint.Position
			newItem.Parent = game.Workspace
		end
	end
	
-- ฟังก์ชันเพิ่ม Level ทุกๆ 1 นาที
	while wait(LevelTime) do
		increaseLevel()
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
