Menu_To_Level_One_BUTTON = {
button = {
    x = 100, -- The x-coordinate of the button's top-left corner
    y = 100, -- The y-coordinate of the button's top-left corner
    width = 200, -- The width of the button
    height = 50, -- The height of the button
    color = { 0.5, 0.5, 0.5 }, -- The color of the button (gray)
    text = "Play game!", -- The text to display on the button
    font = love.graphics.newFont(16), -- The font to use for the button's text
    textColor = { 1, 1, 1 } -- The color of the button's text (white)
}
}
Menu_to_settings_BUTTON = {
    x = 100, -- The x-coordinate of the button's top-left corner
    y = 100, -- The y-coordinate of the button's top-left corner
    width = 200, -- The width of the button
    height = 50, -- The height of the button
    color = { 0.5, 0.5, 0.5 }, -- The color of the button (gray)
    text = "settings", -- The text to display on the button
    font = love.graphics.newFont(16), -- The font to use for the button's text
    textColor = { 1, 1, 1 }, -- The color of the button's text (white)
    clickable = false
}



function handleMenuKeyPress(key)
    -- Check if the key pressed is the "enter" key
    
        if key == "return" then
            -- The button has been "pressed", so do something (e.g. print a message)
            print("Button pressed!")
    
        end
end


function makeMenuButtonClickable()
Menu_to_settings_BUTTON.clickable = true
print ("Menu buttons are now available")

end

function makeMenuButtonUnclickable()
Menu_to_settings_BUTTON.clickable = false
print("Menu buttons are now unavailible")

end