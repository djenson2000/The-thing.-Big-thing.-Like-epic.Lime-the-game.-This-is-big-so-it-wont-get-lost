settings = {}
local timer = 0

function settings:enter() end
function settings:exit() end

function settings:update(dt)
    if love.keyboard.isDown("escape") then
        print("escape key is down in settings, popping settings state")
        popState()
    end
end

function settings:draw()
    love.graphics.setColor(0,1,1)
    love.graphics.rectangle("fill",20,20,800,800)
end
