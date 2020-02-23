PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.score = 0

    self.player = Player()
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

    -- render players last
    self.player:render()

    love.graphics.print("Score: " .. self.score, VIRTUAL_WIDTH-70, 20)
    love.graphics.setColor(COLORS.WHITE)
end
