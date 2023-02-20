Menu = {}
mouse = {}

function Menu:enter()end

function Menu:exit()end

function Menu:update(dt)
    
    mouse.x, mouse.y = love.mouse.getPosition()
end



function Menu:draw()
    drawButton(button)
    love.graphics.setColor(255, 255, 255)
    love.graphics.print("Mouse Coordinates: " .. mouse.x .. ", " .. mouse.y)
end

function handleMouseClick(x, y)
    -- Check if the mouse click is within the button's bounds
    if x >= button.x and x <= button.x + button.width and y >= button.y and y <= button.y + button.height then
        -- The button has been clicked, so do something (e.g. print a message)
        print("Button clicked!")
        pushState(settings)
    end
end

