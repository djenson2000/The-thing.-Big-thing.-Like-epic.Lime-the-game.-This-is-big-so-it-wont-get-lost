Menu = {}
mouse = {}
require ("MenuButtonLogic")

function Menu:enter()end

function Menu:exit()end

function Menu:update(dt)
    
    mouse.x, mouse.y = love.mouse.getPosition()

end

function love.mousepressed(x, y)
    -- Pass the mouse click coordinates to the handleMouseClick function
    handleMouseClick(x, y, Menu_to_settings_BUTTON)
end


function Menu:draw()
    drawButton(button)
    love.graphics.setColor(255, 255, 255)
    love.graphics.print("Mouse Coordinates: " .. mouse.x .. ", " .. mouse.y)
end



