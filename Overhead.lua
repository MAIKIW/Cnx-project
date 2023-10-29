--[ SERVICES ]--

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")

--[ Icons ]--

local Admins = {} -- PUT USER ID INSIDE
local Popular = {} -- PUT USER ID INSIDE

--[ OVERHEAD LOCALS ]--

local OverheadGUIs = ReplicatedStorage:WaitForChild("OverheadGUIs")
local OverheadGui = OverheadGUIs:WaitForChild("OverheadGui")
local Icons = OverheadGUIs:WaitForChild("OverheadIcons")

--[ GAMEPASS/DONATOR LOCALS ]--

local GroupId = 11472416 -- GROUP ID GOES HERE

local roles = {
	[255] = {
		Color = Color3.fromRGB(255,255,255),
		Rainbow = true
	},
	[254] = {
		Color = Color3.fromRGB(255,255,255),
		Rainbow = true
	},
	[252] = {
		Color = Color3.fromRGB(255,255,255),
		Rainbow = true
	},
	[251] = {
		Color = Color3.fromRGB(255,255,255),
		Rainbow = false
	},
	[250] = {
		Color = Color3.fromRGB(255,255,255),
		Rainbow = false
	},
	[0] = {
		Color = Color3.fromRGB(255,255,255),
		Rainbow = false
	}
}

--[ MAIN FUNCTIONS ]--

function IconUpdate(plr, levels)
	local icon = "None"
	local rank = plr:GetRankInGroup(GroupId)
	for i,v in pairs(Popular) do
		if(plr.UserId == v) then
			icon = "Popular"
		end
	end
	if(levels > 10000) then
		icon = "HighLevel"
	end
	if(rank == 252) then
		icon = "Friend"
	end
	for i,v in pairs(Admins) do
		if(plr.UserId == v) then
			icon = "Admin"
		end
	end
	if(rank >= 254) then
		icon = "Developer"
	end
	for i,v in pairs(Icons:GetChildren()) do
		if(v.Name == icon) then
			icon = v
			break;
		end
	end
	if(typeof(icon) ~= "string") then
		return icon.Image, true
	end
	return nil, false
end

Players.PlayerAdded:Connect(function(Player)
	Player.CharacterAppearanceLoaded:Connect(function(Character)
		-- These variables are used regardless of whether the user owns the gamepass or not
		-- so we can define them outside the if statement
		local Humanoid = Character:WaitForChild("Humanoid")
		local Head = Character:WaitForChild("Head")

		-- Level for knowing when someone changes
		local LEVEL = Player.leaderstats.Minutes

		-- Again, this happens regardless of the if statement
		Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None

		local CloneGui = OverheadGui:Clone()
		local Gradient = CloneGui.Minutes.UIGradient
		local GradientScript = CloneGui.Minutes.UIScript
		local Icon = CloneGui.Icon

		local RoleGradient = CloneGui.Rank.UIGradient
		local RoleScript = CloneGui.Rank.Script

		CloneGui.Username.Text = Player.DisplayName.." (@"..Player.Name..")"
		CloneGui.Name = "OverheadGui"
		CloneGui.Parent = Head

		-- Group Role Here
		local Role = "[G] Guest"
		local Rank = 0
		pcall(function()
			Rank = Player:GetRankInGroup(GroupId)
			Role = Player:GetRoleInGroup(GroupId)
		end)
		CloneGui.Rank.Text = Role
		
		-- IF YOU WANT TO MAKE CUSTOM RANK NAMES 
		
		if Player.Name == "TwinPlayzDev" then -- PUT NAME HERE
			CloneGui.Rank.Text = "FOR TESTING REASONS" -- PUT TEXT HERE
		elseif Player.Name == "ANOTHERPERSONNAME" then --else another
			CloneGui.Rank.Text = "ANOTHER RANK"
		elseif Player.Name == "ANOTHER" then -- else
			CloneGui.Rank.Text = "ANOTEHRSEHRS"
			-- so on so repeat here.
		end

		-- Level Rank Here
		CloneGui.Minutes.Text = "Minutes : "..LEVEL.Value

		-- Checking To See If Level Changed
		LEVEL.Changed:Connect(function()
			CloneGui.Minutes.Text = "Minutes : "..LEVEL.Value
			if LEVEL.Value >= 100000 then -- Over 100000 Minute LEVEL (RAINBOW)
				CloneGui.Minutes.TextColor3 = Color3.new(1, 1, 1)
				Gradient.Enabled = true
				GradientScript.Disabled = false
			elseif LEVEL.Value >= 10000 then -- Over 10000 Minute LEVEL (DARK RED)
				CloneGui.Minutes.TextColor3 = Color3.new(0.658824, 0, 0)
				Icon.Image, Icon.Visible = IconUpdate(Player, LEVEL.Value)
			elseif LEVEL.Value >= 5000 then -- Over 5000 Minute LEVEL (ORANGE)
				CloneGui.Minutes.TextColor3 = Color3.new(1, 0.666667, 0)
			elseif LEVEL.Value >= 1000 then -- Over 1000 Minute LEVEL (BLUE)
				CloneGui.Minutes.TextColor3 = Color3.new(0, 0.666667, 1)
			elseif LEVEL.Value >= 500 then -- Over 500 Minute LEVEL (PURPLE)
				CloneGui.Minutes.TextColor3 = Color3.new(0.85098, 0.00784314, 1)
			elseif LEVEL.Value >= 100 then -- Over 100 Minute LEVEL (GREEN)
				CloneGui.Minutes.TextColor3 = Color3.new(0.333333, 1, 0)
			else  -- DEFAULT LEVEL (WHITE)
				CloneGui.Minutes.TextColor3 = Color3.new(255,255,255)
			end
		end)

		if LEVEL.Value >= 100000 then -- Over 100000 Minute LEVEL (RAINBOW)
			CloneGui.Minutes.TextColor3 = Color3.new(1, 1, 1)
			Gradient.Enabled = true
			GradientScript.Disabled = false
		elseif LEVEL.Value >= 10000 then -- Over 10000 Minute LEVEL (DARK RED)
			CloneGui.Minutes.TextColor3 = Color3.new(0.658824, 0, 0)
		elseif LEVEL.Value >= 5000 then -- Over 5000 Minute LEVEL (ORANGE)
			CloneGui.Minutes.TextColor3 = Color3.new(1, 0.666667, 0)
		elseif LEVEL.Value >= 1000 then -- Over 1000 Minute LEVEL (BLUE)
			CloneGui.Minutes.TextColor3 = Color3.new(0, 0.666667, 1)
		elseif LEVEL.Value >= 500 then -- Over 500 Minute LEVEL (PURPLE)
			CloneGui.Minutes.TextColor3 = Color3.new(0.85098, 0.00784314, 1)
		elseif LEVEL.Value >= 100 then -- Over 100 Minute LEVEL (GREEN)
			CloneGui.Minutes.TextColor3 = Color3.new(0.333333, 1, 0)
		else  -- DEFAULT LEVEL (WHITE)
			CloneGui.Minutes.TextColor3 = Color3.new(255,255,255)
		end

		RoleGradient.Enabled = roles[Rank].Rainbow
		RoleScript.Disabled = not roles[Rank].Rainbow
		RoleScript.Parent.TextColor3 = roles[Rank].Color

		--Icon.Image, Icon.Visible = IconUpdate(Player, LEVEL.Value)
		
	end)
end)
