require ("buttons")
require ("level_oneButtons")
require ("menuButtons")
require ("settingsButtons")

function drawButton()
    -- Set the color to the button's color
    love.graphics.setColor(button.color)
    -- Draw a rectangle for the button
    love.graphics.rectangle("fill", button.x, button.y, button.width, button.height)
    -- Set the color to the button's text color
    love.graphics.setColor(button.textColor)
    -- Set the font to the button's font
    love.graphics.setFont(button.font)
    -- Draw the button's text in the center of the button
    love.graphics.printf(button.text, button.x, button.y + button.height/2 - button.font:getHeight()/2, button.width, "center")
end



function handleKeyPress(key)
    -- Check if the key pressed is the "enter" key
    
        if key == "return" then
            -- The button has been "pressed", so do something (e.g. print a message)
            print("Button pressed!")
    
        end
end