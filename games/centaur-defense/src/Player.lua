Player = Class{}

local YELLOW = {1,1,0}
local PURPLE = {1,0,1}

function Player:init(playerNum)
    self.playerNum = playerNum

    self.mapX = playerNum 
    self.mapY = 1

    if playerNum == 1 then
        self.color = YELLOW
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
            joystick = love.joystick.getJoysticks()[1],
        }
    elseif playerNum == 2 then
        self.color = PURPLE
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
            joystick = love.joystick.getJoysticks()[2],
        }
    end
end

function Player:move(x,y)
    self.mapX = self.mapX + lume.round(x)
    self.mapY = self.mapY + lume.round(y)
end

function Player:update(dt)
end

local TILE_SIZE = 16 -- TODO: global consts?

function Player:render()
    local x = (self.mapX -1) * TILE_SIZE
    local y = (self.mapY - 1) * TILE_SIZE

    love.graphics.setColor(self.color)
    local radius = TILE_SIZE/2
    love.graphics.circle('fill', x+radius, y+radius, radius)
    love.graphics.setColor({1,1,1})
end