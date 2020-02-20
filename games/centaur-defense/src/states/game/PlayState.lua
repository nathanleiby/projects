PlayState = Class{__includes = BaseState}

local NUM_PLAYERS = 2
local MINIMUM_SPAWN_INTERVAL = 0.5

function PlayState:init()
    self.gameMap = GameMap()
    self.health = 10

    self.players = {}     
    for i=1,NUM_PLAYERS do
      self.players[i] = Player(i)
    end

    self.enemies = {}
    self.enemySpawnInterval = 2 -- seconds
    self.enemiesSpawned = 0
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

        for j=1,#self.enemies do
            if self.players[i]:checkForCollision(self.enemies[j]) then
                self.enemies[j]:die()
            end
        end
    end

    -- handle enemy behavior
    local endLoc = self.gameMap:enemyEndLocation()
    for i=#self.enemies,1,-1 do
        -- move
        self.enemies[i]:update(dt)

        -- check if enemy has entered the "endzone", causing damage
        if self.enemies[i].mapX == endLoc.x and self.enemies[i].mapY == endLoc.y then
            self.health = self.health - 1
            table.remove(self.enemies, i)
        end

        -- check if dead and fully expired
        if self.enemies[i]:isExpired() then
            table.remove(self.enemies, i)
        end
    end

    -- Spawn new enemies
    self.enemyTicker = self.enemyTicker + dt
    if self.enemyTicker > self.enemySpawnInterval then
        self.enemyTicker = self.enemyTicker - self.enemySpawnInterval
        local loc = self.gameMap:enemyStartLocation()

        lume.push(self.enemies, Enemy(loc.x, loc.y))
        self.enemiesSpawned = self.enemiesSpawned + 1

        -- speed up spawn rate every n enemies
        if (self.enemiesSpawned % 5 == 0) then
            self.enemySpawnInterval = math.max(self.enemySpawnInterval - .1, MINIMUM_SPAWN_INTERVAL)
        end
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