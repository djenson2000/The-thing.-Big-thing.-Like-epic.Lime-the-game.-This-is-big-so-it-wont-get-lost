Menu_To_Level_One_BUTTON = {
    name = "MenuToLevelone",
    x = 200, -- The x-coordinate of the button's top-left corner
    y = 300, -- The y-coordinate of the button's top-left corner
    width = 200, -- The width of the button
    height = 50, -- The height of the button
    color = { 0.5, 0.5, 0.5 }, -- The color of the button (gray)
    text = "Play game!", -- The text to display on the button
    font = love.graphics.newFont(16), -- The font to use for the button's text
    textColor = { 1, 1, 1 }, -- The color of the button's text (white)
    clickable = false
}

Menu_to_settings_BUTTON = {
    name = "MenuTosettings",
    x = 200, -- The x-coordinate of the button's top-left corner
    y = 200, -- The y-coordinate of the button's top-left corner
    width = 200, -- The width of the button
    height = 50, -- The height of the button
    color = { 0.5, 0.5, 0.5 }, -- The color of the button (gray)
    text = "settings", -- The text to display on the button
    font = love.graphics.newFont(16), -- The font to use for the button's text
    textColor = { 1, 1, 1 }, -- The color of the button's text (white)
    clickable = false
}

Menu_label_BUTTON = {
    name = "Main Menu text",
    x = 100, -- The x-coordinate of the button's top-left corner
    y = 100, -- The y-coordinate of the button's top-left corner
    width = 300, -- The width of the button
    height = 50, -- The height of the button
    color = { 0.5, 0.5, 0.5 }, -- The color of the button (gray)
    text = "Main Menu", -- The text to display on the button
    font = love.graphics.newFont(16), -- The font to use for the button's text
    textColor = { 1, 1, 1 }, -- The color of the button's text (white)
    clickable = false
}



menu_buttons = {Menu_To_Level_One_BUTTON, Menu_to_settings_BUTTON}

function menuButtonChecker(x, y)
    print("menuButtonChecker is in use")
    for _, button in pairs(menu_buttons) do
        print("Checking button:", button.name)
        local clickedButton = isWithinBounds(x, y, button)
        if clickedButton then
            -- The button was clicked, so do something here
            print("Clicked button:", clickedButton.name)
            if clickedButton.name == ("MenuTosettings") then
            pushState(settings)
            elseif clickedButton.name == ("MenuToLevelone") then
            pushState(levelOne)
            end
            
            
        end
    end
end


function handleMenuKeyPress(key)
    -- Check if the key pressed is the "enter" key
    
        if key == "return" then
            -- The button has been "pressed", so do something (e.g. print a message)
            print("Button pressed!")
    
        end
end


function makeMenuButtonClickable()
Menu_to_settings_BUTTON.clickable = true
Menu_To_Level_One_BUTTON.clickable = true
print ("Menu buttons are now available")

end

function makeMenuButtonUnclickable()
Menu_to_settings_BUTTON.clickable = false
Menu_To_Level_One_BUTTON.clickable = false
print("Menu buttons are now unavailible")

end