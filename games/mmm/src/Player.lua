Player = Class{}

PLAYER_ANIMATION_DELAY = 0.1

function Player:init()
    self.mapX = 1
    self.mapY = 2.5
    self.attacking = false
    self.attackPhase = 0

    self.input = baton.new {
        controls = {
            left = {'key:left', 'axis:leftx-', 'button:dpleft'},
            right = {'key:right', 'axis:leftx+', 'button:dpright'},
            up = {'key:up', 'axis:lefty-', 'button:dpup'},
            down = {'key:down', 'axis:lefty+', 'button:dpdown'},
            action = {'key:space', 'button:a'},
        },
        pairs = {
            move = {'left', 'right', 'up', 'down'}
        },
        joystick = love.joystick.getJoysticks()[playerNum],
    }
end

function Player:attack()
    self.attacking = true
    self.attackPhase = 1
    self.lastAnimationAt = love.timer.getTime()
end

function Player:update(dt)
    if (self.attacking and self.attackPhase < 4 and love.timer.getTime() - self.lastAnimationAt >= PLAYER_ANIMATION_DELAY) then
        self.attackPhase = self.attackPhase + 1
        self.lastAnimationAt = love.timer.getTime()
    end

    if (self.attacking and self.attackPhase >= 4) then
        self.attacking = false
    end
end

function Player:render()
    local x = (self.mapX -1) * TILE_SIZE
    local y = (self.mapY - 1) * TILE_SIZE

    love.graphics.setColor({1,1,1})
    local scale = 2

    local sprite = "player_wizard_attack_04.png"
    if (self.attacking) then
        local attackPhaseString = tostring(self.attackPhase)
        sprite = "player_wizard_attack_0"..attackPhaseString..".png"
    end

    iffy.drawSprite(sprite, x, y, 0, scale, scale, 4)
end
