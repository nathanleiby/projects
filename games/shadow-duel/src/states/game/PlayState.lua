PlayState = Class{__includes = BaseState}

local yBar = VIRTUAL_HEIGHT / 8
local rainbow = {
    COLORS.RED,
    COLORS.ORANGE,
    COLORS.YELLOW,
    COLORS.GREEN,
    COLORS.BLUE,
    COLORS.INDIGO,
    COLORS.VIOLET,
}

function PlayState:init()
    self.score = 0

    self.player = Player()
    self.wavState = nil
end

function PlayState:update(dt)
    self.players.input:update()
    local input = self.player.input
    -- local x, y = input:get('move')
    -- if input:pressed('left') or input:pressed('right') or input:pressed('up') or input:pressed('down') then
        -- attack
    -- end
    self.player:update(dt)
end

function PlayState:render()
    -- self.gameMap:render()
    -- BACKGROUND
    -- Draw a (moving!) sine wave
    love.graphics.setColor(COLORS.BROWN)
    love.graphics.rectangle( 'fill', 0, yBar, VIRTUAL_WIDTH, yBar/2)

    -- Draw a rainbow

    for i=1,7 do
        local h = yBar/4
        local y = yBar*4 + (i-1)*h
        love.graphics.setColor(rainbow[i])
        love.graphics.rectangle('fill', 0, y, VIRTUAL_WIDTH, h)
    end
    love.graphics.setColor(COLORS.WHITE)

    -- FOREGROUND
    -- render players last
    self.player:render()

    love.graphics.print("Score: " .. self.score, VIRTUAL_WIDTH-70, 20)
    love.graphics.setColor(COLORS.WHITE)
end
