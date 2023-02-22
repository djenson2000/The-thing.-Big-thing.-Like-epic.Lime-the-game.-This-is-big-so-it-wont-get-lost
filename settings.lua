settings = {}
local timer = 0

require ("settingsButtons")


function settings:enter() 
makeSettingsButtonsClickable()
end
function settings:exit()
makeSettingsButtonsUnclickable()
end

function settings:update(dt)
    if love.keyboard.isDown("escape") then
        print("escape key is down in settings, popping settings state")
        popState()
    end
    mouse.x, mouse.y = love.mouse.getPosition()
end

function settings:draw()
    love.graphics.setColor(0,1,1)
    love.graphics.rectangle("fill",20,20,800,800)
    drawButton(Back_to_menu_BUTTON)
    drawButton(Mute_sound_BUTTON)
end

function love.mousepressed(x, y)
    -- Pass the mouse click coordinates to the handleMouseClick function
    handlesettingsMouseClick(x, y, Back_to_menu_BUTTON)
end



function handlesettingsMouseClick(x, y, Back_to_menu_BUTTON)
    -- Check if the mouse click is within the button's bounds
    if x >= Back_to_menu_BUTTON.x and x <= Back_to_menu_BUTTON.x + Back_to_menu_BUTTON.width and y >= Back_to_menu_BUTTON.y and y <= Back_to_menu_BUTTON.y + Back_to_menu_BUTTON.height and Back_to_menu_BUTTON.Clickable == true then
        -- The button has been clicked
        print("Back to Menu Button clicked!") --This is only visible in console and helps with debugging
        popState()
    end
end
