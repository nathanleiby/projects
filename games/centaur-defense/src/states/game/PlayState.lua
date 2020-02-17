PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.gameMap = GameMap()
end

function PlayState:update(dt)
    -- self.player:update(dt)
end

function PlayState:render()
    self.gameMap:render()
end