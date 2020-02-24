Background = Class{}

local yBar = VIRTUAL_HEIGHT / 8

function Background:init()
    self.wPos = 0 -- wave position
end

function Background:update(dt)
    self.wPos = (self.wPos + dt)
    if self.wPos > 2 * math.pi then
        self.wPos = self.wPos - 2 * math.pi
    end
end

local NUM_DOTS = 100
local DOT_RADIUS = 2
function Background:render()
    -- Draw a (moving!) sine wave
    love.graphics.setColor(COLORS.BROWN)
    love.graphics.rectangle( 'fill', 0, yBar, VIRTUAL_WIDTH, yBar/2)

    love.graphics.setColor(COLORS.WHITE)
    local xOffset = self.wPos
    for i=1,NUM_DOTS do
        local x = i * (VIRTUAL_WIDTH/NUM_DOTS)
        local yOffset = (3 * yBar /4) * math.sin(x + self.wPos)
        love.graphics.circle('fill', x, yBar + yOffset, DOT_RADIUS)
    end


    -- Draw a rainbow

    for i=1,7 do
        local h = yBar/4
        local y = yBar*4 + (i-1)*h
        love.graphics.setColor(RAINBOW[i])
        love.graphics.rectangle('fill', 0, y, VIRTUAL_WIDTH, h)
    end
    love.graphics.setColor(COLORS.WHITE)
end