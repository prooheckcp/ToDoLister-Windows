--//Images\\--
local AllImages = {

}; --Array that handles all software images




function LoadImages()
    AllImages.MainBackground = love.graphics.newImage('/images/png/background2.png');
end

function GetImages()
    return AllImages;
end