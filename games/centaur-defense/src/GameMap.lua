
GameMap = Class{}

function GameMap:init()
    -- initialize GameMap
    self.tiles = {}
    self.mapHeight = 18
    self.mapWidth = 32

    for y=1,self.mapHeight do
        local row = {}
        for x=1,self.mapWidth do
            table.insert(row, Tile(x, y))
        end
        table.insert(self.tiles, row)
    end

    -- generate path(s) and enemy start location(s)
    -- start with a simple path from left to right
    local y=math.random(2,self.mapHeight-1)
    for x=1,self.mapWidth do
        self.tiles[y][x].kind = "path"
    end
    self.enemyStart = {x=1,y=y}
    self.enemyEnd = {x=self.mapWidth+1,y=y}

end

function GameMap:enemyStartLocation()
    return self.enemyStart
end

function GameMap:enemyEndLocation()
    return self.enemyEnd
end

function GameMap:render()
    for y=1, self.mapHeight do
        for x= 1, self.mapWidth do
            self.tiles[y][x]:render()
        end
    end
end
