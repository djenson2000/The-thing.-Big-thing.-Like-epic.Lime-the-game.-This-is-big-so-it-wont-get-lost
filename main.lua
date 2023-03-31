require ("StatesAndFiles")
timer = 0 




function love.load()

    push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {fullscreen = true})

    handleKey = {}

    pushState(login)

    -- Check if the userdata file exists, and if not, create it and add a default entry
    if not love.filesystem.getInfo("userdata.txt") then
        love.filesystem.write("userdata.txt", "default,0\n") -- this saves in the love roaming appdata folder in windows
      end
      
      -- Load the file containing usernames and scores
      userdata = {}
      for line in love.filesystem.lines("userdata.txt") do -- for every username 
        local username, score = line:match("([^,]+),([^,]+)") -- as a text file it being user, we need to sperate the usernames from there scores, this line of code does that
        userdata[username] = tonumber(score) -- this creates an internal array of the usernames and there scores
      end
    
      -- Set up the input system
      input = ""
      font = love.graphics.newFont(20)
    
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

