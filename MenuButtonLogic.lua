require ("menuButtons")


function handleMouseClick(x, y, Menu_to_settings_BUTTON)
    -- Check if the mouse click is within the button's bounds
    if x >= Menu_to_settings_BUTTON.x and x <= Menu_to_settings_BUTTON.x + Menu_to_settings_BUTTON.width and y >= Menu_to_settings_BUTTON.y and y <= Menu_to_settings_BUTTON.y + Menu_to_settings_BUTTON.height then
        -- The button has been clicked
        print("settings Button clicked!") --This is only visible in console and helps with debugging
        pushState(settings)
    end
end