local CS = game:GetService("CollectionService")
local UIS = game:GetService("UserInputService")

UIS.InputBegan:Connect(function(input, gameProcessed)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		if input.KeyCode == Enum.KeyCode.E and not gameProcessed then
			
			for _,Interactable in pairs(CS:GetTagged("Interactable")) do
				if CS:HasTag(Interactable, "Interactable") then
					local Magnitude = (Interactable.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
					
					if Magnitude <= 10 then
						-- RUN SOME CODE
					end
				end
			end
		end
	end	
end)

game:GetService("RunService").RenderStepped:Connect(function()
	script.Parent.InteractionPrompt.Visible = false
	
	for _,Interactable in pairs(CS:GetTagged("Interactable")) do
		if CS:HasTag(Interactable, "Interactable") then
			local Magnitude = (Interactable.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
			
			if Magnitude <= 10 then
				local coords2D = game.Workspace.CurrentCamera:WorldToScreenPoint(Interactable.Position)
				script.Parent.InteractionPrompt.Position = UDim2.new(0, coords2D.X, 0, coords2D.Y)
				script.Parent.InteractionPrompt.Visible = true
			end
		end
	end
end)
