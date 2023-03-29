levelOne = {}

require("level_oneButtons")
require("levelOneMap")

-- Load the sprite image
spriteImage = love.graphics.newImage("iamtesting.png")

-- Define the sprite position
spriteX, spriteY = 70, 70

-- Define the sprite dimensions
spriteWidth, spriteHeight = spriteImage:getDimensions()

--Theres are used to store the velocitys of the sprite for both x and y
spriteVelX, spriteVelY = 0, 0

spriteMaxVelPosX, spriteMaxVelNegX, spriteMaxVelPosY, spriteMaxVelNegY = 50, -50, -50, 50




floorFriction = 10

deltaX, deltaY = 0, 0

gravityStrenth = 1

jumpVel = 300

-- Where the map begins to draw
mapX, mapY = 0, 0

-- Might be used for fall damage
momentumX, momentumY = 0, 0

acceleration = 2

collisionLeft, collisionRight, collisionUp, collisionDown  = false, false, false, false

VelocityDecayTimer = 0.00001

VelocityDecayConstant = 0.05

collisionTileWidth, collisionTileHeight = 64, 64

collisionDistance = 10

levelOneMap_width, levelOneMap_height = 1000, 600

movementCooldown = 0

collisionownoutput = 0 --temp varible

movedX, MovedY = false, false

tileX, tileY = 0, 0 





function levelOne:enter()
    print("Starting LevelOne Enter tasks")
    makeLevelOneButtonClickable()
    print ("Finsished LevelOne Enter Tasks")


end
    
function levelOne:exit()
    print ("Starting LevelOne exit tasks")
    makeLevelOneButtonUnclickable()
    print ("finishing LevelOne exit tasks")
end


function levelOne:update(dt)
  
    VelocityDecayTimer = VelocityDecayTimer + dt
    
    if handleKeyPress("escape") then
        changeState(Menu)
    end
    collisionLeft, collisionRight, collisionUp, collisionDown  = false, false, false, false
    SpriteCollisionChecker()
    SpriteCollision()


  

    
    SpriteGravity()

    SpriteVelocityCalculator()

    SpriteVelocityDecay()

    SpriteCollision()
    

    spriteY = spriteY + (spriteVelY * dt)

    spriteX = spriteX + (spriteVelX * dt)


    
end





function SpriteCollision()
    if (collisionDown) then
        if spriteVelY > 0 then
            spriteVelY = 0
        end
    end
    if collisionUp then
        if spriteVelY < 0 then
            spriteVelY = 0
        end
    end
    if collisionLeft then
        if spriteVelX < 0 then
            spriteVelX = 0
        end
    end
    if collisionRight then
        if spriteVelX > 0 then
            spriteVelX = 0
        end
    end
   
end


function SpriteVelocityDecay()
    -- Check if the velocity decay timer has reached a certain value
    if VelocityDecayTimer > VelocityDecayConstant then
        -- Check if the left arrow key or the right arrow key is pressed to move the sprite
        if love.keyboard.isDown("left") then 
            print("Left arrow key inputting movement, not decaying velocity")
            VelocityDecayTimer = 0
        elseif love.keyboard.isDown("right") then
            print("right arrow key inputting movement, not decaying velocity")
            VelocityDecayTimer = 0
        else
            -- If no arrow key is pressed, apply friction to the sprite's horizontal velocity to slow it down
            if spriteVelX > 0 then
                -- Decrease the horizontal velocity by a certain amount until it reaches zero if it's positive
                if spriteVelX - floorFriction < 0 then
                    spriteVelX = 0.00  
                elseif spriteVelX - floorFriction > 0 then
                    spriteVelX = spriteVelX - floorFriction      
                else 
                    -- This condition should not be possible, so it prints an error message and sets the velocity to zero to try and add robestentss against glitchs 
                    print("ERROR - SpriteVelocityDecay had a condition that should not be possible")  
                    spriteVelX = 0
                end
            end
            if spriteVelX < 0 then
                -- Increase the horizontal velocity by a certain amount until it reaches zero if it's negative
                if spriteVelX + floorFriction > 0 then
                    spriteVelX = 0.00
                elseif spriteVelX + floorFriction < 0 then
                    spriteVelX = spriteVelX + floorFriction
                else
                    -- This condition should not be possible, so it prints an error message and sets the velocity to zero to try and add robestentss against glitchs 
                    print("ERROR - SpriteVelocityDecay had a condition that should not be possible") 
                    spriteVelX = 0
                end
            end
            -- Reset the velocity decay timer
            VelocityDecayTimer = 0
        end
    end
end


function SpriteGravity()

    if collisionDown == false and movementCooldown == 0 then 
        
        print("gravity going down, vely = "..spriteVelY)
        spriteVelY = spriteVelY + gravityStrenth 
    else
        spriteVelY = 0 
        
    end

end






