--//All the requires\\--
require 'images/images-handler';
require 'lib/json'; --Json library
require 'Code/MainWindow/window';
require 'lib/UI';
require 'Code/Services/jsonServices';

--/Variables\--
local Assets;

function love.load()
    LoadImages();
    Assets = GetImages();

    --Set text
    love.graphics.setNewFont('ashcanbb_bold.ttf', 50); -- the number denotes the font size

end

function love.update()

end

function love.draw()

    --Main Background
    love.graphics.draw(Assets.MainBackground2, 0, 0, 0, love.graphics.getWidth()/Assets.MainBackground2:getWidth(), love.graphics.getHeight()/Assets.MainBackground2:getHeight());

    --The current main screen tabs
        DrawTasksWindow(Assets);

    --The New task window
        DrawNewTaskWindow(Assets);

end

function love.keypressed(key)


    NewTaskKeyboard(key);

end


function love.mousepressed()
    MainWindowPressed();
    NewTaskPressed();
end

function love.mousereleased()

end

