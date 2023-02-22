game_Level_one = {}

function game_Level_one:enter()
    print("Starting Menu Enter tasks")
    makeMenuButtonClickable()
    print ("Finsished Menu Enter Tasks")
end
    
function game_Level_one:exit()
    print ("Starting menu exit tasks")
    makeMenuButtonUnclickable()
    print ("finishing menu exit tasks")
end


function Menu:update(dt)

end



-- Load the tileset image
local tilesetImage = love.graphics.newImage("mainlev_build.png")

-- Define the tile width and height
local tileWidth, tileHeight = 16, 16

-- Define the tileset quads
local tilesetQuads = {}
for y = 0, tilesetImage:getHeight() - tileHeight, tileHeight do
    for x = 0, tilesetImage:getWidth() - tileWidth, tileWidth do
        table.insert(tilesetQuads, love.graphics.newQuad(x, y, tileWidth, tileHeight, tilesetImage:getDimensions()))
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
            love.graphics.draw(tilesetImage, tilesetQuads[tile], (x - 1) * tileWidth + mapX, (y - 1) * tileHeight + mapY)
        end
    end
end
