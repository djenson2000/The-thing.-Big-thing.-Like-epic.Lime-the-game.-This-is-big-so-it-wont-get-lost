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





    

function isWithinBounds(x, y, button)
    print("Checking if click is within bounds...")
    
        print("Checking button", button.name,"here are the buttons values: Clickable=",button.clickable,"buttons x value =",button.x,"buttons y value=",button.y,"buttons width =",button.width,"buttons hight =",button.height)
        if button.x and button.y and button.width and button.height and button.clickable then
            if x >= button.x and x <= button.x + button.width and y >= button.y and y <= button.y + button.height then
                print("Button", button.name, "was clicked!")
                return button
            end
        else
            print("ERROR -- All required properties not found for button", button.name)
            return nil
        end
    
    print("Click is not within bounds of any button")
    return nil
end