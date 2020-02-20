Enemy = Class{}

function Enemy:init(mapX, mapY)
    self.mapX = mapX
    self.mapY = mapY

    Timer.every(1, function()
        self:move(1,0)
    end)

    self.color = COLORS.RED
    self.dead = false
end

function Enemy:move(x,y)
    if self.dead then 
        return 
    end

    self.mapX = self.mapX + lume.round(x)
    self.mapY = self.mapY + lume.round(y)
end

function Enemy:die()
    -- only die once!
    if self.dead then 
        return 
    end
    self.dead = true
    self.timeSinceDeath = 0
end

function Enemy:isExpired()
    return self.dead and self.timeSinceDeath > 3
end

function Enemy:update(dt)
    -- once dead, stick around for a bit and then disappear
    if self.dead then
        self.timeSinceDeath = self.timeSinceDeath + dt
    end
end

function Enemy:render()
    local x = (self.mapX -1) * TILE_SIZE
    local y = (self.mapY - 1) * TILE_SIZE

    local scale = 0.5
    if self.dead then
        -- blood .. squish!
        love.graphics.setColor({1, 0, 0, .3})
        local radius = (TILE_SIZE-4)/2 
        love.graphics.circle('fill', x+radius, y+radius, radius)

        love.graphics.setColor({1,1,1})
        iffy.drawSprite("medievalUnit_01.png", x, y, math.pi/4, scale, scale)
    else
        iffy.drawSprite("medievalUnit_01.png", x, y, 0, scale, scale)
    end
end