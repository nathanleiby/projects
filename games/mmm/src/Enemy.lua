Enemy = Class{}

ENEMY_ANIMATION_DELAY = 0.1

function Enemy:init()
    self.mapX = 30
    self.mapY = 2.5

    self.attacking = false
    self.attackPhase = 0
end

function Enemy:attack()
    -- Play Sound
    -- local r = math.random() + 1
    -- print(r)
    -- gSounds['laser']:setPitch(r)
    -- love.audio.play(gSounds['laser'])

    -- Do attack animation
    self.attacking = true
    self.attackPhase = 1
    self.lastAnimationAt = love.timer.getTime()
end

function Enemy:update(dt)
    if (self.attacking and self.attackPhase < 4 and love.timer.getTime() - self.lastAnimationAt >= ENEMY_ANIMATION_DELAY) then
        self.attackPhase = self.attackPhase + 1
        self.lastAnimationAt = love.timer.getTime()
    end

    if (self.attacking and self.attackPhase >= 4) then
        self.attacking = false
    end
end

function Enemy:render()
    local x = (self.mapX -1) * TILE_SIZE
    local y = (self.mapY - 1) * TILE_SIZE

    love.graphics.setColor({1,1,1})
    local scale = 2

    local sprite = "enemy_wizard_attack_04.png"
    if (self.attacking) then
        local attackPhaseString = tostring(self.attackPhase)
        sprite = "enemy_wizard_attack_0"..attackPhaseString..".png"
    end

    iffy.drawSprite(sprite, x, y, 0, scale, scale)
end