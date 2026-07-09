-- Window dragging (FIXED - now using titleBar instead of titleLabel)
local dragging = false
local dragStart = nil
local frameStart = nil

titleBar.MouseButton1Down:Connect(function()
    dragging = true
    dragStart = UserInputService:GetMouseLocation()
    frameStart = mainFrame.Position
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input, gameProcessed)
    if dragging and input.UserInputType == Enum.UserInputType.Mouse then
        local delta = UserInputService:GetMouseLocation() - dragStart
        mainFrame.Position = frameStart + UDim2.new(0, delta.X, 0, delta.Y)
    end
end)

-- Minimize functionality
local isMinimized = false
minimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        contentFrame.Visible = false
        minimizeButton.Text = "+"
    else
        contentFrame.Visible = true
        minimizeButton.Text = "–"
    end
end)
