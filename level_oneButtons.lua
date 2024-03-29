Back_to_menu_BUTTON = {
    x = 200, -- The x-coordinate of the button's top-left corner
    y = 100, -- The y-coordinate of the button's top-left corner
    width = 200, -- The width of the button
    height = 50, -- The height of the button
    color = { 0.5, 0.5, 0.5 }, -- The color of the button (gray)
    text = "Back too menu", -- The text to display on the button
    font = love.graphics.newFont(16), -- The font to use for the button's text
    textColor = { 1, 1, 1 }, -- The color of the button's text (white)
    clickable = false
}

function makeLevelOneButtonClickable()
    Back_to_menu_BUTTON.clickable = true
    print ("level one buttons are now available")
end

function makeLevelOneButtonUnclickable()
    Back_to_menu_BUTTON.clickable = false
    print ("level one buttons are now unavailable")
end