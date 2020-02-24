PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.score = 0
    self.background = Background()
    self.player = Player()
    self.enemy = Enemy()
end

function PlayState:update(dt)
    self.background:update(dt)

    self.player.input:update()
    local input = self.player.input
    -- local x, y = input:get('move')
    if input:pressed('action') then
        self.player:attack()
    end

    self.player:update(dt)
end

function PlayState:render()
    -- self.gameMap:render()
    -- BACKGROUND
    self.background:render()

    -- FOREGROUND
    -- render players last
    self.player:render()
    self.enemy:render()

    love.graphics.print("Score: " .. self.score, VIRTUAL_WIDTH-70, 20)
    love.graphics.setColor(COLORS.WHITE)
end
