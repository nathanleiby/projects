StartState = Class{__includes = BaseState}

function StartState:init()
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

function StartState:update(dt)
    self.input:update()
    if self.input:pressed('action') then
        gStateMachine:change('play')
    end
end

function StartState:render()
    love.graphics.print("PRESS ENTER", VIRTUAL_WIDTH/2 - 40, VIRTUAL_HEIGHT/2)
    love.graphics.setColor(COLORS.WHITE)
end
