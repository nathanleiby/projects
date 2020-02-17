Enemy = Class{}

function Enemy:init(mapX, mapY)
    self.mapX = mapX
    self.mapY = mapY

    Timer.every(1, function()
        self:move(1,0)
    end)

    self.color = COLORS.RED
end

function Enemy:move(x,y)
    self.mapX = self.mapX + lume.round(x)
    self.mapY = self.mapY + lume.round(y)
end

function Enemy:update(dt)
end

function Enemy:render()
    local x = (self.mapX -1) * TILE_SIZE
    local y = (self.mapY - 1) * TILE_SIZE

    love.graphics.setColor(self.color)
    local radius = TILE_SIZE/2
    love.graphics.circle('fill', x+radius, y+radius, radius)
    love.graphics.setColor({0,0,0})
    love.graphics.printf("E", x, y, radius*2, "center")
    love.graphics.setColor({1,1,1})
end