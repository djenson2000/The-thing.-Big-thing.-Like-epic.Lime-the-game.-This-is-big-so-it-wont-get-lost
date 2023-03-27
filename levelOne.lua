levelOne = {}

require("level_oneButtons")
require("levelOneMap")

-- Load the sprite image
spriteImage = love.graphics.newImage("iamtesting.png")

-- Define the sprite position
spriteX, spriteY = 50, 50

-- Define the sprite dimensions
spriteWidth, spriteHeight = spriteImage:getDimensions()

--Theres are used to store the velocitys of the sprite for both x and y
spriteVelX, spriteVelY = 0, 0

spriteMaxVelPosX = 100

spriteMaxVelNegX = -100

floorFriction = 20

gravityStrenth = 10 

jumpVel = 100

-- Where the map begins to draw
mapX, mapY = 0, 0

-- Might be used for fall damage
momentumX, momentumY = 0, 0

acceleration = 2

collisionLeft, collisionRight, collisionUp, collisionDown  = false, false, false, false

VelocityDecayTimer = 0.00001

VelocityDecayConstant = 500

collisionTileWidth, collisionTileHeight = 64, 64

spriteX, spriteY = 64, 64



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
    timer = timer + dt
    VelocityDecayTimer = VelocityDecayTimer + dt
    
    if handleKeyPress("escape") then
        changeState(Menu)
    end
    collisionLeft, collisionRight, collisionUp, collisionDown  = false
    SpriteVelocityCalculator()
    SpriteVelocityDecay()
    SpriteCollisionChecker()
    SpriteCollision()
    spriteX = spriteX + (spriteVelX * dt)
    spriteY = spriteY + (spriteVelY * dt)
end





function SpriteCollision()
    if collisionDown or collisionUp == true then
        spriteVelY = 0 
    end
    if collisionLeft or collisionRight == true then 
        spriteVelX = 0
    end

end

function SpriteVelocityDecay()
    if love.keyboard.isDown("left") then 
        print("Left arrow key inputting movement, not decaying velocity")
        VelocityDecayTimer = 0
    else
        if love.keyboard.isDown("right") then
            print("right arrow key inputting movement, not decaying velocity")
            VelocityDecayTimer = 0
        else
            print("no input on x axis, decaying velocity")
            if VelocityDecayTimer > VelocityDecayConstant then
              
                if spriteVelX > 0 then
                    if spriteVelX - floorFriction < 0 then
                        spriteVelX = 0    
                    elseif spriteVelX - floorFriction > 0 then
                            spriteVelX = spriteVelX - floorFriction      
                    else 
                            print("ERROR - SpriteVelocityDecay had a condition that should not be possible")  
                    end
                end
                if spriteVelX < 0 then
                    if spriteVelX + floorFriction > 0 then
                        spriteVelX = 0
                    elseif spriteVelX + floorFriction < 0 then
                        spriteVelX = spriteVelX + floorFriction
                    else
                        print("ERROR - SpriteVelocityDecay had a condition that should not be possible") 
                    end
                end
                VelocityDecayTimer = 0
            end
        end
    end
end







function SpriteVelocityCalculator()
    if love.keyboard.isDown("right") and not collisionRight then
        
        if (spriteVelX + acceleration) < spriteMaxVelPosX then 
            spriteVelX = spriteVelX + acceleration 
            print ("spriteVelX increaced to", spriteVelX)

        else
            spriteVelX = spriteMaxVelPosX
            print ("spriteVelX has reached spriteMaxVelPosX")
        end
    end

    if love.keyboard.isDown("left") and not collisionLeft then
        if spriteVelX + acceleration < spriteMaxVelNegX then
            spriteVelX = spriteVelX - acceleration 
            print ("spriteVelX decreced to", spriteVelX)
        else
            spriteVelX = spriteMaxVelNegX
            print ("spriteVelX has reached spriteMaxVelNegX")
        end
    end

    if love.keyboard.isDown("space") then
        if spriteVelY == 0 then --Stop jumping happening when the last jump is already in action
            spriteVelY = spriteVelY + jumpVel 
        end
    end

end


function SpriteCollisionChecker()
    -- Determine the indices of the collision tiles that the sprite intersects with
    local spriteLeftIndex = math.floor(spriteX / collisionTileWidth) + 1
    local spriteRightIndex = math.floor((spriteX + spriteWidth) / collisionTileWidth) + 1
    local spriteTopIndex = math.floor(spriteY / collisionTileHeight) + 1
    local spriteBottomIndex = math.floor((spriteY + spriteHeight) / collisionTileHeight) + 1
    
    local collisionLeft, collisionRight, collisionUp, collisionDown = false, false, false, false
    
    -- Check if the sprite intersects with any solid tiles
    for y = spriteTopIndex, spriteBottomIndex do
        for x = spriteLeftIndex, spriteRightIndex do
            if levelOneMap_collisions[y][x] == 1 then
                -- Check which side the collision occurred on
                local tileX = (x - 1) * collisionTileWidth
                local tileY = (y - 1) * collisionTileHeight
                
                if spriteX + spriteWidth > tileX and spriteX < tileX then
                    print("Collision Left")
                    collisionLeft = true
                elseif spriteX < tileX + collisionTileWidth and spriteX + spriteWidth > tileX + collisionTileWidth then
                    print("Collision Right")
                    collisionRight = true
                end
                
                if spriteY + spriteHeight > tileY and spriteY < tileY then
                    print("Collision Up")
                    collisionUp = true
                elseif spriteY < tileY + collisionTileHeight and spriteY + spriteHeight > tileY + collisionTileHeight then
                    print("Collision Down")
                    collisionDown = true
                end
            end
        end
    end
end
    


-- Load the tileset image
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

-- Define the map array


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
end




