Back_to_menu_BUTTON = {
    x = 400, -- The x-coordinate of the button's top-left corner
    y = 300, -- The y-coordinate of the button's top-left corner
    width = 200, -- The width of the button
    height = 50, -- The height of the button
    color = { 0.5, 0.5, 0.5 }, -- The color of the button (gray)
    text = "Back too menu", -- The text to display on the button
    font = love.graphics.newFont(16), -- The font to use for the button's text
    textColor = { 1, 1, 1 }, -- The color of the button's text (white)
    Clickable = false
}

function makeSettingsButtonsClickable()

Back_to_menu_BUTTON.Clickable = true
print ("Settings buttons are now available")
end

function makeSettingsButtonsUnclickable()

Back_to_menu_BUTTON.clickable = false
print ("Settings buttons are now unavailable")
end