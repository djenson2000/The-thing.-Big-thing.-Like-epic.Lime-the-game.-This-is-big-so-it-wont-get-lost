require ("StatesAndFiles")
timer = 0 




function love.load()

    push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {fullscreen = true})

    handleKey = {}

    pushState(Menu)


    
end

function love.update(dt)
    currentState = stackState[#stackState]
    currentState:update(dt)
    mouse.x, mouse.y = love.mouse.getPosition()

    handleKey = {}
end

function love.draw()
    
    push:start()
    currentState:draw()
    push:finish()
    love.graphics.print("Mouse Coordinates: " .. (mouse.x*(gameWidth/windowWidth)) .. ", " .. (mouse.y*(gameHeight/windowHeight)))
    
   
end



function love.keypressed(key)
    -- Pass the key pressed to the handleKeyPress function
    handleKey[key] = true
    --handleKeyPress(key)
    --handleMenuKeyPress(key)
end

function handleKeyPress(key)
    -- Check if the key pressed is the "enter" key
    
        
        if key == "return" then
            -- The button has been "pressed", so do something (e.g. print a message)
            print("Enter key pressed pressed!")
    
        end

        return handleKey[key]
end

function love.mousepressed(x, y)
    -- Pass the mouse click coordinates to the handleMouseClick function
    print ("Mouse presses at",x,y )
    print ("adjusting for push")
    newx = (x)
    newy = (y)
    print ("adjusted mouse presses =",newx,newy)
    
    menuButtonChecker(newx, newy)
    settingsButtonChecker(newx, newy)
end