function SpriteVelocityCalculator()
    -- Check if the right arrow key is pressed and there's no collision on the right side of the sprite
    if love.keyboard.isDown("right") and collisionRight == false then 
        print("key right down")
        -- Increase the horizontal velocity by a certain amount until the maximum positive velocity is reached
        if (spriteVelX + acceleration) < spriteMaxVelPosX then 
            spriteVelX = spriteVelX + acceleration 
            print ("spriteVelX increased to", spriteVelX)
        -- If the maximum positive velocity is reached, set it as the new velocity
        else
            spriteVelX = spriteMaxVelPosX
            print ("spriteVelX has reached spriteMaxVelPosX")
        end
    end

    -- Check if the left arrow key is pressed and there's no collision on the left side of the sprite
    if love.keyboard.isDown("left") and collisionLeft == false then
        -- Decrease the horizontal velocity by a certain amount until the maximum negative velocity is reached
        if spriteVelX + acceleration > spriteMaxVelNegX then
            spriteVelX = spriteVelX - acceleration 
            print ("spriteVelX decreased to", spriteVelX)
        -- If the maximum negative velocity is reached, set it as the new velocity
        else
            spriteVelX = spriteMaxVelNegX
            print ("spriteVelX has reached spriteMaxVelNegX")
        end
    end

    -- Check if the space bar is pressed, there's no collision on top, and there's a collision on the bottom of the sprite
    if love.keyboard.isDown("space") and collisionUp == false and collisionDown == true then
        -- Decrease the vertical velocity by a certain amount to simulate a jump
        spriteVelY = spriteVelY - jumpVel 
    end
end



function SpriteCollisionChecker()
    local spriteBottomY = spriteY + spriteHeight
    local spriteTopY = spriteY
    local spriteRightX = spriteX + spriteWidth
    local spriteLeftX = spriteX

    -- Check for collisions on the Y axis
    if spriteVelY > 0 then
        local tileY = math.floor(spriteBottomY / collisionTileHeight) + 1
        local tileX1 = math.floor(spriteLeftX / collisionTileWidth) + 1
        local tileX2 = math.floor(spriteRightX / collisionTileWidth) + 1
        for x = tileX1, tileX2 do
            if levelOneMap_collisions[tileY][x] ~= 0 then
                collisionDown = true
                spriteY = (tileY - 1) * collisionTileHeight - spriteHeight
                spriteVelY = 0
                break
            end
        end
    elseif spriteVelY < 0 then
        local tileY = math.floor(spriteTopY / collisionTileHeight)
        local tileX1 = math.floor(spriteLeftX / collisionTileWidth) + 1
        local tileX2 = math.floor(spriteRightX / collisionTileWidth) + 1
        for x = tileX1, tileX2 do
            if levelOneMap_collisions[tileY][x] ~= 0 then
                collisionUp = true
                spriteY = tileY * collisionTileHeight
                spriteVelY = 0
                break
            end
        end
    end

    -- Check for collisions on the X axis
    if spriteVelX > 0 then
        local tileX = math.floor(spriteRightX / collisionTileWidth) + 1
        local tileY1 = math.floor(spriteTopY / collisionTileHeight) + 1
        local tileY2 = math.floor(spriteBottomY / collisionTileHeight) + 1
        for y = tileY1, tileY2 do
            if levelOneMap_collisions[y][tileX] ~= 0 then
                collisionRight = true
                --spriteX = (tileX - 1) * collisionTileWidth - spriteWidth
                spriteVelX = 0
                break
            end
        end
    elseif spriteVelX < 0 then
        local tileX = math.floor(spriteLeftX / collisionTileWidth)
        local tileY1 = math.floor(spriteTopY / collisionTileHeight) + 1
        local tileY2 = math.floor(spriteBottomY / collisionTileHeight) + 1
        for y = tileY1, tileY2 do
            if levelOneMap_collisions[y][tileX] ~= 0 then
                collisionLeft = true
                --spriteX = tileX * collisionTileWidth
                spriteVelX = 0
                break
            end
        end
    end
end



local tilesetImage = love.graphics.newImage("test.png")

-- Define the tile width and height
local tileWidth, tileHeight = 64, 64

-- Define the tileset quads

local tilesetQuads = {}
for y = 0, tilesetImage:getHeight() - tileHeight, tileHeight do
    for x = 0, tilesetImage:getWidth() - tileWidth, tileWidth do
        local quad = love.graphics.newQuad(x, y, tileWidth, tileHeight, tilesetImage:getDimensions())
        table.insert(tilesetQuads, quad)
        print("Inserted quad:", quad)
    end
end




-- Define the map width and height
local mapWidth, mapHeight = #map[1], #map



function levelOne:draw()
    -- Draw the map
    for y = 1, mapHeight do
        for x = 1, mapWidth do
            local tile = map[y][x]
            love.graphics.draw(tilesetImage, tilesetQuads[tile +1], (x - 1) * tileWidth + mapX, (y - 1) * tileHeight + mapY)
        end
    end
    love.graphics.draw(spriteImage, spriteX, spriteY)
    love.graphics.print(collisionownoutput, 300, 300)
end






