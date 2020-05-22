--/Variables\--
local utf8 = require("utf8")

local NewTaskWindowState = true;
function GetNewTaskWindowState() return NewTaskWindowState end 
local NewtaskName = '';
local NewTaskDesc = '';

local CurrentlyWrittingName = false;
local CurrentlyWrittingDesc = false;




function DrawNewTaskWindow(Assets)

    if NewTaskWindowState then

    --Main frame
    --[[
    Image(Assets.MainFrame, 
    love.graphics.getWidth()/2 -  845/2, 
    love.graphics.getHeight()/2 - 470/2, 
    845, 
    470);
    ]]

    --Title
    local CreateNewString = 'Create a new task';
    local font = love.graphics.getFont()
    local CreateNewStringW = font:getWidth(CreateNewString);

    BetterText(CreateNewString, love.graphics.getWidth()/2 - CreateNewStringW/2, 0.1 * love.graphics.getHeight(), 1, 1);

    BetterText('Name:', 0.15 * love.graphics.getWidth(), 0.25 * love.graphics.getHeight(), 1, 1);
    
    if not CurrentlyWrittingName then
        love.graphics.setColor(0.95, 0.95, 0.95, 1);
    else
        love.graphics.setColor(RGB(255, 252, 184))
    end
    
    love.graphics.rectangle('fill', 0.15 * love.graphics.getWidth(), 0.25 * love.graphics.getHeight() + 75, 500, 50);
    love.graphics.setColor(1, 1, 1, 1);

    BetterText(NewtaskName, 0.15 * love.graphics.getWidth(), 0.25 * love.graphics.getHeight() + 75, 0.7, 0.7);

    BetterText('Description:', 0.15 * love.graphics.getWidth(), 0.25 * love.graphics.getHeight() + 125, 1, 1);

    if not CurrentlyWrittingDesc then
        love.graphics.setColor(0.95, 0.95, 0.95, 1);
    else
        love.graphics.setColor(RGB(255, 252, 184))
    end

    love.graphics.rectangle('fill', 0.15 * love.graphics.getWidth(), 0.25 * love.graphics.getHeight() + 200, 500, 50);
    love.graphics.setColor(1, 1, 1, 1);

    --Text box

    end

end

function love.textinput(t)

    if not NewTaskWindowState or not CurrentlyWrittingName then
        return
    end

    NewtaskName = NewtaskName .. t
end
 


function NewTaskKeyboard(key)

    if not NewTaskWindowState or not CurrentlyWrittingName then
        return
    end

    --Handle name
    if key == "backspace" then
        -- get the byte offset to the last UTF-8 character in the string.
        local byteoffset = utf8.offset(NewtaskName, -1)
 
        if byteoffset then
            -- remove the last UTF-8 character.
            -- string.sub operates on bytes rather than UTF-8 characters, so we couldn't do string.sub(text, 1, -2).
            NewtaskName = string.sub(NewtaskName, 1, byteoffset - 1)
        end
    end
end


function NewTaskPressed()

    if NewTaskWindowState then

        --Start name insert
        local NameInsertX =  0.15 * love.graphics.getWidth();
        local NameInsertY = 0.25 * love.graphics.getHeight() + 75;
        if love.mouse.getY() > NameInsertY and love.mouse.getY() < NameInsertY + 50 and love.mouse.getX() > NameInsertX and love.mouse.getX() < NameInsertX + 500 then
            CurrentlyWrittingName = true
        else
            CurrentlyWrittingName = false
        end

    end 

end

function CreateNewTask()

    NewTaskWindowState = not NewTaskWindowState;

end