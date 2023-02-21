require ("StatesAndFiles")




function love.load()

    push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {fullscreen = true})

    pushState(Menu)
end

function love.update(dt)
    currentState = stackState[#stackState]
    currentState:update(dt)
    
end

function love.draw()
    
    push:start()
    currentState:draw()
    push:finish()
    
   
end



function love.keypressed(key)
    -- Pass the key pressed to the handleKeyPress function
    handleKeyPress(key)
end

function love.mousepressed(x, y)
    -- Pass the mouse click coordinates to the handleMouseClick function
    print ("Mouse presses at",x,y )
    handleMouseClick(x, y, Menu_to_settings_BUTTON)
end

