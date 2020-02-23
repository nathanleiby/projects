Enemy = Class{}

function Enemy:init()
    self.mapX = 30
    self.mapY = 2.5
end

function Enemy:update(dt)

end

function Enemy:render()
    local x = (self.mapX -1) * TILE_SIZE
    local y = (self.mapY - 1) * TILE_SIZE

    love.graphics.setColor({1,1,1})
    local scale = 2
    iffy.drawSprite("enemy_wizard_attack_04.png", x, y, 0, scale, scale)
end
