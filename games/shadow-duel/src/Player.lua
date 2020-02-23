Player = Class{}

function Player:init()
    self.mapX = 1
    self.mapY = 1

    self.input = baton.new {
        controls = {
            left = {'key:left', 'axis:leftx-', 'button:dpleft'},
            right = {'key:right', 'axis:leftx+', 'button:dpright'},
            up = {'key:up', 'axis:lefty-', 'button:dpup'},
            down = {'key:down', 'axis:lefty+', 'button:dpdown'},
            action = {'key:return', 'button:a'},
        },
        pairs = {
            move = {'left', 'right', 'up', 'down'}
        },
        joystick = love.joystick.getJoysticks()[playerNum],
    }
end

function Player:update(dt)

end

function Player:render()
    local x = (self.mapX -1) * TILE_SIZE
    local y = (self.mapY - 1) * TILE_SIZE

    love.graphics.setColor({1,1,1})
    local scale = 2
    iffy.drawSprite("wizard-attack", x, y, 0, scale, scale)
end
