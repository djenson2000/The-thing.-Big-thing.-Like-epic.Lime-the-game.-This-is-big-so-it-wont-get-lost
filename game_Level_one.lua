game_Level_one = {}

require("level_oneButtons")

function game_Level_one:enter()
    print("Starting LevelOne Enter tasks")
    makeLevelOneButtonClickable()
    print ("Finsished LevelOne Enter Tasks")
end
    
function game_Level_one:exit()
    print ("Starting LevelOne exit tasks")
    makeLevelOneButtonUnclickable()
    print ("finishing LevelOne exit tasks")
end


function game_Level_one:update(dt)

end



-- Load the tileset image
local tilesetImage = love.graphics.newImage("test.png")

-- Define the tile width and height
local tileWidth, tileHeight = 16, 16

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
local map = {
    {1, 1, 1, 1, 1, 1},
    {1, 0, 0, 0, 0, 1},
    {1, 0, 1, 1, 0, 1},
    {1, 0, 0, 0, 0, 1},
    {1, 1, 1, 1, 1, 1},
}

-- Define the map width and height
local mapWidth, mapHeight = #map[1], #map

-- Define the map position
local mapX, mapY = 100, 100

function game_Level_one:draw()
    -- Draw the map
    for y = 1, mapHeight do
        for x = 1, mapWidth do
            local tile = map[y][x]
            love.graphics.draw(tilesetImage, tilesetQuads[tile +1], (x - 1) * tileWidth + mapX, (y - 1) * tileHeight + mapY)
        end
    end
end
