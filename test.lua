-- Reference to the part you want to move
local part = workspace.PartToMove

-- Define the new position you want to move the part to
local endPosition = Vector3.new(0, 10, 0)  -- Change these coordinates to your desired destination

-- Create a TweenInfo object to specify the duration and easing style of the animation
local tweenInfo = TweenInfo.new(
    2,  -- Duration in seconds
    Enum.EasingStyle.Linear,  -- Easing style (You can choose a different style)
    Enum.EasingDirection.Out,  -- Easing direction (You can choose a different direction)
    0,  -- Number of repetitions (0 for no repetition)
    false,  -- Reverses the animation on repetitions
    0  -- Delay before starting the animation
)

-- Create the Tween object
local tween = game:GetService("TweenService"):Create(part, tweenInfo, {Position = endPosition})

-- Function to play the Tween when you're ready
function playTween()
    tween:Play()
end

-- Call playTween to start the animation
playTween()
