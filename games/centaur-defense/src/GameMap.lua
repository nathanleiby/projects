
GameMap = Class{}

local function closestPoint(x,y, points)
    local closest = nil
    local minDistance = 99999999
    for k, v in pairs(points) do
        local distance = math.sqrt(math.pow(k.x - x, 2) + math.pow(k.y - y, 2))
        if distance < minDistance then
            closest = k
            minDistance = distance
        end
    end
    return closest
end

function GameMap:init()
    -- initialize GameMap
    self.tiles = {}
    self.mapHeight = 22
    self.mapWidth = 40


    -- voronai map generation
    -- https://gamedev.stackexchange.com/a/79050/135993
    local numCenterPts = math.random(5,30)
    print("GameMap:init() with numCenterPts=" .. numCenterPts)
    local centerPts = {}
    local kinds = {"grass", "water"}
    for i=1,numCenterPts do
        local pt = {
            x=math.random(1,self.mapWidth),
            y=math.random(1,self.mapHeight)
        }
        centerPts[pt] = kinds[(i % #kinds) + 1]
    end

    for y=1,self.mapHeight do
        local row = {}
        for x=1,self.mapWidth do
            local close = closestPoint(x,y, centerPts)
            local kind = centerPts[close]
            table.insert(row, Tile(x, y, kind))
        end
        table.insert(self.tiles, row)
    end

    -- generate path(s) and enemy start location(s)
    -- start with a simple path from left to right
    local centering = 5
    local y=math.random(1+centering, self.mapHeight-centering)
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
