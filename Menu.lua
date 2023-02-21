Menu = {}
mouse = {}


require ("menuButtons")


function Menu:enter()
print("Starting Menu Enter tasks")
makeMenuButtonClickable()
print ("Finsished Menu Enter Tasks")
end

function Menu:exit()
print ("Starting menu exit tasks")
makeMenuButtonUnclickable()
print ("finishing menu exit tasks")
end

function Menu:update(dt)
    
    mouse.x, mouse.y = love.mouse.getPosition()

    if love.keyboard.isDown("escape") then
        print("escape key is down in Menu, aborting program(self destruct)")
        love.event.quit()
    end

end

function Menu:draw()
    drawButton(Menu_to_settings_BUTTON)
    love.graphics.setColor(255, 255, 255)
    love.graphics.print("Mouse Coordinates: " .. mouse.x .. ", " .. mouse.y)
end









function love.keypressed(key)
    -- Pass the key pressed to the handleKeyPress function
    handleMenuKeyPress(key)

end




