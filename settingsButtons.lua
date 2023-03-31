Back_to_menu_BUTTON = {
    name = ("SettingsToMenu"),
    x = 400, -- The x-coordinate of the button's top-left corner
    y = 300, -- The y-coordinate of the button's top-left corner
    width = 200, -- The width of the button
    height = 50, -- The height of the button
    color = { 0.5, 0.5, 0.5 }, -- The color of the button (gray)
    text = "Back too menu", -- The text to display on the button
    font = love.graphics.newFont(16), -- The font to use for the button's text
    textColor = { 1, 1, 1 }, -- The color of the button's text (white)
    clickable = true
}

Mute_sound_BUTTON = {
    name = ("MuteButton"),
    x = 400, -- The x-coordinate of the button's top-left corner
    y = 400, -- The y-coordinate of the button's top-left corner
    width = 200, -- The width of the button
    height = 50, -- The height of the button
    color = { 0.5, 0.5, 0.5 }, -- The color of the button (gray)
    text = "Mute", -- The text to display on the button
    font = love.graphics.newFont(16), -- The font to use for the button's text
    textColor = { 1, 1, 1 }, -- The color of the button's text (white)
    clickable = false
}

settings_buttons = {Back_to_menu_BUTTON, Mute_sound_BUTTON}

function settingsButtonChecker(x, y)
    print("settingsButtonChecker is in use")
    for _, button in pairs(settings_buttons) do
        print("Checking button:", button.name)
        local clickedButton = isWithinBounds(x, y, button)
        if clickedButton then
            -- The button was clicked, so do something here
            print("Clicked button:", clickedButton.name)
            if clickedButton.name == ("SettingsToMenu") then
                 popstate()
            end
            
            break
        end
    end
end




function makeSettingsButtonsClickable()

Back_to_menu_BUTTON.Clickable = true
print ("Settings buttons are now available")
end

function makeSettingsButtonsUnclickable()

Back_to_menu_BUTTON.clickable = false
print ("Settings buttons are now unavailable")
end