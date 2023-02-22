require ("StatesAndFiles")




function love.load()

    push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {fullscreen = true})

    pushState(Menu)
end

function love.update(dt)
    currentState = stackState[#stackState]
    currentState:update(dt)
    mouse.x, mouse.y = love.mouse.getPosition()
end

function love.draw()
    
    push:start()
    currentState:draw()
    push:finish()
    love.graphics.print("Mouse Coordinates: " .. mouse.x .. ", " .. mouse.y)
    
   
end



function love.keypressed(key)
    -- Pass the key pressed to the handleKeyPress function
    handleKeyPress(key)
    handleMenuKeyPress(key)
end

function love.mousepressed(x, y)
    -- Pass the mouse click coordinates to the handleMouseClick function
    print ("Mouse presses at",x,y )
    print ("adjusting for push")
    newx = (x *0.7)
    newy = (y * 0.7)
    print ("adjusted mouse presses =",newx,newy)
    
    menuButtonChecker(newx, newy)
end

