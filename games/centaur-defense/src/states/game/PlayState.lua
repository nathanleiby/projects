PlayState = Class{__includes = BaseState}

NUM_PLAYERS = 2
ENEMY_INTERVAL = 2 -- seconds
function PlayState:init()
    self.gameMap = GameMap()
    self.health = 10

    self.players = {}     
    for i=1,NUM_PLAYERS do
      self.players[i] = Player(i)
    end

    self.enemies = {}
    self.enemyTicker = 0
end

function PlayState:update(dt)
    -- Update the global timer group
    Timer.update(dt)

    -- handle player behavior
    for i=1,#self.players do
        self.players[i].input:update()
        local input = self.players[i].input
        local x, y = input:get('move')
        if input:pressed('left') or input:pressed('right') or input:pressed('up') or input:pressed('down') then
            self.players[i]:move(x, y)
        end
        self.players[i]:update(dt)
    end

    -- handle enemy behavior
    local endLoc = self.gameMap:enemyEndLocation()
    for i=#self.enemies,1,-1 do
        self.enemies[i]:update(dt)
        if self.enemies[i].mapX == endLoc.x and self.enemies[i].mapY == endLoc.y then
            self.health = self.health - 1
            table.remove(self.enemies, i)
        end
    end

    -- Spawn new enemies
    self.enemyTicker = self.enemyTicker + dt
    if self.enemyTicker > ENEMY_INTERVAL then
        self.enemyTicker = self.enemyTicker - ENEMY_INTERVAL
        local loc = self.gameMap:enemyStartLocation()
        lume.push(self.enemies, Enemy(loc.x, loc.y))
    end
end

function PlayState:render()
    self.gameMap:render()

    for i=1,#self.enemies do
        self.enemies[i]:render()
    end

    -- render players last
    for i=1,#self.players do
        self.players[i]:render()
    end

    love.graphics.setColor(COLORS.BLACK)
    love.graphics.print("Health: " .. self.health, VIRTUAL_WIDTH-70, 5)
    love.graphics.setColor(COLORS.WHITE)
end