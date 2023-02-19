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


