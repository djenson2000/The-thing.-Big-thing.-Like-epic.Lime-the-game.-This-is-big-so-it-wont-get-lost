settings = {}
local timer = 0
function settings:enter()end

function settings:exit()end

function settings:update(dt)
    
function handleSettingsKeyPress(key)
    if love.keyboard.wasPressed("escape") then
        popState()
    end
end
end

function settings:draw()
    love.graphics.setColor(0,1,1)
    love.graphics.rectangle("fill",20,20,800,800)
end