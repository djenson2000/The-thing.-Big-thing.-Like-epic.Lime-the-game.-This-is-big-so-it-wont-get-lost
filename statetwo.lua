statetwo = {}
local timer = 0
function statetwo:enter()end

function statetwo:exit()end

function statetwo:update(dt)
    timer = timer + dt
    if timer > 0.5 then
        timer = 0
        pushState(Menu)
    end
end

function statetwo:draw()
    love.graphics.setBackgroundColor(1,1,0)
end