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

background = love.graphics.newImage("background.png")

function Menu:update(dt)
    
    

    if handleKeyPress("escape") then
        print("escape key is down in Menu, aborting program(self destruct)")
        love.event.quit()
    end

    if handleKeyPress("return") then
        print ("enter key pressed, entering level one")
        changeState(game_Level_one)
    end


end

function Menu:draw()
    love.graphics.draw(background, 0, 0)
    drawButton(Menu_to_settings_BUTTON)
    drawButton(Menu_label_BUTTON)
    drawButton(Menu_To_Level_One_BUTTON)
    love.graphics.setColor(255, 255, 255)
    
    
end














