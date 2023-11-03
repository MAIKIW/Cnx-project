local Prox = script.Parent
local Seat = Prox.Parent

Seat:GetPropertyChangedSignal("Occupant"):Connect(function()
	if Seat.Occupant then
		Prox.Enabled = false
	else
		Prox.Enabled = true
	end
end)

Prox.Triggered:Connect(function(Player)
	Seat:Sit(Player.Character.Humanoid)
end)
