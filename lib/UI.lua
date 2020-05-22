function Image(image, x, y, w, h)

    local ww = w/image:getWidth();
    local hh = h/image:getHeight();

    love.graphics.draw(image, x, y, 0, ww, hh);

end

function ImageScale()

end

function ImageButton(image, x, y, w, h, image2, hoveringMessage)

    local state = {hovered = false};
    local ww = w/image:getWidth();
    local hh = h/image:getHeight();


    if image2 ~= nil then
        
        if love.mouse.getX() > x and love.mouse.getX() < x + w and love.mouse.getY() > y and love.mouse.getY() < y + h then


            love.graphics.draw(image2, x, y, 0, ww, hh);

            if hoveringMessage ~= nil then
                BetterText(hoveringMessage, love.mouse.getX() + 20, love.mouse.getY() - 15, 0.4, 0.4);
            end

            state.hovered = true;
        else
            love.graphics.draw(image, x, y, 0, ww, hh);
            state.hovered = false;
        end

    else
        love.graphics.draw(image, x, y, 0, ww, hh);
    end

    

    return state;

end

function BetterText(String, PosX, PosY, SizeX, SizeY)
  
    if SizeX == nil then
      SizeX = 1
    end
    
    if SizeY == nil then
      SizeY = 1
    end  
    
      love.graphics.setColor(0, 0, 0)
      --Text Stroke
      --I printed it 8 times because its the only possible way of creating a stroke effect on love2d
      love.graphics.print(String, PosX + 1, PosY, 0, SizeX, SizeY)
      love.graphics.print(String, PosX + 1, PosY + 1, 0, SizeX, SizeY)
      love.graphics.print(String, PosX + 1, PosY - 1, 0, SizeX, SizeY)
      love.graphics.print(String, PosX - 1, PosY, 0, SizeX, SizeY)
      love.graphics.print(String, PosX - 1, PosY + 1, 0, SizeX, SizeY)
      love.graphics.print(String, PosX - 1, PosY - 1, 0, SizeX, SizeY)
      love.graphics.print(String, PosX , PosY + 1, 0, SizeX, SizeY)
      love.graphics.print(String, PosX, PosY - 1, 0, SizeX, SizeY)
  
    --Front text
    love.graphics.setColor(1, 1, 1)
    love.graphics.print(String, PosX , PosY, 0, SizeX, SizeY)
    
    
  end  
  
  function RGB(r, g, b)
    return {r/255, g/255, b/255}
  end  