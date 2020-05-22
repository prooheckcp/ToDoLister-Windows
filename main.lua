--//All the requires\\--
require 'images/images-handler';
require 'lib/json'; --Json library
require 'Code/MainWindow/window';

--/Variables\--
local Assets;
local CurrentTab = 0;

function love.load()
    LoadImages();
    Assets = GetImages();
end

function love.update()

end

function love.draw()

    --Main Background
    love.graphics.draw(Assets.MainBackground, 0, 0, 0, love.graphics.getWidth()/Assets.MainBackground:getWidth(), love.graphics.getHeight()/Assets.MainBackground:getHeight());

    --The current main screen tabs
    if CurrentTab == 0 then
        DrawTasksWindow();
    elseif CurrentTab == 1 then

    end
end

