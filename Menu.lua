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
    elseif love.keyboard.isDown("return") then
        print ("enter key pressed, entering level one")
        changeState(game_Level_one, Menu)


    end


end

function Menu:draw()
    drawButton(Menu_to_settings_BUTTON)
    drawButton(Menu_label_BUTTON)
    love.graphics.setColor(255, 255, 255)
    
end














