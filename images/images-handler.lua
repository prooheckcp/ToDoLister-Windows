--//Images\\--
local AllImages = {

}; --Array that handles all software images




function LoadImages()
    --The background image of the project
    AllImages.MainBackground = love.graphics.newImage('/images/png/background3.png');
    --Main frame
    AllImages.MainFrame = love.graphics.newImage('/images/png/frames/level select.png');
    --Plus sign
    AllImages.Plus = love.graphics.newImage('/images/png/buttons/normal/plus.png');
    AllImages.HoveredPlus = love.graphics.newImage('/images/png/buttons/hover/plus.png');

    AllImages.MainBackground2 = love.graphics.newImage('/images/png/freepack/OptionsBackground.png');

end

function GetImages()
    return AllImages;
end