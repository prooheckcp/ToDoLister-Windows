--/Variables\--
local utf8 = require("utf8")

local NewTaskWindowState = true;
function GetNewTaskWindowState() return NewTaskWindowState end 
local NewtaskName = '';
local NewTaskDesc = '';

local CreateButton;

local CurrentlyWrittingName = false;
local CurrentlyWrittingDesc = false;

local EndOfPhraseTimer = 0;
local EndOfPhraseStatus = false;

function DrawNewTaskWindow(Assets)


    if NewTaskWindowState then

        if EndOfPhraseTimer < 0.75 then
            EndOfPhraseTimer = EndOfPhraseTimer + love.timer.getDelta();
        else
            EndOfPhraseTimer = 0;
            EndOfPhraseStatus = not EndOfPhraseStatus;
        end

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

    --Display the written new task name
    if EndOfPhraseStatus and CurrentlyWrittingName then
        BetterText(NewtaskName .. '-', 0.15 * love.graphics.getWidth(), 0.25 * love.graphics.getHeight() + 75, 0.7, 0.7);
    else
        BetterText(NewtaskName, 0.15 * love.graphics.getWidth(), 0.25 * love.graphics.getHeight() + 75, 0.7, 0.7);
    end
    BetterText('Description:', 0.15 * love.graphics.getWidth(), 0.25 * love.graphics.getHeight() + 125, 1, 1);

    if not CurrentlyWrittingDesc then
        love.graphics.setColor(0.95, 0.95, 0.95, 1);
    else
        love.graphics.setColor(RGB(255, 252, 184))
    end

    love.graphics.rectangle('fill', 0.15 * love.graphics.getWidth(), 0.25 * love.graphics.getHeight() + 200, 500, 150);
    love.graphics.setColor(1, 1, 1, 1);

    --Display the written new task description
    if EndOfPhraseStatus and CurrentlyWrittingDesc then
        BetterText(NewTaskDesc ..'-', 0.15 * love.graphics.getWidth(), 0.25 * love.graphics.getHeight() + 200, 0.7, 0.7);
    else
        BetterText(NewTaskDesc, 0.15 * love.graphics.getWidth(), 0.25 * love.graphics.getHeight() + 200, 0.7, 0.7);
    end

    
    --Create button
    CreateButton = ImageButton(Assets.MediumButton, 0.15 * love.graphics.getWidth(), 0.25 * love.graphics.getHeight() + 400, 257.5, 70, Assets.HoveredMediumButton);
    BetterText('Create', 0.15 * love.graphics.getWidth() + 40, 0.25 * love.graphics.getHeight() + 400, 1)


    end

end

function love.textinput(t)

    if NewTaskWindowState and CurrentlyWrittingName then
        NewtaskName = NewtaskName .. t
    elseif NewTaskWindowState and CurrentlyWrittingDesc then
        NewTaskDesc = NewTaskDesc .. t
    end

    
end
 


function NewTaskKeyboard(key)

--Handle the writings of the windows

    if NewTaskWindowState and CurrentlyWrittingName then

        NewtaskName = RemoveCharacter(key, NewtaskName);

    end

    if NewTaskWindowState and CurrentlyWrittingDesc then

        NewTaskDesc = RemoveCharacter(key, NewTaskDesc);
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


        --0.15 * love.graphics.getWidth(), 0.25 * love.graphics.getHeight() + 200
        local DescInsertX = 0.15 * love.graphics.getWidth();
        local DescInsertY = 0.25 * love.graphics.getHeight() + 200;
        if love.mouse.getX() > DescInsertX and love.mouse.getX() < DescInsertX + 500 and love.mouse.getY() > DescInsertY and love.mouse.getY() < DescInsertY + 150 then
            CurrentlyWrittingDesc = true
        else
            CurrentlyWrittingDesc = false
        end

    end 


    if CreateButton.hovered then
        AddNewTask(NewtaskName, NewTaskDesc);
    end

end


function AddNewTask(name, description)
    print('Created a new task')
end

function CreateNewTask()

    NewTaskWindowState = not NewTaskWindowState;

end










--Do not touch ma boy
function RemoveCharacter(key, textString)
    --Handle name

    print(key)
    if key == "backspace" then
        -- get the byte offset to the last UTF-8 character in the string.
        local byteoffset = utf8.offset(textString, -1)
 
        if byteoffset then
            -- remove the last UTF-8 character.
            -- string.sub operates on bytes rather than UTF-8 characters, so we couldn't do string.sub(text, 1, -2).
            return string.sub(textString, 1, byteoffset - 1)
        else
            return textString
        end
    elseif key == "return" then
        return textString ..'\n'
    else
        return textString
    end
end