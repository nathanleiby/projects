Player = Class{}

function Player:init(playerNum)
    self.playerNum = playerNum

    self.mapX = playerNum 
    self.mapY = 1

    if playerNum == 1 then
        self.color = COLORS.YELLOW
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
    elseif playerNum == 2 then
        self.color = COLORS.PURPLE 
        self.input = baton.new {
            -- TODO: Add a PR to baton to expose all key names as consts for autocomplete,
            -- keys.. get them from https://love2d.org/wiki/KeyConstant
            -- others..
            controls = {
                left = {'key:a', 'axis:leftx-', 'button:dpleft'},
                right = {'key:d', 'axis:leftx+', 'button:dpright'},
                up = {'key:w', 'axis:lefty-', 'button:dpup'},
                down = {'key:s', 'axis:lefty+', 'button:dpdown'},
                action = {'key:f', 'button:a'},
            },
            pairs = {
                move = {'left', 'right', 'up', 'down'}
            },
            joystick = love.joystick.getJoysticks()[playerNum],
        }
    end
end

function Player:move(x,y)
    self.mapX = self.mapX + lume.round(x)
    self.mapY = self.mapY + lume.round(y)
end

function Player:update(dt)

end

function Player:render()
    local x = (self.mapX -1) * TILE_SIZE
    local y = (self.mapY - 1) * TILE_SIZE

    love.graphics.setColor(self.color)
    local radius = TILE_SIZE/2
    love.graphics.circle('fill', x+radius, y+radius, radius)
    love.graphics.setColor({0,0,0})
    love.graphics.printf(self.playerNum, x, y, radius*2, "center")
    love.graphics.setColor({1,1,1})
end