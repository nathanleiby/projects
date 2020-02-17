PlayState = Class{__includes = BaseState}

NUM_PLAYERS = 2
function PlayState:init()
    self.gameMap = GameMap()

    self.players = {}     
    for i=1,NUM_PLAYERS do
      self.players[i] = Player(i)
    end
end

function PlayState:update(dt)
    for i=1,#self.players do
        self.players[i].input:update()
        local input = self.players[i].input
        local x, y = input:get('move')
        if input:pressed('left') or input:pressed('right') or input:pressed('up') or input:pressed('down') then
            self.players[i]:move(x, y)
        end
        self.players[i]:update(dt)
    end
end

function PlayState:render()
    self.gameMap:render()

    for i=1,#self.players do
        self.players[i]:render()
    end
end