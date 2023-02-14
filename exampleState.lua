exampleState = {}
local timer = 0
function exampleState:enter()end

function exampleState:exit()end

function exampleState:update(dt)
    timer = timer + dt
    if timer > 0.0001 then
        timer = 0
        pushState(statetwo)
    end
end

function exampleState:draw()
    love.graphics.setBackgroundColor(1,0,1)
end