require ("theneededingredients")


function love.load()
    pushState(exampleState)
end

function love.update(dt)
    currentState = stackState[#stackState]
    currentState:update(dt)
end

function love.draw()
    currentState:draw()
end

