local CurrentTab = 0;

local NewTask;

function DrawTasksWindow (Assets)

    --Main frame

    --[[

    Image(Assets.MainFrame, 
    love.graphics.getWidth()/2 -  845/2, 
    love.graphics.getHeight()/2 - 470/2, 
    845, 
    470);

    --]]

    --Frame

    love.graphics.setColor(0, 0, 0, 0.5);
    love.graphics.rectangle('fill', 0, love.graphics.getHeight()- 100, love.graphics.getWidth(), 100);
    love.graphics.setColor(1, 1, 1, 1);

    --Add new task
    NewTask = ImageButton(Assets.Plus,
    50, 
    love.graphics.getHeight() - 87.5,
    75,
    75,
    Assets.HoveredPlus,
    'Create New Task'
    );


    if CurrentTab == 0 then

    elseif CurrentTab == 1 then

    end


end

function MainWindowPressed()

    if NewTask.hovered then
        CreateNewTask();
    end

end