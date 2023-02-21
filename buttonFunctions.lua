require ("buttons")
require ("level_oneButtons")
require ("menuButtons")
require ("settingsButtons")

function drawButton(button)
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
            print("Enter key pressed pressed!")
    
        end
end

function handleMouseClick(x, y, Menu_to_settings_BUTTON)
    -- Check if the mouse click is within the button's bounds
    if x >= Menu_to_settings_BUTTON.x and x <= Menu_to_settings_BUTTON.x + Menu_to_settings_BUTTON.width and y >= Menu_to_settings_BUTTON.y and y <= Menu_to_settings_BUTTON.y + Menu_to_settings_BUTTON.height and Menu_to_settings_BUTTON.clickable == true then
        -- The button has been clicked
        print("settings Button clicked!") --This is only visible in console and helps with debugging
        changeState(settings, Menu)

    end
end

