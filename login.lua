login = {}

enterPressed = false
inputActive = false
loggedin = false
input = "" -- initialize input variable

function login:enter()
end

function login:exit()
end
  
function login:update(dt)
  if handleKeyPress("escape") then
    print("escape key is down in Menu, aborting program(self destruct)")
    love.event.quit()
  end
  if loggedin == true then
    print("login success")
    changeState(Menu) -- if logged in successfully, the menu state should be selected
  end
  if handleKeyPress("return") then
    -- when the enter key is pressed then process the data
    if userdata[input] then
      --this checks if the username exists
      loggedin = true
    else
      -- If the username doesn't exist, ask the user if they want to register using a snazzy little window
      local choice = love.window.showMessageBox("Username not found", "Do you want to register a new account with the username "..input.."?", {"Yes", "No"})
      if choice == 1 then
        -- If the user chooses to register, the username should be added to the file with a defult top score of 0
        userdata[input] = 0
        love.filesystem.append("userdata.txt", input..",0\n")
        print("New account registered for "..input) -- debug output
        -- Write the entire userdata table back to the file
        local file = love.filesystem.newFile("userdata.txt", "w")
        for username, score in pairs(userdata) do
          file:write(username..","..score.."\n")
        end
        file:close()
      end
    end
  end
end

function love.keypressed(key)

end

function love.textinput(text)
  -- Add the character to the input string, regardless of the inputActive flag
  if text == "\n" or text == "\r" or text == " " then
    -- Do not add whitespace characters to the input sting to stop enter, space etc from breaking the login system
  elseif text == "\b" then
    -- Handle backspace by removing the last character from the input string
    input = input:sub(1, -2)
  else
    -- Add the character to the input string so the user and program can see it
    input = input..text
  end
end

function login:draw()
  -- Draw the input text
  love.graphics.setFont(font) -- sets the font to use, in the case, the default one
  love.graphics.print("Username: "..input, 10, 10) -- outputs the username 
  if loggedin == true then
      love.graphics.print("Top score for "..input..": "..userdata[input], 300, 10)
  end
end

-- Define handleKeyPress() and userdata here or make sure they are properly defined elsewhere.
