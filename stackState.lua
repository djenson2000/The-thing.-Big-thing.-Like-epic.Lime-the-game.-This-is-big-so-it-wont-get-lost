stackState = {}

function pushState(newState, params)
    newState:enter()
    table.insert(stackState, newState)
end

function popState()
    stackState[#stackState]:exit()
    return table.remove(stackState)
end

function changeState(newState, OldState)
    popState()
    pushState(newState)
end

function clearState(newState)
    -- pop every state and then push the new one
    for i = 1, stackState[#stackState] do
        popState()
    end

    pushState(newState)
end