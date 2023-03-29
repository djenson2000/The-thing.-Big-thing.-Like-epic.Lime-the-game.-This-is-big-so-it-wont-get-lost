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

spriteMaxVelPosX, spriteMaxVelNegX, spriteMaxVelPosY, spriteMaxVelPosY = 50, -50, -50, 50




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


    
    SpriteGravity()

    SpriteVelocityCalculator()

    SpriteVelocityDecay()

    
    

    if (collisionDown) then
        if spriteVelY > 0 then
            spriteVelY = 0
        end
    else
        spriteY = spriteY + (spriteVelY * dt)
        movedY = true

    end
    if collisionUp then
        if spriteVelY < 0 then
            spriteVelY = 0
        end
    elseif MovedY == false then
        spriteY = spriteY + (spriteVelY * dt)
    end

    if collisionLeft then
        if spriteVelX < 0 then
            spriteVelX = 0
        end
    else
        spriteX = spriteX + (spriteVelX * dt)
        movedX = true
    end
    if collisionRight then
        if spriteVelX > 0 then
            spriteVelX = 0
        end
    elseif movedX == false then
        spriteX = spriteX + (spriteVelX * dt)
    end
    
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
    if VelocityDecayTimer > VelocityDecayConstant then
        if love.keyboard.isDown("left") then 
            print("Left arrow key inputting movement, not decaying velocity")
            VelocityDecayTimer = 0
        elseif love.keyboard.isDown("right") then
            print("right arrow key inputting movement, not decaying velocity")
            VelocityDecayTimer = 0
        else
           
            if spriteVelX > 0 then
                if spriteVelX - floorFriction < 0 then
                    spriteVelX = 0.00  
                    
                elseif spriteVelX - floorFriction > 0 then
                    spriteVelX = spriteVelX - floorFriction      
                    
                else 
                    print("ERROR - SpriteVelocityDecay had a condition that should not be possible")  
                    spriteVelX = 0
                end
            end
            if spriteVelX < 0 then
                if spriteVelX + floorFriction > 0 then
                    spriteVelX = 0.00
                    
                elseif spriteVelX + floorFriction < 0 then
                    spriteVelX = spriteVelX + floorFriction
                   
                else
                    print("ERROR - SpriteVelocityDecay had a condition that should not be possible") 
                    spriteVelX = 0
                end
            end
            VelocityDecayTimer = 0
        end
    end
end


function SpriteGravity()

    if collisionDown == false then 
        print("gravity going down, vely = "..spriteVelY)
        spriteVelY = spriteVelY + gravityStrenth 
    else
        spriteVelY = 0 
        
    end

end






function SpriteVelocityCalculator()
    if love.keyboard.isDown("right") then -- and collisionRight == false
        print("key right down")
        if (spriteVelX + acceleration) < spriteMaxVelPosX then 
            spriteVelX = spriteVelX + acceleration 
            print ("spriteVelX increaced to", spriteVelX)

        else
            spriteVelX = spriteMaxVelPosX
            print ("spriteVelX has reached spriteMaxVelPosX")
        end
    end

    if love.keyboard.isDown("left") and collisionLeft == false then
        if spriteVelX + acceleration > spriteMaxVelNegX then
            spriteVelX = spriteVelX - acceleration 
            print ("spriteVelX decreced to", spriteVelX)
        else
            spriteVelX = spriteMaxVelNegX
            print ("spriteVelX has reached spriteMaxVelNegX")
        end
    end

    if love.keyboard.isDown("space") and collisionUp == false then
        if spriteVelY == 0 then --Stop jumping happening when the last jump is already in action
            spriteVelY = spriteVelY - jumpVel 
        end
    end

end



function SpriteCollisionChecker()
    -- Determine the indices of the collision tiles that the sprite intersects with
    spriteLeftIndex = math.max(1, math.floor((spriteX - collisionDistance) / collisionTileWidth) + 1)
    spriteRightIndex = math.min(levelOneMap_width, math.floor(((spriteX + collisionDistance) + spriteWidth - 1) / collisionTileWidth) + 1)
    spriteTopIndex = math.max(1, math.floor((spriteY - collisionDistance) / collisionTileHeight) + 1)
    spriteBottomIndex = math.min(levelOneMap_height, math.floor(((spriteY + collisionDistance) + spriteHeight - 1) / collisionTileHeight) + 1)




    -- Check if the sprite intersects with any solid tiles
    for y = spriteTopIndex, spriteBottomIndex do
        for x = spriteLeftIndex, spriteRightIndex do
            if levelOneMap_collisions[y][x] == 1 then
                -- Check which side the collision occurred on
                tileX = (x - 1) * collisionTileWidth
                tileY = (y - 1) * collisionTileHeight

                deltaX = math.max(0, math.min(spriteX + spriteWidth, tileX + collisionTileWidth) - math.max(spriteX, tileX))
                deltaY = math.max(0, math.min(spriteY + spriteHeight, tileY + collisionTileHeight) - math.max(spriteY, tileY))

                if deltaX > deltaY then
                    if spriteY + spriteHeight > tileY and spriteY < tileY then
                        collisionUp = true
                    elseif spriteY < tileY + collisionTileHeight and spriteY + spriteHeight > tileY + collisionTileHeight then
                        collisionDown = true
                    end
                else
                    if spriteX + spriteWidth > tileX and spriteX < tileX then
                        collisionLeft = true
                    elseif spriteX < tileX + collisionTileWidth and spriteX + spriteWidth > tileX + collisionTileWidth then
                        collisionRight = true
                    end
                end
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






